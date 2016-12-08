Introduction
The script run_analysis.R
downloads the data from UCI Machine Learning Repository
merges the training and test sets to create one data set
replaces activity values in the dataset with descriptive activity names
extracts only the measurements (features) on the mean and standard deviation for each measurement
appropriately labels the columns with descriptive names
creates a second, independent tidy dataset with an average of each variable for each each activity and each subject. 
In other words, same type of measurements for a particular subject and activity are averaged into one value and the tidy data set contains
these mean values only. 
The processed tidy data set is also exported as csv file.

run_analysis.R
The script is parititioned into functions such that each function performs one of the steps described above. 
To run whole cleaning procedure, call clean.data function. 
The script also assumes that plyr library is already installed.
The original data setThe original data set is split into training and test sets (70% and 30%, respectively) where each partition is also split into three files that contain
measurements from the accelerometer and gyroscope
activity labelidentifier of the subject
Getting and cleaning dataIf the data is not already available in the data directory, it is downloaded from UCI repository.
The first step of the preprocessing is to merge the training and test sets. 
Two sets combined, there are 10,299 instances where each instance contains 561 features (560 measurements and subject identifier). 
After the merge operation the resulting data, the table contains 562 columns (560 measurements, subject identifier and activity label).
After the merge operation, mean and standard deviation features are extracted for further processing.
Out of 560 measurement features, 33 mean and 33 standard deviations features are extracted, 
yielding a data frame with 68 features (additional two features are subject identifier and activity label).
Next, the activity labels are replaced with descriptive activity names, defined in activity_labels.txt in the original data folder.
The final step creates a tidy data set with the average of each variable for each activity and each subject. 
10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group.
The resulting data table has 180 rows and 66 columns.
The tidy data set is exported to UCI_HAR_tidy.csv where the first row is the header containing the names for each column.

Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL)
while carrying a waist-mounted smartphone with embedded inertial sensors.Data 
Set Characteristics:  Multivariate, Time-Series
Number of Instances:10299
Area:Computer
Attribute Characteristics:N/A
Number of Attributes:561
Date Donated: 2012-12-10
Associated Tasks:Classification, Clustering
Missing Values? N/A
Number of Web Hits:422037
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems LaboratoryDITEN - Università  degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous LivingUniversitat Politècnica de Catalunya (BarcelonaTech). 
Vilanova i la Geltrú (08800), Spainactivityrecognition '@' smartlab.ws 























