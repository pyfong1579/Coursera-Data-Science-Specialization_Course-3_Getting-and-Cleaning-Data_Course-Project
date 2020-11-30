for descriptions of the original datasets please refer to README.TXT in /UCI HAR Dataset/

Descriptions of the manipulated final datasets variables as follows:-
  1.  merged_clean_data.txt contains variable required for project
    var:  subject - individual volunteers that took part in the study (id 1:24 type:(INT))
          activity - descriptive label for actions captured for the study (6 labels type:(CHR)
          <mean and std. measurements> original names with "()" removed. 66 variables
          
   2. averaged_data_by_activity_and_subject.txt contains the summarized average values for measurements grouped by activity and subject.
    var:  subject - individual volunteers that took part in the study (id 1:24 type:(INT))
          activity - descriptive label for actions captured for the study (6 labels type:(CHR)
          <averaged measurements> original names with "()" removed prefix "avg." added in summary per activityu and subject. 
