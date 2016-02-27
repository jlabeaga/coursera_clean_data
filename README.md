# Coursera - Getting and Cleaning Data
# Project assignment

This document contains:

1. A **description of the R script** that converts the input raw data files of the Coursera "Getting and Cleaning Data" course into an output file tidy_data.txt containing summarized tidy data.

2. The **Code Book** describing the variables of the tidy data set generated.


## R script description

The run_analysis.R script has been created using R version 3.2.3 (2015-12-10).

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


#### Steps of run_analysis.R

1. Merges the training set (read from `X_train.txt`) and the test set (read from `X_test.txt`) to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement (only the features named with the `"mean"` or `"std"` particles) and remove the rest of measurements.
3. Adds descriptive activity names to name the activity for each observation.
4. Appropriately labels the data set with descriptive variable names, removing parenthesis.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## Code Book - Variables description

At the end of this section we include the explanations about the variables given in the original file `feature_info.txt`. The variables in our `tidy_data.txt` dataset are just mean values derived from them calculated for each activity and subject.

This is a list of the variables:


| Name | Description  |
| ---- | ------------ |
| tBodyAcc mean X	 | 	(please read explanation from original Code Book below)	 |
| tBodyAcc mean Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyAcc mean Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyAcc std X	 | 	(please read explanation from original Code Book below)	 |
| tBodyAcc std Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyAcc std Z	 | 	(please read explanation from original Code Book below)	 |
| tGravityAcc mean X	 | 	(please read explanation from original Code Book below)	 |
| tGravityAcc mean Y	 | 	(please read explanation from original Code Book below)	 |
| tGravityAcc mean Z	 | 	(please read explanation from original Code Book below)	 |
| tGravityAcc std X	 | 	(please read explanation from original Code Book below)	 |
| tGravityAcc std Y	 | 	(please read explanation from original Code Book below)	 |
| tGravityAcc std Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerk mean X	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerk mean Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerk mean Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerk std X	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerk std Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerk std Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyro mean X	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyro mean Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyro mean Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyro std X	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyro std Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyro std Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerk mean X	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerk mean Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerk mean Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerk std X	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerk std Y	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerk std Z	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccMag mean	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccMag std	 | 	(please read explanation from original Code Book below)	 |
| tGravityAccMag mean	 | 	(please read explanation from original Code Book below)	 |
| tGravityAccMag std	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerkMag mean	 | 	(please read explanation from original Code Book below)	 |
| tBodyAccJerkMag std	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroMag mean	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroMag std	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerkMag mean	 | 	(please read explanation from original Code Book below)	 |
| tBodyGyroJerkMag std	 | 	(please read explanation from original Code Book below)	 |
| fBodyAcc mean X	 | 	(please read explanation from original Code Book below)	 |
| fBodyAcc mean Y	 | 	(please read explanation from original Code Book below)	 |
| fBodyAcc mean Z	 | 	(please read explanation from original Code Book below)	 |
| fBodyAcc std X	 | 	(please read explanation from original Code Book below)	 |
| fBodyAcc std Y	 | 	(please read explanation from original Code Book below)	 |
| fBodyAcc std Z	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccJerk mean X	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccJerk mean Y	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccJerk mean Z	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccJerk std X	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccJerk std Y	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccJerk std Z	 | 	(please read explanation from original Code Book below)	 |
| fBodyGyro mean X	 | 	(please read explanation from original Code Book below)	 |
| fBodyGyro mean Y	 | 	(please read explanation from original Code Book below)	 |
| fBodyGyro mean Z	 | 	(please read explanation from original Code Book below)	 |
| fBodyGyro std X	 | 	(please read explanation from original Code Book below)	 |
| fBodyGyro std Y	 | 	(please read explanation from original Code Book below)	 |
| fBodyGyro std Z	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccMag mean	 | 	(please read explanation from original Code Book below)	 |
| fBodyAccMag std	 | 	(please read explanation from original Code Book below)	 |
| fBodyBodyAccJerkMag mean	 | 	(please read explanation from original Code Book below)	 |
| fBodyBodyAccJerkMag std	 | 	(please read explanation from original Code Book below)	 |
| fBodyBodyGyroMag mean	 | 	(please read explanation from original Code Book below)	 |
| fBodyBodyGyroMag std	 | 	(please read explanation from original Code Book below)	 |
| fBodyBodyGyroJerkMag mean	 | 	(please read explanation from original Code Book below)	 |
| fBodyBodyGyroJerkMag std	 | 	(please read explanation from original Code Book below)	 |


### (Explanations from the original Code Book provided for the raw variables in `features_info.txt`):

Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
```
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
```

The set of variables that were estimated from these signals are: 

```
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
```

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

```
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```

The complete list of variables of each feature vector is available in 'features.txt'

