# create below R script called run_analysis.R that does the following.
# 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# by Wayne Wu@2016Feb23

#Install or load pacakge data.table and reshape2
tryCatch(library(data.table),error= function(e) install.packages("data.table"),finally="Install or load data.table")
tryCatch(library(reshape2),error= function(e) install.packages("reshape2"),finally="Install or load reshape2")

#Load the packages data.table and reshape2
library(data.table)
library(reshape2)

#load activity labels from working folder
actData <- read.table("~//UCI HAR Dataset//activity_labels.txt")
names(actData) <- c("actID","actName")
head(actData)
tail(actData)

#load features and Extracts only the measurements on the mean and standard deviation for each measurement
featureData <- read.table("~//UCI HAR Dataset//features.txt")
names(featureData)<-c("featureID","featureName")
head(featureData)
tail(featureData)

extract_fearture <- featureData[grepl("mean|std",featureData$featureName),]
extract_fearture

#load test and subject test data
xtest<- read.table("~//UCI HAR Dataset//test//X_test.txt")
ytest<- read.table("~//UCI HAR Dataset//test//y_test.txt")
subjecttest <- read.table("~//UCI HAR Dataset//test//subject_test.txt")
names(xtest)=featureData$featureName
xtest <- xtest[,extract_fearture$featureName]

# map activity labels
ytest[,2] = actData[ytest[,1],2]
names(ytest) = c("Activity.ID", "Activity.Label")
names(subjecttest) = "subject"

test_data <- cbind(as.data.table(subjecttest), ytest, xtest)

#load train and subject train data
xtrain<- read.table("~//UCI HAR Dataset//train//X_train.txt")
ytrain<- read.table("~//UCI HAR Dataset//train//y_train.txt")
subjecttrain <- read.table("~//UCI HAR Dataset//train//subject_train.txt")
names(xtrain)=featureData$featureName
xtrain <- xtrain[,extract_fearture$featureName]

# map activity labels
ytrain[,2] = actData[ytrain[,1],2]
names(ytrain) = c("Activity.ID", "Activity.Label")
names(subjecttrain) = "subject"

train_data  <- cbind(as.data.table(subjecttrain), ytrain, xtrain)

#merge test and train data
final_data = rbind(test_data, train_data)

labels   = c("subject", "Activity.ID", "Activity.Label")
datalabels = setdiff(colnames(final_data), labels)
meltdata  = melt(final_data, id = labels, measure.vars = datalabels)

tidydata = dcast(meltdata, subject + Activity.ID ~ variable, mean)

#save the tidy data under working folder
write.table(tidydata, file = "./tidydata.txt",row.name=FALSE)
