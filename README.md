## Class Assignment for Getting and Cleaning Data
Mean calculations of accelerometer and gyroscope readings

NOTE: Credit for the original materials that was used in this exercise 
goes to work done by:

  Human Activity Recognition Using Smartphones Dataset v 1.0
  Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
  activityrecognition@smartlab.ws
  www.smartlab.ws

The original training and test sets from the Human Activity Recognition Project were combined into a single set. The 
variables in the set were reduced so that only those involving the mean or standard deviation were analysed.  For each 
of these variables, a mean was calculated grouped by the subject and activity for each set of measurements.

For additional information on the original datasets used for the TidyDataset, please reference www.smartlab.ws.

For each record it is provided:

- Its activity label. 
- An identifier of the subject who carried out the experiment.
- The mean of the Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- The mean of the Triaxial Angular velocity from the gyroscope. 
- A 86-feature vector with time and frequency domain variables. 

The dataset includes the following files:

- 'ReadMe.txt'
- 'TidyDataset_Info.txt': Shows information about the variables used on the feature vector.
- 'TidyDataset.txt': The mean data set of all the measurements.

Notes: 

- Features are normalized and bounded within [-1,1].
- The mean of each feature vector is a row on the text file.
- Note that the original variable names cleaned up for readability.

## Addendum: Background information based on the original body of work provided by the Human Activity Recognition team:

*"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."*


The features in TidyDataset.txt the dataset include the following averaged measurement variables :

tBodyAccXYZ
tGravityAccXYZ
tBodyAccJerkXYZ
tBodyGyroXYZ
tBodyGyroJerkXYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAccXYZ
fBodyAccJerkXYZ
fBodyGyroXYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
