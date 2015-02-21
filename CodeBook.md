# Code Book

The objective of this dataset is from accelerometer data collected from the Samsung Galaxy S smartphone (UCI Project : Human Activity Recognition Using Smartphones Data Set) which needs to be further cleanse to understand moreabout wearable computing.

This codebook aims to describe the data source, data attributes, data cleansing and transformation process.


## Data Source

Data Description : 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data from URL : 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



## Data Set Information

The Human Activity Recognition database is built from the recordings of a group of 30 volunteers/subjects within an age bracket of 19-48 years. They performed 6 types of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) of daily living (ADL) while carrying a waist-mounted smartphone (Samsung Galaxy S II) with embedded inertial sensors (accelerometer, gyroscope).

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.


## Data Files

The zip file contains many files in a folder called "UCI HAR Dataset". In the README.txt file, it describes the following key details.

 - 'README.txt'
 - 'features_info.txt': Shows information about the variables used on the feature vector.
 - 'features.txt': List of all features.
 - 'activity_labels.txt': Links the class labels with their activity name.
 - 'train/X_train.txt': Training set.
 - 'train/y_train.txt': Training labels.
 - 'test/X_test.txt': Test set.
 - 'test/y_test.txt': Test labels.
 - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
 - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
 - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
 - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


## Data Attribute Information 

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


## Data Cleansing and Transformation

Besides downloading the data, the objectives of getting and cleansing data are shown below :

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Implementation (using run_analysis.R script)

The below steps aim to achieve the above objectives

1. To prepare data by downloading data (zip file) from given URL into R working directory in local drive.
2. To extract the relevant data files (training, testing, reference) in the zip file and merge train and test data
3. To retrieve the variables (or features) related to mean and std from the merged data set
4. To join other related information to the merged data set and rename the variables with descriptive names
5. To duplicate the final merged data set and compute the average value of each subject and activity pair.
6. To generate the computed values into a text file.

