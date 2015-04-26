---
title: "CodeBook"
author: "SaschaC"
date: "Sunday, April 26, 2015"
output: html_document
---

## Smartphones Data Dictionary - 2015

###Variables

subject

&nbspNumeric vector indicating subject id
  
feature

&nbspFactor indicating the mean and standard (Std) deviation variables estimated from &nbspthe features from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ &nbspand tGyro-XYZ (see features_info.txt in the project data folder).

activityName

&nbspFactor indicating activity during measurement

activityNumber

&nbspNumeric vector indicating a unique number for each activity name

value

&nbspNumeric vector containing the average of each variable for each subject and activity


###Data cleaning process

The raw data were obtained here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The final data set was obtained following these steps:

1. merging test and training data sets
2. selecting only those columns corresponding to mean() and std() variables (features)
3. adding subject and activityNumber columns from subject_train.txt, subject.test.txt, Y_train.txt and Y_test.txt
4. adding activityName column by merging data set with activity_labels.txt
5. formatting variable names (delete non-alphanumeric characters, reduplications in variables, and formatting into camel formatting for better readability; e.g. word1Word2Word3)
6. converting data set into long format with one row corresponding to one observation of only one variable (feature)
7. aggregating values of variables (features) over subject, variable (feature), and activityName


