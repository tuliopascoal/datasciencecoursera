if (!require("data.table")) {
        install.packages("data.table")
}

if (!require("dplyr")) {
        install.packages("dplyr")
}

require("data.table")
require("dplyr")

## Reading supporting data ##

feature_names <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)


## Reading traning data sets ##

subj_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
act_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
feat_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

## Reading test data sets ##

subj_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
act_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
feat_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

#### Goal 1: Merges the training and the test sets to create one data set. ####

subject <- rbind(subj_train, subj_test)
activity <- rbind(act_train, act_test)
features <- rbind(feat_train, feat_test)

## Naming the columns ##

colnames(features) <- t(feature_names[2])

## Merging the data ##

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
complete_data <- cbind(features,activity,subject)


#### Goal 2: Extracts only the measurements on the mean and standard deviation for each measurement. ####

columns_mean_std <- grep(".*Mean.*|.*Std.*", names(complete_data), ignore.case=TRUE)

required_cols <- c(columns_mean_std, 562, 563)

mean_std_data <- complete_data[,required_cols]



#### Goal 3: Uses descriptive activity names to name the activities in the data set. ####

mean_std_data$Activity <- as.character(mean_std_data$Activity)
range <- 1:6

## Labeling activities ##

                for (i in range) {
                        mean_std_data$Activity[mean_std_data$Activity == i] <- as.character(activity_labels[i,2])
               }
mean_std_data$Activity <- as.factor(mean_std_data$Activity)



#### Goal 4: Appropriately labels the data set with descriptive variable names. ####


names(mean_std_data)<-gsub("Acc", "Accelerometer", names(mean_std_data))
names(mean_std_data)<-gsub("Gyro", "Gyroscope", names(mean_std_data))
names(mean_std_data)<-gsub("BodyBody", "Body", names(mean_std_data))
names(mean_std_data)<-gsub("Mag", "Magnitude", names(mean_std_data))
names(mean_std_data)<-gsub("^t", "Time", names(mean_std_data))
names(mean_std_data)<-gsub("^f", "Frequency", names(mean_std_data))
names(mean_std_data)<-gsub("tBody", "TimeBody", names(mean_std_data))
names(mean_std_data)<-gsub("-mean()", "Mean", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data)<-gsub("-std()", "STD", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data)<-gsub("-freq()", "Frequency", names(mean_std_data), ignore.case = TRUE)
names(mean_std_data)<-gsub("angle", "Angle", names(mean_std_data))
names(mean_std_data)<-gsub("gravity", "Gravity", names(mean_std_data))


#### Goal 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. ####


mean_std_data$Subject <- as.factor(mean_std_data$Subject)
mean_std_data <- data.table(mean_std_data)

tidyData <- aggregate(. ~Subject + Activity, mean_std_data, mean)
tidyData <- tidyData[order(tidyData$Subject,tidyData$Activity),]
write.table(tidyData, file = "tidydata.txt", row.names = FALSE)
