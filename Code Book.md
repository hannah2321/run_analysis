Variables and data in dataTidy data set and transformations/work performed to clean up the raw data

The file dataTidy.txt is a data set with 180 rows and 68 columns summarizing the raw data sets of training and test measurements and containing the average of each variable for each subject and each activity.

The first column ("subjectID") contains the identifier of the subject who carried out the experiment The second column ("activity") contains the activity measured
The other 66 columns contain mean and standard deviation values of the measurements

The 180 rows contain the average value for each of the 30 subjects and each of the 6 activities (so 30*6=180). The average values were obtained after having merged training (7352 rows) and test (2947 rows) measurements in raw data. The process from raw to tidy data sets was the follow:

downloaded and read raw data from the follow original files:
features.txt -> data.frame (561*2) with id and name of each feature measured
activity_labels.txt -> data.frame (6*2) with id and label of each activity subject_train.txt -> data.frame (7352*1) with the id of the subject for each of the 7352 measurements in training
y_train.txt -> data.frame (7352*1) with the id of the activity for each of the 7352 measurements in training
X_train.txt -> data.frame (7352*561) with the variables (features), for each of the 7352 measurements in training
subject_test.txt -> data.frame (2947*1) with the id of the subject for each of the 7352 measurements in test
y_test.txt -> data.frame (2947*1) with the id of the activity for each of the 7352 measurements in test
X_test.txt -> data.frame (2947*561) with the variables (features), for each of the 7352 measurements in test

renamed columns in activity_labels, subject_train and subject_test giving appropriate label to the fields

renamed columns in X_train and X_test fetching the labels from features.txt

factorized y_train and y_test, each by activity_labels

created intermediate data frames dftrain as a cbind of X_train + subject and activity (both as tidied in point 2)

created intermediate data frames dftest as a cbind of X_test + subject and activity (both as tidied in point 2)

created dataMerged, a new data frame that combine the rows of dftrain and those of dftest (using rbind)

extracted features regarding mean and standard deviation from features

created dataRestricted data frame, a subset of dataMerged containing only the features as extracted above

created dataTidy data frame as a result of melt and dcast of dataRestricted

created dataTidy(), a function to write dataTidy in a text file named dataTidy.txt

The following are the column names of dataTidy:

"subject"	"activity"	"tBodyAccMeanX"	"tBodyAccMeanY"	"tBodyAccMeanZ"	"tGravityAccMeanX"	"tGravityAccMeanY"	"tGravityAccMeanZ"	"tBodyAccJerkMeanX"	"tBodyAccJerkMeanY"	"tBodyAccJerkMeanZ"	"tBodyGyroMeanX"	"tBodyGyroMeanY"	"tBodyGyroMeanZ"	"tBodyGyroJerkMeanX"	"tBodyGyroJerkMeanY"	"tBodyGyroJerkMeanZ"	"tBodyAccMagMean"	"tGravityAccMagMean"	"tBodyAccJerkMagMean"	"tBodyGyroMagMean"	"tBodyGyroJerkMagMean"	"fBodyAccMeanX"	"fBodyAccMeanY"	"fBodyAccMeanZ"	"fBodyAccJerkMeanX"	"fBodyAccJerkMeanY"	"fBodyAccJerkMeanZ"	"fBodyGyroMeanX"	"fBodyGyroMeanY"	"fBodyGyroMeanZ"	"fBodyAccMagMean"	"fBodyBodyAccJerkMagMean"	"fBodyBodyGyroMagMean"	"fBodyBodyGyroJerkMagMean"	"tBodyAccStdX"	"tBodyAccStdY"	"tBodyAccStdZ"	"tGravityAccStdX"	"tGravityAccStdY"	"tGravityAccStdZ"	"tBodyAccJerkStdX"	"tBodyAccJerkStdY"	"tBodyAccJerkStdZ"	"tBodyGyroStdX"	"tBodyGyroStdY"	"tBodyGyroStdZ"	"tBodyGyroJerkStdX"	"tBodyGyroJerkStdY"	"tBodyGyroJerkStdZ"	"tBodyAccMagStd"	"tGravityAccMagStd"	"tBodyAccJerkMagStd"	"tBodyGyroMagStd"	"tBodyGyroJerkMagStd"	"fBodyAccStdX"	"fBodyAccStdY"	"fBodyAccStdZ"	"fBodyAccJerkStdX"	"fBodyAccJerkStdY"	"fBodyAccJerkStdZ"	"fBodyGyroStdX"	"fBodyGyroStdY"	"fBodyGyroStdZ"	"fBodyAccMagStd"	"fBodyBodyAccJerkMagStd"	"fBodyBodyGyroMagStd"	"fBodyBodyGyroJerkMagStd"