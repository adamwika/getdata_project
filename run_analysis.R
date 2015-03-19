# Read all the tables
subject_test <- read.table('test/subject_test.txt')
y_test <- read.table('test/y_test.txt')
x_test <- read.table('test/X_test.txt')
subject_train <- read.table('train/subject_train.txt')
y_train <- read.table('train/y_train.txt')
x_train <- read.table('train/X_train.txt')
activity_labels <- read.table('activity_labels.txt')
features <- read.table('features.txt')

# Row bind test and train tables
all_y <- rbind(y_test, y_train)
all_x <- rbind(x_test, x_train)
all_subject <- rbind(subject_test, subject_train)

# Column bind into one big table
all_merged <- cbind(all_subject, all_y, all_x)

# Find indexes of features with mean() and std()
mean_std_index <- sort(c(grep("mean()", features[,2], fixed = TRUE),grep("std()", features[,2], fixed = TRUE)))

# Extract only columns with mean() and std() using mean_std_index
all_merged_extract <- cbind(all_merged[,1:2], all_merged[,mean_std_index+2])

# Matches descriptive activity names
all_merged_extract[[2]] <- activity_labels[match(all_merged_extract[[2]], activity_labels[[1]]), 2]

# Get descriptive variable names for mean() and std()
mean_std_names <- as.character(features[mean_std_index,2])

# Assign subject, activity, mean, and std names to data frame
colnames(all_merged_extract) <- c("subject", "activity", mean_std_names)

# Collapse the dataframe by mean for each subject for each activity
collapsed <- aggregate( . ~ subject + activity, data = all_merged_extract, mean)

# Write the tidy data to a txt file
write.table(collapsed, file = "tidy_data.txt", row.names = FALSE)

# Clean up the environment
rm(subject_test, y_test, x_test, subject_train,
   y_train, x_train, activity_labels, features,
   all_y, all_x, all_subject, all_merged, mean_std_index,
   all_merged_extract, mean_std_names, collapsed)