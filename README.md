# getdata_project
Course project submission for Getting and Cleaning Data

run_analysis.R

Make sure all files from UCI HAR Dataset and the script are in the working directory.
The script takes in all the UCI Human Activity Recognition files and does
the following:

1. Combines all the data files in the folder into a single data frame;

2. Extracts only the means ("mean()") and standard deviations ("std()") of each
measurement - 66 variables total;

3. Replaces activity numbers with descriptive names ("LAYING", "SITTING", etc.);

4. Renames columns with "subject" for subjects, "activity" for activities,
and systematic descriptions for each mean and sd measurement (see code book);

5. Collapses the data frame by mean of measurements for each subject/activity
combination (30 subjects x 6 activities = 180 rows). The output dataset is saved in
the working directory as "tidy_data.txt".

All intermediate variables are removed from the environment on completion.