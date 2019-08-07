Data processing of the endogenous experiment (exp4)

1. exp4_Preprocessing.m (1)

Initial script for the endogenous (exp4) experiment.
Performs preprocessing: filtering, rereferencing, wavelet decomposition

raw data: ~148 GB
preprocessed data: ~ 51 GB

requires:
exp4_processEMG.m (2)
exp4_getFeaturesEMG.m (3)
exp4_cut_story.m (4)
triggerDetection2.m (5)


2. two ways of analysis can  be used:

a) perform artifact filtering based only on the auricular channels:

2.a) exp4_preprocessed_data_to_artfilt_and_normalization.m (6)
requires:
- exp4_buffer_artfilt_average.m (7) -> performs artifact filtering and averaging on time signal
- exp4_buffer_artfilt_average_mra.m (8) -> performs artifact filtering and averaging on decomposed signal
- artfilt_std.m (9)
- exp4_raw_artilt_normalization.m (10) -> performs normalization
- exp4_averaged_normalized_artfilt_to_ipsiCont_table.m (11) -> groups data to ipsi/contralateral responses
and generated a table for statistical inference

b) additionaly use the M.SCM and EOG data to remove artifacts from
the auricular muscle channels. This is done to make sure that results
from a) are not due to head and/or eye movements:

2.b) exp4_artfilt_based_on_eog_mscm.m (12)

requires:
- exp4_buffer_artfilt_valid_segments (13) -> flags artifacts in the time signal
- exp4_buffer_artfilt_valid_segments_MRA (14) -> flags artifacts in the decomposed signal
- exp4_buffer_artfilt_eog_valid_segments (15) -> flags artifacts in the eog signal
- exp4_averaged_raw_valid_to_nan_artfilt_signal_and_mra (16) -> removes all flagged segments
- exp4_valid_nan_segments_normalization (17) -> performs normalizatzion
- exp4_normalized_valid_nan_segments_to_ipsiCont_table (18) -> groups data to ipsi/contralateral responses
and generated a table for statistical inference




