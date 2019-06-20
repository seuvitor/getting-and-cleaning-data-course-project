## Getting and Cleaning Data Course Project

This repository contains the script to prepare a tidy dataset to be used in further analysis, according to the instructions for the Getting and Cleaning Data Course Project.

This script assumes that the files from the original "Human Activity Recognition Using Smartphones Dataset" are available on the working directory, already extracted in a folder named "UCI HAR Dataset". This dataset can be found at [the original study website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The script will execute all the steps to load the data, combine, select, group and summarize, and then it will generate the output file upon being sourced in R:

```r
source("run_analysis.R")
```

The generated tidy dataset can be properly loaded in R with a simple call to:

```r
read.table("tidy_activity_data.txt", header = TRUE)
```

The CodeBook.md file available in this repository provides more information about the contents of the generated tidy dataset.

The script performs each step as suggested in the project instructions:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script is properly commented so that the interested reader can follow in detail how each step is implemented. Two auxiliary functions were defined to encapsulate the details of loading the files and the long process of string manipulations that give more descriptive names to the feature variables.
