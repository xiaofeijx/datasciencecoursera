 this a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md
 
the data is provided by the course project instructions website. I downloaed it using browser and unzip it in the project directory, so all the data in under a subdirectory called *UCI HAR Dataset*. and the details of files i would not explain in detail, because so many have discussed in the forum.

 
##code explainations

load the libraries needed
```{r}
library(dplyr)
library(stringr)
```

I will reading the test files first and then select the needed columns, add two columns, one is  named *subject* means whose data are collected and another one is named *activity*, means what activity is recorded.


the code below read the feature files, the second column of the feature file is the varialbe names of the data recorded in the X_test.txt and  X_train.txt file 
```{r}
feature <- read.table("UCI HAR Dataset/features.txt",header=F)
```
we only need the record that collect the mean or std of measurement, so I looking for the positions where contain "mean" or "std", and then keep it
```{r}
colkeep <- grep("mean|std",feature$V2)
feature <- feature[colkeep,]
```

I dont think varialbe name contain parentheses  is a good idea, so get rid of it
```{r}
feature <-mutate(feature,featurename = str_replace_all(feature$V2,"[\\(\\)]",""))
```

here read the acitivity lables, and lable the acitivity number
```{r}
acitvitylabels <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
activities_test <- read.table("UCI HAR Dataset/test/y_test.txt",header=F)
activities_test$activity <- factor(activities_test$V1,labels=acitvitylabels)
```


reading measurement data in to R
```{r}
measurement_test <- read.table("UCI HAR Dataset/test/X_test.txt",header=F)
```

keep the colunms that we needed
```{r}
measurement_test <- measurement_test[,colkeep]
```

name the variables name of dataframe measurenment
```{r}
names(measurement_test) <- feature$featurename
```

and add two columns, the activity and the subject
```{r}
measurement_test$activity <- activities_test$activity
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header=F)
measurement_test$subject <- subject_test$V1
```


and the code below do the same thing to the train data

```{r}
activities_train <- read.table("UCI HAR Dataset/train/y_train.txt",header=F)
activities_train$activity <- factor(activities_train$V1,labels=acitvitylabels)

measurement_train <- read.table("UCI HAR Dataset/train/X_train.txt",header=F)

measurement_train <- measurement_train[,colkeep]


names(measurement_train) <- feature$featurename
measurement_train$activity <- activities_train$activity

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header=F)
measurement_train$subject <- subject_train$V1
```

then merge the train and test data
in the totalmeasurement dataset, I have 81 variables, except the last two variables are activity and subject, other varialbes are measurement that contains "mean" , "std"  in the original data set.  actually I dont know the units of the measurenment, because I dont understand the backgroud the this expriment.
*activity* is a factor varible, with label("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING") means what activity the subject has taken.
*subject* is a number form 1 to 30, which marked whose records that the data  belong to

```{r}
totalmeasurement <- rbind(measurement_train,measurement_test)
```


calulate the mean of the records by activity and subject.
so the activity and suject are the group value and will keep in the lastdf data.frame. following varialbles are average of all the measurement(mean and std) by activity and subject. actually I dont know the units of the measurenment, because I dont understand the backgroud the this expriment.
```{r}
by_totalmeasurement <- group_by(totalmeasurement,activity,subject)
lastdf <- summarise_each(by_totalmeasurement,funs(mean)) 
```

write the last result to a txt file 
```{r}
write.table(lastdf,file="lastdf.txt",row.name=FALSE)
```

##variables of lastdf are listed by  colunm index - variable name 

1-activity 

  character variable,  activity of subject taken, which contain 6 activities, as follow:
  WALKING
  WALKING_UPSTAIRS
  WALKING_DOWNSTAIRS
  SITTING
  STANDING
  LAYING
  
2-subject

  numeric variable, have 30 numbers(1 through 30),the subject number indicate which subject the record belong to.
  
  
below are the average  of mean and standard variance of the original data,it meaning are indicated by it's variable name.it units are unkown.



according the featureinfo.txt


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 



Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 



Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 



These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ


tGravityAcc-XYZ


