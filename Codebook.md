 this a code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called CodeBook.md
 
the data is provided by the course project instructions website. I downloaed it using browser and unzip it in the project directory, so all the data in under a subdirectory called *UCI HAR Dataset*. and the details of files i would not explain in detail, because so many have discussed in the forum.

 

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

totalmeasurement <- rbind(measurement_train,measurement_test)
```


calulate the mean of the records by activity and subject.
```{r}
by_totalmeasurement <- group_by(totalmeasurement,activity,subject)
lastdf <- summarise_each(by_totalmeasurement,funs(mean)) 
```
write.csv(lastdf,file="lastdf.csv")

