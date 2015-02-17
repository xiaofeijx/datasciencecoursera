# reading the test files first
library(dplyr)

colkeep <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,
             266:271,345:350,424:429,503:504,516:517,529:530,542:543)
feature <- read.table("UCI HAR Dataset/features.txt",header=F)
feature <- feature[colkeep,]
acitvitylabels <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#reading test files
#reading activities in to 
activities_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=F)

activities_test$activity <- factor(activities_test$V1,labels=acitvitylabels)

#reading measurement data in to R
measurement_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=F)


measurement_test <- measurement_test[,colkeep]

#name the variables name of dataframe measurenment
names(measurement_test) <- feature$V2
measurement_test$activity <- activities_test$activity

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=F)
measurement_test$subject <- subject_test$V1

#reading train files
#reading activities in to 
activities_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=F)

activities_train$activity <- factor(activities_train$V1,labels=acitvitylabels)

#reading measurement data in to R
measurement_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=F)

measurement_train <- measurement_train[,colkeep]

#name the variables name of dataframe measurenment
names(measurement_train) <- feature$V2
measurement_train$activity <- activities_train$activity

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=F)
measurement_train$subject <- subject_train$V1


totalmeasurement <- rbind(measurement_train,measurement_test)

dim(totalmeasurement)
names(totalmeasurement)

by_totalmeasurement <- group_by(totalmeasurement,activity,subject)
lastdf <- summarise_each(by_totalmeasurement,funs(mean)) 

lastdf[lastdf$activity=="LAYING",]
