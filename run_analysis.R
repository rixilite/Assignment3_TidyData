
## Script for Course Project
## Getting and Cleaning Data 

#-------------------------------------------------------------------------------------
# This script creates a tidy data set derived from the original sets provided by
# the Human Activity Recognition Using Smartphones project.  Since the variables we are 
# interested in are only the mean and standard deviation values, the other measurement 
# variables are removed.  The test and training sets are then combined into a single master 
# set.  The mean calculation is applied to produce a simplified tidy data set.  This
# result is then written to TidyDataset.txt.
#-------------------------------------------------------------------------------------

## Clean and setup environment

rm(list=ls())   
library(dplyr)
source("MyUtils.R")

#-------------------------------------------------------------------------------------
# Read the original Human Activity Recognition data sets into temp tables
#-------------------------------------------------------------------------------------

activ <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
feat <- read.table("features.txt", stringsAsFactors=FALSE)

trSubject <- read.table("train/subject_train.txt", stringsAsFactors=FALSE)
trY <- read.table("train/y_train.txt", stringsAsFactors=FALSE)
trX <- read.table("train/x_train.txt", stringsAsFactors=FALSE)

tstSubject <- read.table("test/subject_test.txt", stringsAsFactors=FALSE)
tstY <- read.table("test/y_test.txt", stringsAsFactors=FALSE)
tstX <- read.table("test/x_test.txt", stringsAsFactors=FALSE)

#-------------------------------------------------------------------------------------
# rename columns for activity and subject data sets for ease of use 
#-------------------------------------------------------------------------------------

names(activ) <- c("activityID", "activity")

names(trY) <- "activityID"
names(tstY) <- "activityID"

names(trSubject) <- "subjectID"
names(tstSubject) <- "subjectID"

#-------------------------------------------------------------------------------------
# Tidy up the measurement variable column names 
#-------------------------------------------------------------------------------------

names(feat) <- c("featureID", "feature")
feat$feature <- gsub("mean", "Mean", feat$feature)
feat$feature <- gsub("std", "Std", feat$feature)
feat$feature <- gsub("\\(", "", feat$feature)
feat$feature <- gsub("\\)", "", feat$feature)
feat$feature <- gsub("-", "", feat$feature)
feat$feature <- gsub(",", "", feat$feature)
feat$feature <- gsub("angletBody", "angleTBody", feat$feature)
feat$feature <- gsub("gravity", "Gravity", feat$feature)

names(trX) <- feat[, 2]      # Apply tidied-up feature names to trainX dataset
names(tstX) <- feat[, 2]     # Apply tidied-up feature names to testX dataset

#-------------------------------------------------------------------------------------
# Create filter that will store an index of column IDs that are either
# the mean or the standard deviation.  This will help in removing the columns
# we are mnot interested in.
#-------------------------------------------------------------------------------------

featureFilter <- grep("[Mm]ean|[Ss]td", feat$feature)

#-------------------------------------------------------------------------------------
# build trAllData table by combining the individual training datasets
#-------------------------------------------------------------------------------------

trAllData <- trSubject
trAllData <- cbind(trAllData, trY)
trAllData <- cbind(trAllData, trX[, featureFilter])

#-------------------------------------------------------------------------------------
# Build tstAllData table by combining the individual test datasets
#-------------------------------------------------------------------------------------

tstAllData <- tstSubject
tstAllData <- cbind(tstAllData, tstY)
tstAllData <- cbind(tstAllData, tstX[, featureFilter])

#-------------------------------------------------------------------------------------
# Combine the test and train datasets
#-------------------------------------------------------------------------------------

allData <- rbind(trAllData, tstAllData)

#-------------------------------------------------------------------------------------
# Create a tidy mean data set with the average of each variable for each activity 
# and each subject.
#-------------------------------------------------------------------------------------

allDataMean <- aggregate(allData, 
                         by=list(
                             subjectID=allData$subjectID, 
                             activity=allData$activityID), 
                         mean, 
                         rm.na = TRUE, 
                         simplify=TRUE)

allDataMean <- cbind(activity = activ[allDataMean[, "activityID"], "activity"], allDataMean)

allDataMean <- allDataMean[, -c(3,4,5)]    # Clean up duplicate group columns

write.table(allDataMean, file= "TidyDataset.txt", row.names = FALSE)