tBodyAccJerk-XYZ


tBodyGyro-XYZ


tBodyGyroJerk-XYZ


tBodyAccMag


tGravityAccMag


tBodyAccJerkMag


tBodyGyroMag


tBodyGyroJerkMag


fBodyAcc-XYZ


fBodyAccJerk-XYZ


fBodyGyro-XYZ


fBodyAccMag


fBodyAccJerkMag


fBodyGyroMag




fBodyGyroJerkMag



The set of variables that were estimated from these signals are: 


mean(): Mean value


std(): Standard deviation


Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:


gravityMean


tBodyAccMean


tBodyAccJerkMean


tBodyGyroMean


tBodyGyroJerkMean




here I list the left variable in my last output dataset:


3-tBodyAcc-mean-X
4-tBodyAcc-mean-Y
5-tBodyAcc-mean-Z
6-tBodyAcc-std-X
7-tBodyAcc-std-Y
8-tBodyAcc-std-Z
9-tGravityAcc-mean-X
10-tGravityAcc-mean-Y
11-tGravityAcc-mean-Z
12-tGravityAcc-std-X
13-tGravityAcc-std-Y
14-tGravityAcc-std-Z
15-tBodyAccJerk-mean-X
16-tBodyAccJerk-mean-Y
17-tBodyAccJerk-mean-Z
18-tBodyAccJerk-std-X
19-tBodyAccJerk-std-Y
20-tBodyAccJerk-std-Z
21-tBodyGyro-mean-X
22-tBodyGyro-mean-Y
23-tBodyGyro-mean-Z
24-tBodyGyro-std-X
25-tBodyGyro-std-Y
26-tBodyGyro-std-Z
27-tBodyGyroJerk-mean-X
28-tBodyGyroJerk-mean-Y
29-tBodyGyroJerk-mean-Z
30-tBodyGyroJerk-std-X
31-tBodyGyroJerk-std-Y
32-tBodyGyroJerk-std-Z
33-tBodyAccMag-mean
34-tBodyAccMag-std
35-tGravityAccMag-mean
36-tGravityAccMag-std
37-tBodyAccJerkMag-mean
38-tBodyAccJerkMag-std
39-tBodyGyroMag-mean
40-tBodyGyroMag-std
41-tBodyGyroJerkMag-mean
42-tBodyGyroJerkMag-std
43-fBodyAcc-mean-X
44-fBodyAcc-mean-Y
45-fBodyAcc-mean-Z
46-fBodyAcc-std-X
47-fBodyAcc-std-Y
48-fBodyAcc-std-Z
49-fBodyAcc-meanFreq-X
50-fBodyAcc-meanFreq-Y
51-fBodyAcc-meanFreq-Z
52-fBodyAccJerk-mean-X
53-fBodyAccJerk-mean-Y
54-fBodyAccJerk-mean-Z
55-fBodyAccJerk-std-X
56-fBodyAccJerk-std-Y
57-fBodyAccJerk-std-Z
58-fBodyAccJerk-meanFreq-X
59-fBodyAccJerk-meanFreq-Y
60-fBodyAccJerk-meanFreq-Z
61-fBodyGyro-mean-X
62-fBodyGyro-mean-Y
63-fBodyGyro-mean-Z
64-fBodyGyro-std-X
65-fBodyGyro-std-Y
66-fBodyGyro-std-Z
67-fBodyGyro-meanFreq-X
68-fBodyGyro-meanFreq-Y
69-fBodyGyro-meanFreq-Z
70-fBodyAccMag-mean
71-fBodyAccMag-std
72-fBodyAccMag-meanFreq
73-fBodyBodyAccJerkMag-mean
74-fBodyBodyAccJerkMag-std
75-fBodyBodyAccJerkMag-meanFreq
76-fBodyBodyGyroMag-mean
77-fBodyBodyGyroMag-std
78-fBodyBodyGyroMag-meanFreq
79-fBodyBodyGyroJerkMag-mean
80-fBodyBodyGyroJerkMag-std
81-fBodyBodyGyroJerkMag-meanFreq


