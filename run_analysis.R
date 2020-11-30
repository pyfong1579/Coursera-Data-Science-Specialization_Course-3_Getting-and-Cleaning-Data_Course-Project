# Download source files from URL and unzip intO "UCI_HAR_Dataset" sub-directory in workspace on 1st run only.
if(!dir.exists("UCI HAR Dataset")) {
  tmp <- tempfile()
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",tmp)
  unzip(tmp)
  unlink(tmp)
}

## Project requirements: (in comments)
# 1.Merge the training and the test sets to create one data set.
# 2.Extract only the measurements on the mean and standard deviation for each measurement.
# 3.Use descriptive activity names to name the activities in the data set.
# 4.Appropriately label the data set with descriptive variable names.
# 5.Create a second, independent tidy data set with the average of each variable for each activity and each subject.

## Use dplyr package
library(dplyr)

# Extracting and merging main files of training and test data sets.
train_tmp <- read.table("UCI HAR Dataset/train/X_train.txt")
test_tmp <- read.table("UCI HAR Dataset/test/X_test.txt")
X <- rbind(train_tmp, test_tmp)

train_tmp <- read.table("UCI HAR Dataset/train/y_train.txt")
test_tmp <- read.table("UCI HAR Dataset/test/y_test.txt")
Y <- rbind(train_tmp, test_tmp)

train_tmp <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_tmp <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject <- rbind(train_tmp, test_tmp)

# Extracting, assigning headers, selecting mean and std deviation measurements and cleaning headers for data set X.
features <- read.table("UCI HAR Dataset/features.txt")
names(X) <- pull(features, var=2)
X <- select(X,contains("-mean()") | contains("-std()"))
names(X) <- tolower(gsub("\\()", "", names(X)))

# Extracting Activity labels, cleaning and replacing as labels for Y
activity <- read.table("UCI HAR Dataset/activity_labels.txt")
activity[, 2] = gsub("_", " ", tolower(activity[, 2]))
Y[, 1] = activity[Y[ , 1], 2]
names(Y) <- "activity"

# Setting names for subject column and merging into single clean main data set.
names(subject) <- "subject"
main <- cbind(subject, Y, X)
write.table(main, "merged_clean_data.txt")

# Independent tidy data set with averages of each variable for each activity and each subject.

main_sum <- main %>%
  group_by(activity,subject) %>%
  summarize_all(mean) %>%
  rename_with(.fn = ~ paste0("Avg-", .x),.cols=!(1:2))

write.table(main_sum, "averaged_data_by_activity_and_subject.txt",row.names = FALSE)
