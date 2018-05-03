library("dplyr")
features <- read.csv("features.txt", header=FALSE, sep=" ", col.names = c("FeatureID", "FeatureName"))
activities <- read.csv("activity_labels.txt", header=FALSE, sep=" ", col.names = c("ActivityID", "ActivityName"))
subject_test <- read.csv("test/subject_test.txt", header=FALSE, sep=" ", col.names = c("SubjectID"))
subject_train <- read.csv("train/subject_train.txt", header=FALSE, sep=" ", col.names = c("SubjectID"))
y_test <- read.csv("test/y_test.txt", header=FALSE, sep=" ", col.names = c("ActivityID"))
y_train <- read.csv("train/y_train.txt", header=FALSE, sep=" ", col.names = c("ActivityID"))
x_test <- read.table("test/x_test.txt", header=FALSE, col.names=features$FeatureName)
x_train <- read.table("train/x_train.txt", header=FALSE, col.names=features$FeatureName)
x_test["ActivityID"] <- y_test
x_train["ActivityID"] <- y_train
x_test["SubjectID"] <- subject_test
x_train["SubjectID"] <- subject_train
x_test <- merge(x_test, activities, by.x = "ActivityID", by.y = "ActivityID")
x_train <- merge(x_train, activities, by.x = "ActivityID", by.y = "ActivityID")
merged <- rbind(x_test, x_train)
merged <- select(merged, ActivityName, SubjectID, contains("std"), contains("mean"))
tidy <- merged %>% 
  group_by(SubjectID, ActivityName) %>% 
  summarise_all(funs(mean))
rm("features")
rm("activities")
rm("subject_test")
rm("subject_train")
rm("y_test")
rm("y_train")
rm("x_test")
rm("x_train")

