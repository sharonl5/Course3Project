

# Introduction

this document describes the variables, the data, and any transformations or work that Run_analysis.R performed to clean up the data.

The script `run_analysis.R`
- set work directory
- install data.table, and reshape2 packages
- load activity labels
- load and process x_test and y_test data
- load data column names
- extract only the measurements on the mean and standard deviation for each measurement and labels the columns with appropriate names
- bind data
- do same thing above to train data sets
- merge test and train data
- apply mean function to dataset using dcast function
- write the independent tidy data set to the work directory in requested format


# Tidy data

the data set contains 180 rows, 160 variables

