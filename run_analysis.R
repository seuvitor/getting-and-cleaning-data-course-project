library(dplyr)

# Function to load data from the original study dataset
loadDataFromOriginalStudyDatasetDirectory <- function () {
  trainingX <- "UCI HAR Dataset/train/X_train.txt"
  trainingY <- "UCI HAR Dataset/train/y_train.txt"
  trainingSubject <- "UCI HAR Dataset/train/subject_train.txt"
  testX <- "UCI HAR Dataset/test/X_test.txt"
  testY <- "UCI HAR Dataset/test/y_test.txt"
  testSubject <- "UCI HAR Dataset/test/subject_test.txt"
  features <- "UCI HAR Dataset/features.txt"
  activityLabels <- "UCI HAR Dataset/activity_labels.txt"
  
  list(trainingX = tbl_df(read.table(trainingX)),
       trainingY = tbl_df(read.table(trainingY)),
       trainingSubject = tbl_df(read.table(trainingSubject)),
       testX = tbl_df(read.table(testX)),
       testY = tbl_df(read.table(testY)),
       testSubject = tbl_df(read.table(testSubject)),
       features = tbl_df(read.table(features)),
       activityLabels = tbl_df(read.table(activityLabels)))
}

# Function to convert a name from the original study to a more descriptive name
convertToDescriptiveVariableName <- function (variableName) {
    name <- variableName
    name <- sub(pattern = "^f", replacement = "FrequencyDomain", name)
    name <- sub(pattern = "^t", replacement = "TimeDomain", name)
    
    meanOrStdPattern <- "-(mean|std)\\(\\)-?"
    meanOrStd <- regmatches(name,
                            regexec(pattern = meanOrStdPattern, name))[[1]][2]
    name <- paste0(meanOrStd, "Of", name)
    name <- sub(pattern = meanOrStdPattern, replacement = "", name)
    name <- sub(pattern = "std", replacement = "standardDeviation", name)

    name <- sub(pattern = "Acc", replacement = "Acceleration", name)
    name <- sub(pattern = "Gyro", replacement = "AngularVelocity", name)
    name <- sub(pattern = "Mag", replacement = "Magnitude", name)
    name <- sub(pattern = "BodyBody", replacement = "Body", name)
    
    axisPattern <- "(X|Y|Z)$"
    axis <- regmatches(name, regexec(pattern = axisPattern, name))[[1]][2]
    if (!is.na(axis)) {
      name <- sub(pattern = axisPattern, replacement = "", name)
      name <- paste0(name, "On", axis, "Axis")
    }

    name
}

# Load data from the original dataset
data <- loadDataFromOriginalStudyDatasetDirectory()

# Bind rows from training and test data
xData <- rbind(data$trainingX, data$testX)
yData <- rbind(data$trainingY, data$testY)
subjectData <- rbind(data$trainingSubject, data$testSubject)

# Sets names of non-feature variables
names(data$features) <- c("feature_index", "feature_name")
names(subjectData) <- "subject"
names(yData) <- "activity"
names(data$activityLabels) <- c("activity_id", "activity_name")

# Apply feature variable names from the original study dataset
names(xData) <- as.character(data$features$feature_name)

# Discard feature variables that don't contain mean() or std() in the name
xData <- xData[, grepl("mean\\(\\)|std\\(\\)", names(xData))]

# Convert original variable names to more descriptive ones
names(xData) <- sapply(names(xData), convertToDescriptiveVariableName)

# Convert activity IDs to descriptive activity names
yData$activity <- as.factor(yData$activity)
levels(yData$activity) <- data$activityLabels$activity_name

# Bind all data in a single tidy dataset
activityData <- bind_cols(subjectData, yData, xData)

# Calculate means of features grouped by subject and activity
groupedActivityData <- group_by(activityData, subject, activity)
summarizedActivityData <- summarize_all(groupedActivityData, list(mean))

# Fixes variable names after summarization
names(summarizedActivityData) <- sub(pattern = "meanOf",
                                     replacement = "averageMeanOf",
                                     names(summarizedActivityData))
names(summarizedActivityData) <- sub(pattern = "standardDeviationOf",
                                     replacement = "averageStandardDeviationOf",
                                     names(summarizedActivityData))

# Write tidy data to the output text file
write.table(summarizedActivityData,
            file = "tidy_activity_data.txt",
            row.name=FALSE)
