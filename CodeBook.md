## Code book for the Summarized Human Activity Recognition Using Smartphones Dataset

The present dataset is based on the "Human Activity Recognition Using Smartphones Dataset" [1]

> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.
> Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass
> Hardware-Friendly Support Vector Machine. International Workshop of Ambient
> Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Compared to the original study, here we describe the summarized information for each subject and activity, instead of describing individually the information of each round of the experiment.

### Data dimensions and data tidying

The present dataset is composed of 180 observations of each subject performing each activity, and for each observation there are 68 variables, of which 2 are non-features (subject and activity) and 66 are averaged means and standard deviations of signals recorded by the accelerometer and gyroscope of a samsung smartphone while the subject was performing the activities.

This dataset attempts to fullfil the criteria for tidy data:
- Each variable forms a column.
- Each observation forms a row.
- Each type of observational unit forms a table.

The names of the feature variables were changed from the original dataset to clarify their meanings. For example, we replaced abbreviations like Acc and Mag for Acceleration and Magnitude. We also used AngularVelocity instead of Gyro (for Gyroscope) to clarify what the value means instead of where it came from.

Moreover, we used categorical labels to record the activities in the dataset, instead of simply using the activity codes.

### Code Book

Each combination of the first two variables (subject and activity) identify a single observation on this dataset.

- **subject**: identification of one of the 30 subjects that were part of the experiment (an integer between 1 and 30).
- **activity**: label of the activity performed, a value among WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING.

Next we present the feature-based variables. Regarding the units of measure, the acceleration was originaly measured in standard gravity units 'g' and angular velocity was measured in radians/second, but the signals were further normalized and bounded within [-1,1].

The following variables describe the averaged mean and the averaged standard deviation of the body acceleration on each axis (X, Y and Z), over all experiments of a single subject and activity. 

- **averageMeanOfTimeDomainBodyAccelerationOnXAxis**
- **averageMeanOfTimeDomainBodyAccelerationOnYAxis**
- **averageMeanOfTimeDomainBodyAccelerationOnZAxis**
- **averageStandardDeviationOfTimeDomainBodyAccelerationOnXAxis**
- **averageStandardDeviationOfTimeDomainBodyAccelerationOnYAxis**
- **averageStandardDeviationOfTimeDomainBodyAccelerationOnZAxis**

The following group of variables is similar to the previous one, but for gravity acceleration instead of body acceleration.

- **averageMeanOfTimeDomainGravityAccelerationOnXAxis**
- **averageMeanOfTimeDomainGravityAccelerationOnYAxis**
- **averageMeanOfTimeDomainGravityAccelerationOnZAxis**
- **averageStandardDeviationOfTimeDomainGravityAccelerationOnXAxis**
- **averageStandardDeviationOfTimeDomainGravityAccelerationOnYAxis**
- **averageStandardDeviationOfTimeDomainGravityAccelerationOnZAxis**

The following group of variables is similar to the previous one, but for body acceleration jerk.

- **averageMeanOfTimeDomainBodyAccelerationJerkOnXAxis**
- **averageMeanOfTimeDomainBodyAccelerationJerkOnYAxis**
- **averageMeanOfTimeDomainBodyAccelerationJerkOnZAxis**
- **averageStandardDeviationOfTimeDomainBodyAccelerationJerkOnXAxis**
- **averageStandardDeviationOfTimeDomainBodyAccelerationJerkOnYAxis**
- **averageStandardDeviationOfTimeDomainBodyAccelerationJerkOnZAxis**

The following group of variables is for angular velocity.

- **averageMeanOfTimeDomainBodyAngularVelocityOnXAxis**
- **averageMeanOfTimeDomainBodyAngularVelocityOnYAxis**
- **averageMeanOfTimeDomainBodyAngularVelocityOnZAxis**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityOnXAxis**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityOnYAxis**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityOnZAxis**

The following group of variables is for the angular velocity jerk.

- **averageMeanOfTimeDomainBodyAngularVelocityJerkOnXAxis**
- **averageMeanOfTimeDomainBodyAngularVelocityJerkOnYAxis**
- **averageMeanOfTimeDomainBodyAngularVelocityJerkOnZAxis**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityJerkOnXAxis**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityJerkOnYAxis**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityJerkOnZAxis**

The following variables describe the averaged mean and the averaged standard deviation of the magnitude of the body acceleration, gravity acceleration, angular velocity signals, as well as the body acceleration jerk and angular velocity jerk, over all experiments of a single subject and activity.

- **averageMeanOfTimeDomainBodyAccelerationMagnitude**
- **averageStandardDeviationOfTimeDomainBodyAccelerationMagnitude**
- **averageMeanOfTimeDomainGravityAccelerationMagnitude**
- **averageStandardDeviationOfTimeDomainGravityAccelerationMagnitude**
- **averageMeanOfTimeDomainBodyAccelerationJerkMagnitude**
- **averageStandardDeviationOfTimeDomainBodyAccelerationJerkMagnitude**
- **averageMeanOfTimeDomainBodyAngularVelocityMagnitude**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityMagnitude**
- **averageMeanOfTimeDomainBodyAngularVelocityJerkMagnitude**
- **averageStandardDeviationOfTimeDomainBodyAngularVelocityJerkMagnitude**

At last, the following variables are similar to previous variables, but instead of the time domain signals recorded on the device, the features here are based on frequency domain signals obtained by the application of a Fast Fourier Transform (FFT) on the original signals.

- **averageMeanOfFrequencyDomainBodyAccelerationOnXAxis**
- **averageMeanOfFrequencyDomainBodyAccelerationOnYAxis**
- **averageMeanOfFrequencyDomainBodyAccelerationOnZAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationOnXAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationOnYAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationOnZAxis**
- **averageMeanOfFrequencyDomainBodyAccelerationJerkOnXAxis**
- **averageMeanOfFrequencyDomainBodyAccelerationJerkOnYAxis**
- **averageMeanOfFrequencyDomainBodyAccelerationJerkOnZAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationJerkOnXAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationJerkOnYAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationJerkOnZAxis**
- **averageMeanOfFrequencyDomainBodyAngularVelocityOnXAxis**
- **averageMeanOfFrequencyDomainBodyAngularVelocityOnYAxis**
- **averageMeanOfFrequencyDomainBodyAngularVelocityOnZAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAngularVelocityOnXAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAngularVelocityOnYAxis**
- **averageStandardDeviationOfFrequencyDomainBodyAngularVelocityOnZAxis**
- **averageMeanOfFrequencyDomainBodyAccelerationMagnitude**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationMagnitude**
- **averageMeanOfFrequencyDomainBodyAccelerationJerkMagnitude**
- **averageStandardDeviationOfFrequencyDomainBodyAccelerationJerkMagnitude**
- **averageMeanOfFrequencyDomainBodyAngularVelocityMagnitude**
- **averageStandardDeviationOfFrequencyDomainBodyAngularVelocityMagnitude**
- **averageMeanOfFrequencyDomainBodyAngularVelocityJerkMagnitude**
- **averageStandardDeviationOfFrequencyDomainBodyAngularVelocityJerkMagnitude**
