# GettingAndCleaningDataCourseProject
# CodeBook file

Running run_analysis.R will result in two variables being created - merged and tidy.
merged is a data frame consisting of merged training and test data. tidy is a data frame consisting of the average of the variables of the merged data set, grouped by the SubjectID and ActivityName.
Columns:
ActivityName: The name of the activity being performed during the measurement
SubjectID: ID of the subject performing the activity
The rest of the columns are the mean and standard deviation of the collected measurements. For a better description of the rest of the variables, see the file features_info.txt available from the UCI HAR dataset:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones