# DS_GCD
Getting and Cleaning Data Course

## Course Project

You should create one R script called run_analysis.R that aims to achieve the below objectives :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project

You will have ```run_analysis.R``` script in your R working directory and can be run using ```source("run_analysis.R")``` in R to perform the following steps :

1. To download data in zip file format from given URL
2. Default is to use Method 2 to download zip file (```dataset1.zip```) into working directory in local drive. An alternative method (Method 1) provided in script is to download zip file into temp folder in local drive and avoid cleaning up files.
3. The R script will extract the relevant data files (training, testing, reference) in the zip file, retrieve the specified mean and std variables, calculate the average value and generate a dataset (```tidy_data_step5_sub.txt```) with descriptive variable names so as to achieve the above objectives.


## Dependencies

The script assumes that ```reshape2``` package is already installed.
