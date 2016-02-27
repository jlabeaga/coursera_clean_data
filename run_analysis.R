
## we will use the dplyr package to manage some date
## (use "install.packages" if not already installed)
library(dplyr)
##  we will use the tidyr package for gathering some columns in step 5
## (use "install.packages" if not already installed)
library(tidyr)


last_time <- Sys.time()
print(paste("START:", last_time))

## =============================================================================
## step 0: load data
## =============================================================================

# the working directory is supposed to be the one in which the dataset files
# have been unzipped ("UCI HAR Dataset"). For example:
# setwd("/coursera/project/UCI HAR Dataset")

# Each numeric value's width is 16 including the blank spaces
# and each line contains one value per feature (in total 561)
numeric_value_width <- 16L
# read the names of the features and calculate the total number of them
features_df <- read.table("features.txt", sep = " ")
nfeatures <- nrow(features_df)
feature_names <- features_df[[2]]

# X_test contains 2947 lines with 561 (nfeatures) numeric values each one,
# each value's width is 16 (numeric_value_width) including blank spaces
test_df <- read.table("test/X_test.txt")

print(paste("step 0: test_df", Sys.time() - last_time)); last_time <- Sys.time()

# X_train contains 7352 lines with 561 (nfeatures) numeric values each one,
# each value's width is 16 (numeric_value_width) including blank spaces
train_df <- read.table("train/X_train.txt")

print(paste("step 0: train_df", Sys.time() - last_time)); last_time <- Sys.time()

print(paste("step 0:", Sys.time() - last_time)); last_time <- Sys.time()

## =============================================================================
## step 1: Merge train and test sets into one data set
## =============================================================================

# merge rows of both data frames into a data frame table (tbl_df)
merged_data_tbl_df <- bind_rows(test_df, train_df)

print(paste("step 1:", Sys.time() - last_time)); last_time <- Sys.time()

## =============================================================================
## step 2: Extract only the measurements on the mean and standard deviation
##         for each measurement
## =============================================================================

# select the features that contains the parts "-mean()" or "-std()"
extracted_feature_index <- grep("-mean\\(\\)|-std\\(\\)", feature_names)
extracted_features_tbl_df <- select(merged_data_tbl_df, extracted_feature_index)

# keep this names for step 4 to generate descriptive labels for our variables
extracted_feature_names <- feature_names[extracted_feature_index]

print(paste("step 2:", Sys.time() - last_time)); last_time <- Sys.time()

## =============================================================================
## step 3: Use descriptive activity names to name the activities in the data set
## =============================================================================

# load the activity names
activity_labels_df <- read.table("activity_labels.txt", sep = " ")

# read the activities and merge the test and train activities into one set
# in a similar way to what we did for the main observations (merged_data_tbl_df)
test_activities_df <- read.table("test/y_test.txt")
train_activities_df <- read.table("train/y_train.txt")
merged_activities_tbl_df <- bind_rows(test_activities_df, train_activities_df)

# add the description column for each activity by joining the descriptions
# join/associate by the first column of each data frame
merged_activities_tbl_df <- merge(merged_activities_tbl_df, activity_labels_df, by.x = 1, by.y = 1)
colnames(merged_activities_tbl_df) <- c("activity_id","activity")

# add the activity data column to the main observations (in the same row order)
# add only the descriptive names (second) column
extracted_features_tbl_df <- bind_cols(extracted_features_tbl_df, merged_activities_tbl_df[2])

print(paste("step 3:", Sys.time() - last_time)); last_time <- Sys.time()

## =============================================================================
## step 4: Appropriately label the data set with descriptive variable names
## =============================================================================

# as descriptive labels we will use the features list in "features.txt" but
# removing the parenthesis () and replacing hyphen "-" by blank space " "
extracted_feature_names <- gsub("\\(\\)", "", extracted_feature_names)
extracted_feature_names <- gsub("-", " ", extracted_feature_names)

# now add the latest column name, i.e. the activity name
descriptive_labels <- append(extracted_feature_names, "activity")

# finally, add descriptive variable label to each column
for(i in 1:length(descriptive_labels)) {
    attr(extracted_features_tbl_df[[i]], "label") = descriptive_labels[i]
} 

print(paste("step 4:", Sys.time() - last_time)); last_time <- Sys.time()

## =============================================================================
## step 5: From the data set in step 4 create a second independent tidy data set
##         with the average of each variable for each activity and each subject
## =============================================================================

# first of all update the colnames so we get tidy data in the final summary table
colnames(extracted_features_tbl_df) <- descriptive_labels

# add the subject to the main data frame
# in the same way we added the activities before

# read the subjects and merge the test and train subjects into one set
# in a similar way to what we did for the main observations (merged_data_tbl_df)
test_subjects_df <- read.table("test/subject_test.txt", col.names = "subject", stringsAsFactors = FALSE)
train_subjects_df <- read.table("train/subject_train.txt", col.names = "subject", stringsAsFactors = FALSE)
merged_subjects_tbl_df <- bind_rows(test_subjects_df, train_subjects_df)

# add the subject data column to the main observations (in the same row order)
extracted_features_tbl_df <- bind_cols(extracted_features_tbl_df, merged_subjects_tbl_df)
# now add a descriptive label to the new variable
# (just to keep the same style for all columns)
attr(extracted_features_tbl_df[["subject"]], "label") = "subject"

# now group the data and get the averages
# NOTE: Ignore Warning message:
# "attributes are not identical across measure variables; they will be dropped "
# the reason is that the factor levels are different but there is no loss of data
# see: http://stackoverflow.com/questions/25688897/reshape2-melt-warning-message

# convert column names to (variable, value) pairs in order to ease mean calculation
gathered_result <- gather(extracted_features_tbl_df, variable, value, -activity, -subject)

# calculate the mean for each group of: activity + subject + variable
grouped_result <- group_by(gathered_result, activity, subject, variable)
summarized_result <- summarize(grouped_result, mean = mean(value))

# sort by: activity + subject + variable
summarized_result <- ungroup(summarized_result)
summarized_result$activity <- factor(summarized_result$activity, levels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))
summarized_result$variable <- factor(summarized_result$variable, levels = descriptive_labels)
summarized_result <- arrange(summarized_result, activity, subject, variable)

# convert back from (variable, value) pairs to a set of columns
final_result <- spread(summarized_result, variable, mean)

# save the dataset also into a txt file
# the data can be read with the instruction: tidy_data <- read.table("tidy_data.txt", header = TRUE)
write.table(final_result, "tidy_data.txt", row.names = FALSE)

print(paste("step 5:", Sys.time() - last_time)); last_time <- Sys.time()

last_time <- Sys.time()
print(paste("END:", last_time))
