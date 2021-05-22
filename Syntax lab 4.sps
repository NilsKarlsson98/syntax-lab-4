* Encoding: UTF-8.


MIXED pain WITH age STAI_trait pain_cat cortisol_serum mindfulness sex1
  /CRITERIA=DFMETHOD(SATTERTHWAITE) CIN(95) MXITER(100) MXSTEP(10) SCORING(1) 
    SINGULAR(0.000000000001) HCONVERGE(0, ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)    
  /FIXED=age STAI_trait pain_cat cortisol_serum mindfulness sex1 | SSTYPE(3)
  /METHOD=REML
  /PRINT=SOLUTION
  /RANDOM=INTERCEPT | SUBJECT(hospital) COVTYPE(VC)
  /SAVE=FIXPRED.

DESCRIPTIVES VARIABLES=FXPRED_7
  /STATISTICS=VARIANCE.

DATASET ACTIVATE DataSet10.
COMPUTE predicted_value_dataset_A=2.68 + ( - 0.02 * age - 0.05 * STAI_trait + 0.08 * pain_cat + 
    0.63 * cortisol_serum - 0.19 * mindfulness - 0.2 * sex1).
EXECUTE.

COMPUTE predicted_res=predicted_value_dataset_A - pain.
EXECUTE.

COMPUTE predicted_res_sq=predicted_res * predicted_res.
EXECUTE.

DESCRIPTIVES VARIABLES=predicted_res_sq
  /STATISTICS=MEAN SUM.

DESCRIPTIVES VARIABLES=pain
  /STATISTICS=MEAN SUM.

COMPUTE pain_mean_res=pain - Pain_mean.
EXECUTE.

COMPUTE pain_mean_res_sq=pain_mean_res * pain_mean_res.
EXECUTE.

DESCRIPTIVES VARIABLES=pain_mean_res_sq
  /STATISTICS=MEAN SUM.
