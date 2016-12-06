
## Course 3 week4 course project
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## a. Read in labels, features etc
activity_labels <- read.table("activity_labels.txt")[,2]
features <- read.table("features.txt")[,2]
extract_features <- grepl("mean|std", features)
## b. Read in test sets
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("/test/subject_test.txt")
names(X_test) = features

y_test[,2] = activity_labels[y_test[,1]]

## c. Bind test data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

## d. Read in train sets
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("/test/subject_train.txt")
names(X_train) = features

y_train[,2] = activity_labels[y_train[,1]]

## e. Bind train data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
## f. merge test and train data
data = rbind(test_data, train_data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
X_test = X_test[,extract_features]
X_train = X_train[,extract_features]

## 3. Uses descriptive activity names to name the activities in the data set
## 4. appropriately labels the data set with descriptive activity names
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"
id_labels   = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data   = melt(data, id = id_labels, measure.vars = data_labels)

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data   = dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.txt")
