---
title: "README"
author: "SaschaC"
date: "Sunday, April 26, 2015"
output: html_document
---

###run_analysis.R

The script does the following (see annotations within script for more details):

1. merging test and training data sets
2. selecting only those columns corresponding to mean() and std() variables (features)
3. adding subject and activityNumber columns from subject_train.txt, subject.test.txt, Y_train.txt and Y_test.txt
4. adding activityName column by merging data set with activity_labels.txt
5. formatting variable names (delete non-alphanumeric characters, reduplications in variables, and formatting into camel formatting for better readability; e.g. word1Word2Word3)
6. converting data set into long format with one row corresponding to one observation of only one variable (feature)
7. aggregating values of variables (features) over subject, variable (feature), and activityName

