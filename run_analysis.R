#--------------------------------
#Data Science Course Project (Week 3)
#--------------------------------

# You should create one R script called run_analysis.R that does the following. 
# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names. 
# 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Step 0 - Preparation 
#Method 1 : download data from URL to temp folder
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#temp <- tempfile() #no need to clean up later
#temp
#"C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS\\file55847a01fef"
#download.file(fileUrl, temp) 
#Method 2 : download data from URL into working directory
download.file(fileUrl, destfile="./dataset.zip") 

#Step 0 - unzip files 
#Using Method 1
# td <- tempdir()
# unzip(temp, files=fname, exdir=td, overwrite=TRUE)

#Using Method 2 (assuming its from working dir and not the temp location)
temp <- "dataset.zip"
fname <- unzip(temp, list=TRUE)$Name

fpath <- file.path(td, fname)
fpath
# [1] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/activity_labels.txt"                         
# [2] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/features.txt"                                
# [3] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/features_info.txt"                           
# [4] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/README.txt"                               
# [16] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/test/subject_test.txt"                       
# [17] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/test/X_test.txt"                             
# [18] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/test/y_test.txt"
# [30] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/train/subject_train.txt"                     
# [31] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/train/X_train.txt"                           
# [32] "C:\\Users\\XXX\\AppData\\Local\\Temp\\RtmpU9tZxS/UCI HAR Dataset/train/y_train.txt" 

#Extracted from README.TXT
# The dataset includes the following files:
#   =========================================
#   - 'README.txt'
# - 'features_info.txt': Shows information about the variables used on the feature vector.
# - 'features.txt': List of all features.
# - 'activity_labels.txt': Links the class labels with their activity name.
# - 'train/X_train.txt': Training set.
# - 'train/y_train.txt': Training labels.
# - 'test/X_test.txt': Test set.
# - 'test/y_test.txt': Test labels.

#Step 0 - read train and test files
subject_test <- read.table(fpath[16],sep='')
X_test <- read.table(fpath[17])
Y_test <- read.table(fpath[18])
subject_train <- read.table(fpath[30])
X_train <- read.table(fpath[31])
Y_train <- read.table(fpath[32])
#Step 1 - merge training and test set
s <- rbind(subject_test, subject_train)
colnames(s)<-c("subject")
x <- rbind(X_test, X_train)
y <- rbind(Y_test, Y_train)
colnames(y)<-c("activity_label")

#Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
features <- read.table(fpath[2])
colnames(features) <- c("id","feature_name")
features_index <- grep("mean|std",features$feature_name)
features_final <- features[features_index,]
x_final <- x[,features_index]

#Step 3.Uses descriptive activity names to name the activities in the data set
#AND Step 4.Appropriately labels the data set with descriptive variable names. 
colnames(x_final) <- features_final$feature_name
activity <- read.table(fpath[1])
colnames(activity)<-c("activity_label","activity_name")
activity
# V1                 V2
# 1  1            WALKING
# 2  2   WALKING_UPSTAIRS
# 3  3 WALKING_DOWNSTAIRS
# 4  4            SITTING
# 5  5           STANDING
# 6  6             LAYING
#combine label to dataset
x_final1 <- cbind(x_final,y)
#join label with the activity name
x_final1 <- merge(x_final1,activity,by="activity_label",all=T)
#join subject
x_final1 <-cbind(x_final1,s)
names(x_final1)

#Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
x_avg1 <- x_final1
library(reshape2)
meltData <- melt(x_avg1, id = c('activity_label','activity_name','subject'))
x_avg1_result <- dcast(meltData, subject + activity_label ~ variable, mean)
#set name to reflect value is mean
avg1_index <- grep("mean|std",names(x_avg1_result))
avg1_index
colnames(x_avg1_result)[3:81]<-paste("avg",colnames(x_avg1_result)[3:81],sep="-")
names(x_avg1_result)

#(extract data for own backup)
#write.table(x_final1, file = "./tidy_data_step4.txt")
#write.table(x_avg1_result, file = "./tidy_data_step5.txt")
#extract data for submission
write.table(x_avg1_result, file = "./tidy_data_step5_sub.txt",row.name=FALSE)
