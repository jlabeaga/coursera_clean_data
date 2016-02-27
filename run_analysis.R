library(plyr)


# ===============================================================================
# Step 1:
# Merges the training set (read from X_train.txt) and the test set (read from
# X_test.txt) to create one data set.
# ===============================================================================

# read train data
measured_train <- read.table("train/X_train.txt")
activity_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# read test data
measured_test <- read.table("test/X_test.txt")
activity_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# bind rows for all measurements
measured_data <- rbind(measured_train, measured_test)
# bind rows for all activities
activity_data <- rbind(activity_train, activity_test)
# bind rows for all subjects
subject_data <- rbind(subject_train, subject_test)

# ===============================================================================
# Step 2
# Extracts only the measurements on the mean and standard deviation for 
# each measurement (only the features named with the "mean" or "std" particles)
# and remove the rest of measurements.
# ===============================================================================

features <- read.table("features.txt")
# retrieve columns with particels mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
# filter the desired columns
measured_data <- measured_data[, mean_and_std_features]
# set the correct column names
names(measured_data) <- features[mean_and_std_features, 2]

# ===============================================================================
# Step 3:
# Adds descriptive activity names to name the activity for each observation.
# ===============================================================================

activities <- read.table("activity_labels.txt")
# update values with the text activity names
activity_data[, 1] <- activities[activity_data[, 1], 2]
# correct column name
names(activity_data) <- "activity"

# ===============================================================================
# Step 4
# Appropriately labels the data set with descriptive variable names.
# ===============================================================================

# set the column name
names(subject_data) <- "subject"
# bind all the columns in one data frame
all_data <- cbind(measured_data, activity_data, subject_data)

# ===============================================================================
# Step 5
# From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
# ===============================================================================

# average on 66 first columns and group by the las 2 (activity & subject)
tidy_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))
# now save the tidy data set to a text file
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)