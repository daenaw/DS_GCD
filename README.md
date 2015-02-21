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

1. Download the data source and put into a folder on your local drive. You'll have a ```UCI HAR Dataset``` folder.
2. Put ```run_analysis.R``` in the parent folder of ```UCI HAR Dataset```, then set it as your working directory using ```setwd()``` function in RStudio.
3. Run ```source("run_analysis.R")```, then it will generate a new file ```tiny_data.txt``` in your working directory.

## Dependencies

The script assumes that ```reshape2``` package is already installed.
