# Project´s CodeBook

This CodeBook describes the variables, the data, and any transformations or work that I needed to clean up the data.


## The Data Set

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Input Data Sets used

The input data sets are located in "UCI HAR Dataset" folder. 

* UCI HAR Dataset:

  * activity_labels.txt -  names of the different activities.
  * features.txt - names of features of the data sets.

* UCI HAR Dataset/test:

  * X_test.txt - variable results for testing.
  * y_test.txt - activities relationed to X_test.txt.
  * subject_test.txt - information from whom data was collected.
   
* UCI HAR Dataset/train:

  * X_train.txt - variable results for training.
  * y_train.txt - activities relationed to X_train.txt.
  * subject_train.txt - information from whom data was collected.


## Transformations used

From the input data sets, some transformation were done.

* See the variables and its correspondent read files below:

  * The variable *feature_names* reads the file features.txt.
  * The variable *activity_labels* reads the file activity_labels.txt.
  * The variable *subj_train* reads the file subject_train.txt
  * The variable *act_train* reads the file y_train.txt.
  * The variable *feat_train* reads the file X_train.txt.
  * The variable *subj_test* reads the file subject_test.txt
  * The variable *act_test* reads the file y_test.txt.
  * The variable *feat_test* reads the file X_test.txt.

* See some merges that were used below:

  * The variable *subject* receives a merge of subjects in traning and test data sets.
  * The variable *activity* receives a merge of activities in traning and test data sets.
  * The variable *features* receives a merge of features in traning and test data sets.
  * The variable *features* receives an update in its column names from *features_names* variable.
  * The variable *activity* receives an update in its colum names to "Activity".
  * The variable *subject* receives an update in its colum names to "Subject".
  * The variable *complete_data* receives a merge of the following variables: *features*, *activity* and *subject*.
  
* See some extractions that were used below:

  * The variable *columns_mean_std* extracts the columns: Mean and Std from *complete_data*.
  * The variable *required_cols* gets the indices of the columns that have mean or std, activity and subject.
  * The variable *mean_std_data* receives the data contained in *required_cols*.
  
* See some cleaning operations that were done below:

  * The column "Activity" in *mean_std_data* are converted to character, firstly. Then, receives descriptive names from *activity_labels*. Finally, the colum "Activity" is converted to factor.
  * The column "Subject" in *mean_std_data* is converted to factor as well.
  * Some acronyms in *mean_std_data* are replaced by descriptive names. For example, "tBody" -> "TimeBody", "Gyro" -> "Gyroscope" and so forth.   
  
* See the operations to build the new tidy data set below:

  * The variable *mean_std_data* is converted to data.table.
  * The variable *tidyData* receives the average for each subject and activity in *mean_std_data* and ordered at the same time.
  * The function write.table() is used to write the contenct of *tidyData* in a file called tidydata.txt.
   
  
## Output

The Script´s output is a data set called tidydata.txt, where you can find the mean() e std() values of the data in the input files listed above. Also, as the name says, this output was built for a more easy way to read and understand the data, in other words, a tidy data.
