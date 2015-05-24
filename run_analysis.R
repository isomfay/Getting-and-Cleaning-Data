#loading dplyr library
library(dplyr)

#reading in features and activity labels
features <- read.table(".\\UCI HAR Dataset\\features.txt")
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", col.names=c("number", "activity"))

#reading in test data and renaming the columns
x_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", col.names=features[,2])
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", col.names="subject")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", col.names="activity_labels")

#merging test data with the subjects and labels
test <- cbind(subject_test,y_test,x_test)
test = merge(activity_labels, test, by.x="number", by.y="activity_labels", all=FALSE)
test <- rename(test,data=number)
test <- mutate (test, data="test")

#reading in train data and renaming the columns
x_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", col.names=features[,2])
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", col.names="subject")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", col.names="activity_labels")

#merging train data with the subjects and labels
train <- cbind(subject_train,y_train,x_train)
train = merge(activity_labels, train, by.x="number", by.y="activity_labels", all=FALSE)
train <- rename(train,data=number)
train <- mutate (train, data="train")

#merging test and train data sets
data <- rbind(test, train)

#extracting data on mean and std
col1 <- names(select(data, contains("mean")))
col2 <- names(select(data, contains("std")))
data <- select(data, 2:3, one_of(col1), one_of(col2))

#creating a second, independent tidy data set with the average of each variable for each activity and each subject
result <- group_by(data, subject, activity) %>% summarise_each(funs(mean))

#creating a txt file with the result tidy data set
write.table(result, file="result.txt", row.name=FALSE) 
