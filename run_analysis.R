## Loading necessary packages
library(data.table)
library(tidyr)
library(dplyr)
## Downloading data from the web
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip '
download.file(url, destfile = 'getdata_projectfiles_UCI HAR Dataset.zip')
unzip('getdata_projectfiles_UCI HAR Dataset.zip')
dirs <- list.dirs(getwd())
setwd(dirs[4])
## Reading the test and train data
test <- read.table('X_test.txt')
test <- data.table(test)
labels_test <- readLines('y_test.txt') 
subject_test <- readLines('subject_test.txt')
setwd(dirs[6])
train <- read.table('X_train.txt')
train <- data.table(train)
labels_train <- readLines('y_train.txt')
subject_train <- readLines('subject_train.txt')
## Creating summary vectors for labels and subjects
labels_sum <- c(labels_test, labels_train)
sum_subject <- c(subject_test, subject_train)
## Step 1. Merging train and test datasets together
set <- bind_rows(test, train)
## Step 2. Extracting features which contain mean() and std()
setwd(dirs[3])
features <- read.table('features.txt')
features <- rename(features, number = V1, name = V2)
features <- separate(features, name, into = c('feature', 'meas', 'letter'), sep = '-')
features <- filter(features, meas == 'mean()'| meas == 'std()')
columns <- features$number
features$feature <- as.character(features$feature)
features_list <- features$feature
## Step 4. Renaming the selected features (mean(), std()) with descriptive names
for (i in 1:66){
         if (features_list[i] == 'fBodyAcc'){
                        features$feature[i] <- 'Body Acceleration (frequency)'
         }
        if (features_list[i] == 'tBodyAcc'){
                features$feature[i] <- 'Body Acceleration (time)'
        }
        if (features_list[i] == 'fBodyAccJerk'){
                features$feature[i] <- 'the Jerk of the Body Acceleration(frequency)'
        }
        if (features_list[i] == 'tBodyAccJerk'){
                features$feature[i] <- 'the Jerk of the Body Acceleration(time)'
        }
        if (features_list[i] == 'fBodyAccMag'){
                features$feature[i] <- 'the Magnitude of the Body Acceleration(frequency)'
        }
        if (features_list[i] == 'tBodyAccMag'){
                features$feature[i] <- 'the Magnitude of the Body Acceleration(time)'
        }
        if (features_list[i] == 'fBodyBodyAccJerkMag'){
                features$feature[i] <- 'the Jerk and Magnitude of the Body Acceleration(frequency)'
        }
        if (features_list[i] == 'tBodyAccJerkMag'){
                features$feature[i] <- 'the Jerk and Magnitude of the Body Acceleration(time)'
        }
        if (features_list[i] == 'fBodyBodyGyroJerkMag'){
                features$feature[i] <- 'the Jerk and Magnitude of the Body Gravity(frequency)'
        }
        if (features_list[i] == 'fBodyGyro'){
                features$feature[i] <- 'Body Gravity(frequency)'
        }
        if (features_list[i] == 'tBodyGyro'){
                features$feature[i] <- 'Body Gravity(time)'
        }
        if (features_list[i] == 'fBodyBodyGyroMag'){
                features$feature[i] <- 'the Magnitude of the Body Gravity(frequency)'
        }
        if (features_list[i] == 'tBodyGyroMag'){
                features$feature[i] <- 'the Magnitude of the Body Gravity(time)'
        }
        if (features_list[i] == 'tGravityAcc'){
                features$feature[i] <- 'Gravity Acceleration(time)'
        }
        if (features_list[i] == 'tGravityAccMag'){
                features$feature[i] <- 'Gravity Acceleration and Magnitude(time)'
        }
        if (features_list[i] == 'tBodyGyroJerk'){
                features$feature[i] <- 'The Jerk of the Body Gravity(time)'
        }
        if (features_list[i] == 'tBodyGyroJerkMag'){
                features$feature[i] <- 'The Jerk and the Magnitude of the Body Gravity(time)'
        }
}
features$feature <- as.character(features$feature)
features$meas <- as.character(features$meas)
features$letter <- as.character(features$letter)
for (i in 1:66) {
        if (is.na(features$letter[i]) == TRUE) {
                 features$variable [i] <- paste(features$meas[i], features$feature[i])       
        } else {
                features$variable [i] <- paste(features$meas[i], features$feature[i], features$letter[i])       
               }
}
## Selecting columns from the first dataset and labeling it with descriprive variable names 
set <- select(set, columns)
names(set) <- features$variable
## Step 3. Creating descriptive names for each activity in the dataset
activity_labels <- read.table('activity_labels.txt')
activity_labels <- data.table(activity_labels)
activity_labels <- rename(activity_labels,labels = V1, activity = V2)
set$volunteer <- sum_subject
set$labels <- labels_sum
set$labels <- as.numeric(set$labels)
set <- merge(set, activity_labels, by = 'labels')
## Creating the second independent dataset with the average of each variable for each activity and each subject
final <- data.table()
for (i in 1:30){
        vol <- filter(set, volunteer == i)
        vol <- data.table(vol)
        fin <- data.table()
        for(i in 1:6) {
                lab <- filter(vol, labels == i)
                lab <- summarize_each(lab, funs(mean))
                fin <- rbind(fin, lab)
                fin$volunteer <- vol$volunteer[1]
                }
        final <- rbind(final,fin)
}
final <- select(final, -(activity)) 
final <- merge(final, activity_labels, by = 'labels')
final <- select(final, c(labels, activity, volunteer, final[,2:67]))
View(final)