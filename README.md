# Coursera - Getting and Cleaning Data
# Project assignment

## R script description

This document contains a description of the **run_analysis.R** R script that converts the input raw data files of the Coursera "Getting and Cleaning Data" course into an output file tidy_data.txt containing summarized tidy data.

The script has been created using R version 3.2.3 (2015-12-10).

It reads the input data files from the Coursera "Getting and Cleaning Data" course:
```
activity_labels.txt: activity descriptive labels
features.txt: list of all the features measured
test/subject_test.txt: subjects that holds the widget during the test observations
train/X_train.txt: values of the features measured during the test observations
train/y_train.txt: activity associated to each test observation
train/subject_train.txt: subjects that holds the widget during the training observations
test/X_test.txt: values of the features measured during the training observations
test/y_test.txt: activity associated to each training observation
```
and generates the tidy output data file 
```
tidy_data.txt
```
as a blank-space delimited text file that can be read with the R instruction:
```
tidy_data <- read.table("tidy_data.txt", header = TRUE)
```

#### **Steps of run_analysis.R**

1. Merges the training set (read from `X_train.txt`) and the test set (read from `X_test.txt`) to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement (only the features named with the `"mean"` or `"std"` particles) and remove the rest of measurements.
3. Adds descriptive activity names to name the activity for each observation.
4. Appropriately labels the data set with descriptive variable names, removing parenthesis.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


_NOTE: The file CodeBook.md describes the variables of the tidy data set generated._


