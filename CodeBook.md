The initial dataset contains information about 30 volunteers, which performed 6 activities (walking, walking upstairs, sitting, standing, laying) wearing a smartphone on their waist. 30 % of the data is test and 70 % is train. All measurements include signals which come from accelerometer and gyroscope from 3 axis: X, Y, Z. The data also contains Jerk signals (body linear acceleration and angular velocity derived in time) and magnitude of 3-dimensional signals. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
In order to explain what type of measurement is in the column, all columns have been given descriptive names:

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

The dataset 'tidy_data' contains averages for each type of activity for each volunteer. The first three columns are labels (from 1 to 6). According to labels there are activities. All the averages arranged in order from 1 to 30 according to the volunteer numbers. 
