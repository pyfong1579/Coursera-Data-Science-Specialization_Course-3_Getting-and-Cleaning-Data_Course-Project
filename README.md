# Getting-and-Cleaning-Data-Course-Project (Peer Reviewed Assessment)
To demonstrate ability to collect, work with, and clean a data set with the goal of preparing tidy data that can be used for later analysis.

Repository contains:- 
  1. R script "run_analysis.R
  2. Subdirectory "UCI HAR Dataset" containing the original datasets
  3. Merged data set "merged_clean_data.txt"
  4. Summary Dataset "averaged_data_by_activity_and_subject.txt"

The script run_analysis.R uses the dplyr package to executeand meet the requirements of the project assignment.
Details are included in script comments.

Script Process as follows:-
  1. The data files required, are downloaded and unzipped into a sub directory in the R workspace named UCI HAR Dataset.
  2. The test and training elements of files X_test.txt, X_train.txt, Y_test.txt, Y_train.txt, subject_test.txt and subject_train.txt are merged correspondingly by rows.
  3. X data set containing measurements have header names added from file feature.txt, the mean and std deviation measurements are extracted and headers are cleaned.
  4. Y dataset values are converted to labels corresponding to activity_labels and the header "activity" is added.
  5. The subject dataset has the header "subject" added.
  6. The 3 data sets are merged by column and stored as file "merged_clean_data.txt"
  7. A summary dataset is then produced summarizing average measurements for each activity and subject. This was stored as "averaged_data_by_activity_and_subject.txt"
  
