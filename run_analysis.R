setwd("C:/Users/hmdrake/Desktop/Coursera/Getting and Cleaning Data/Week 3/data")

# Merge training and test datasets into one
features <- read.table("./UCI HAR Dataset/features.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")

names <- c("subject", "activity", as.vector(features$V2))

test_data <- data.frame(subject_test, Y_test, X_test)
names(test_data) <- names

train_data <- data.frame(subject_train, Y_train, X_train)
names(train_data) <- names

data <- rbind(train_data, test_data)

# Extract mean and standard deviation for each measurement
mean_features <-names[grepl("mean()", names, ignore.case=FALSE) & !grepl("meanFreq()", names, ignore.case=FALSE)]

std_features <-names[grepl("std()", names, ignore.case=FALSE)]

ex_data <- subset(data, select = c("subject", "activity", mean_features, std_features))

# Use descriptive activity names to name activities in data
act_label <- activity[ex_data$activity, 2]
act_label <- tolower(act_label)
names(act_label) <= "activityname"
ex_data <- cbind(act_label, ex_data)

# Create second dataset with average of each variable for each activity and each subject
act = factor(unique(ex_data$act_label))
sub = factor(unique(ex_data$subject))

df <- data.frame()
ai <- vector()
si <- vector()
n <- 1
for(s in sub) {
        for(a in act) {
                vals <- sapply(ex_data[(ex_data$subject == s) & (ex_data$act_label == a), 4:ncol(ex_data)], mean)
                nrow <- vals
                df <- rbind(df,nrow)
                ai[n] <- a
                si[n] <- s
                n <- n + 1
        }
}


df <- cbind(si, ai, df)
print(dim(df))

val_names <- c(mean_features, std_features)
val_names <- gsub("mean\\()","Mean", val_names)
val_names <- gsub("std\\()","Std", val_names)
val_names <- gsub("-","", val_names)
val_names <- c("subject", "activity", val_names)
names(df) <- val_names

# output the data
write.table(df, file = "outdata.txt", sep = "\t")