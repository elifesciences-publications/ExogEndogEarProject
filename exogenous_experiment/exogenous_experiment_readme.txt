Data processing of the exogenous experiment (called experiment 3 or exp3)
is done in several Matlab scripts that save many intermediate steps.

1. exp3_Preprocessing.m (1)

This is the initial script for the exogenous (exp3) experiment.
Preprocessing steps include: synchronizing the data with the recorded
video data, filtering, rereferencing

raw data files have a combined size of ~95 GB and preprocessed data ~15 GB

requires: exp3_processEMG.m  (2)
          triggerDetection2.m (3)
          raw data(Sxx_exp3.mat, where xx is the subject identifier)

2. exp3_preprocessed_to_matrix_time.m (4) 

reorganizes preprocessed data into separate .mat files for every
stimulus type. saves only data recorded during stimulus presentation
and a 3 seconds period before stimulus onset and 3 seconds
after stimulus offset 
generated files are approximately 2.25 GB large

requires: exp_3_stimulation_order.mat
	  preprocessed data(subject_xx_exp3_preprocessed_time.mat)


3. exp3_generate_new_dataset_eog_ecg_normalization_x4.m (5)
performes baseline correction and normalization of the signal's rms-envelopes.
- saves all individual responses as exp3_4x_normalized_cube_eog_ecg.mat (~2.4 GB)
- saves averaged responses per stimulus as exp3_4x_normalized_eog_ecg.mat (~ 800 MB)
- saves ipsi/contralaterally averaged responses per stimulus as exp3_results_normalized4x_eog_ecg_ipsiCont.mat (~770 MB)


requires:
exp3_gen_data_helper_pam.m (6)
exp3_gen_data_helper_aam.m (7)
exp3_gen_data_helper_tam.m (8)
exp3_gen_data_helper_sam.m (9)
exp3_gen_data_helper_neck.m (10)
exp3_gen_data_helper_ecg.m (11)
exp3_gen_data_helper_eog.m (12)
exp6_eog_peakstats.mat
data from the previous step



4. exp3_normalizedx4_to_SPSS.m (13)
This script averages ipsi/contralateral responses in the range of 100-1500 ms
for every subject and organizes them with the corresponding age group
in a table.
This table can be exported and used for statistical analysis in another program (e.g. SPSS)

requires:
exp3_results_normalized4x_eog_ecg_ipsiCont.mat 

5. exp3_plotting_ipsiCont_sweepmatrices.m (14)
This script generates matrices of ipsi/contralaterally averaged single responses
and plots them as used in the paper/supplementary material

requires:
exp3_reshape_cube_to_ipsiCont_matrix.m (15)
exp3_4x_normalized_cube_eog_ecg.mat
 
6. exp3_generate_table_for_plotting (16)
This script generates a table with a heavily downsampled version of
the average ipsi/contralateral responses. Downsampling is performed
for plotting purposes only.
The table T can be exported and used for plotting in an external program.

requires:
exp3_results_normalized4x_eog_ecg_ipsiCont.mat