# Getting and Cleaning Data - Course Project

## Description:

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!


## Understanding the run_analysis.R script:

### Dependencies:

* Download the zip file, unzip it and put on your working directory.
* The script needs two packages in order to run properly: dplyr and data.table. Then, the script verifies and make sure if you have them installed; otherwise, the script will install them.


### Steps:

* 1. Reads the supporting metadata: features.txt and activity_labels.txt.
* 2. Reads the training and test data sets: subject_train.txt, x_train.txt, y_train.txt, subject_test.txt, x_test.txt and y_test.txt.
* 3. Names the columns.
* 4. Merges the data sets.
* 5. Uses grep() function to extract columns with mean or std in them.
* 6. As activity names is originally numeric type, the script converts it to character so that we can name them using activity_lables.txt.
* 7. Converts to factor after labeling.
* 8. Deals with abreviations in the column names, for example, "Acc" turns to "Accelerometer", "Mag" to "Magnitude" and so forth.
* 9. Uses aggregate() function to create a new data set containing the average of each variable for each activity and subject.
* 10. Returns the new data set, called tidydata.txt.
