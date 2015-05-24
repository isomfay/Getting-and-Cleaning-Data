# Getting-and-Cleaning-Data
Course Project

This Repo contains the following files
 * README.md
 * CodeBook.md
 * run_analysis.R

Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Date source needs to be unzipped and placed in the working directory of R whith its folder structure.

The run_analysis.R does the following:
 * Merges the training and the test sets to create one data set.
 * Extracts only the measurements on the mean and standard deviation for each measurement. 
 * Uses descriptive activity names to name the activities in the data set
 * Appropriately labels the data set with descriptive variable names. 
 * Creates a result.txt tidy data set with the average of each variable for each activity and each subject.
 
The CodeBook.md contains the description of the data in the result.txt.

