==============================================================
Course Project for Getting and Cleaning Data
==============================================================
The attached code 'run_alalysis'creates dataset 'tidy_data.txt' in following steps:
======================================
1.Loading R-packages (data.table, dplyr, tidyr) which are necessary for cleaning, reshaping and summarizing data.
2. Downloading initial zip-file from the link given on the assignment page
3. Creating list of directories of the downloaded file to make it easy to switch between directories 
4. Reading test and train data and merging them together with rbind()
5. Creating lists of subjects which took participance in the research
6. Reading 'features.txt' and extracting only those features (and their numbers) which contain mean() or std(). As a result, we have 66 features.
7.Using the numbers of the filtered features, we can extraxt columns with mean() and std() from the initial dataset.
8.Giving descriptive variable names to explain what kind of data the column contain:
=================================================================================
(time) - variables, which contain 't'  
(frequency) - variables which contain 'f' 

Acc - accelerometer data
Gyro - gyroscope data 
Mag - magnitude
=============================================================================
Full list of new variable names: 

tBodyAcc-XYZ - Body Acceleration (time) 
tGravityAcc-XYZ - Gravity Acceleration(time)
tBodyAccJerk-XYZ - the Jerk of the Body Acceleration(time)
tBodyGyro-XYZ - Body Gravity(time)
tBodyGyroJerk-XYZ - The Jerk of the Body Gravity(time)
tBodyAccMag - the Magnitude of the Body Acceleration(time)
tGravityAccMag - Gravity Acceleration and Magnitude(time)
tBodyAccJerkMag - the Jerk and Magnitude of the Body Acceleration(time)
tBodyGyroMag - the Magnitude of the Body Gravity(time)
tBodyGyroJerkMag - tBodyGyroJerkMag
fBodyAcc-XYZ - Body Acceleration (frequency)
fBodyAccJerk-XYZ - the Jerk of the Body Acceleration(frequency)
fBodyGyro-XYZ - Body Gravity(frequency)
fBodyAccMag - the Magnitude of the Body Acceleration(frequency)
fBodyAccJerkMag - the Jerk and Magnitude of the Body Acceleration(frequency)
fBodyGyroMag - the Magnitude of the Body Gravity(frequency)
fBodyGyroJerkMag - the Jerk and Magnitude of the Body Gravity(frequency) 

Variable names which contain information  about axis(XYZ) were given additional letter according to axis. 

=========================================
9. All columns of the dataset were renamed with descriptive variable names and labeled with subject and activity names.
10. Creating the second independent dataset with the average of each variable for each activity and each subject
Final dataset is tidy because it contains one variable for each column, each row contains separate observation(average for 1 of 6 activities for 1 of 30 volunteers), so it contains 180 rows.


