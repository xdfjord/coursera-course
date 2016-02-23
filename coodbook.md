#Dataset
Human Activity Recognition Using Smartphones Dataset Codebook

##Overview
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.<br>
Smartlab - Non Linear Complex Systems Laboratory<br>
DITEN - Universit?degli Studi di Genova.<br>
Via Opera Pia 11A, I-16145, Genoa, Italy.<br>
activityrecognition@smartlab.ws<br>
www.smartlab.ws<br>

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.<br> 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

###Details
The dataset includes the following files:<br>
=========================================<br>
- 'README.txt'<br>
- 'features_info.txt': Shows information about the variables used on the feature vector.<br>
- 'features.txt': List of all features.<br>
- 'activity_labels.txt': Links the class labels with their activity name.<br>
- 'train/X_train.txt': Training set.<br>
- 'train/y_train.txt': Training labels.<br>
- 'test/X_test.txt': Test set.<br>
- 'test/y_test.txt': Test labels.<br>
=========================================<br>
The following files are available for the train and test data. Their descriptions are equivalent. <br>
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. <br>
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. <br>
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. <br>
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. <br>
=========================================<br>
- Features are normalized and bounded within [-1,1].<br>
- Each feature vector is a row on the text file.

###Transformation details
1) Merges the training and the test sets to create one data set.<br>
2) Extracts only the measurements on the mean and standard deviation for each measurement.<br>
3) Uses descriptive activity names to name the activities in the data set<br>
4) Appropriately labels the data set with descriptive activity names.<br>
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br>

###Work Steps
1) Install or load reshapre2 and data.table.<br>
2) Load test, test subject, train and train subject data.<br>
3) Load features, activity labels.<br>
4) Extract mean and standard deviation columns and match feature, activity and subject data.<br>
5) Merge test and train data.<br>
6) Save tindy data txt.<br>
