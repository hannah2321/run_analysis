Overview
This R script gathers the various files included included in the Samsung smart phone sensor readings found in UCI data directories and merges them into a single data frame. The resulting data is then aggregated per subject and activity to create a summary data set of the means of only those measures involving means and standard deviations.

Requirements
The following are required in order for the script to run as intended.

the UCI data in a folder found in the working directory
IMPORTANT: the {plyr} package must be installed
input files and respective locations in the UCI folders

measures data: "UCI HAR Dataset/test/X_test.txt"
measures data: "UCI HAR Dataset/train/X_train.txt"
activity per obs: "UCI HAR Dataset/test/y_test.txt"
activity per obs: "UCI HAR Dataset/train/y_train.txt"
measure names: "UCI HAR Dataset/features.txt"
activity verbiage: "UCI HAR Dataset/activity_labels.txt"
subject per obs: "UCI HAR Dataset/train/subject_train.txt"
subject per obs: "UCI HAR Dataset/test/subject_test.txt"
