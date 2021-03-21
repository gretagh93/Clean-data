## Codebook

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. </br>
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


### Information about data
#### Read file tab separated values and "," used as decimals points.
Read the different files with read.table.
- subject_test: ID of each test register.
- subject_train: ID of each train register.
- y_test: Activity of each test register codify with numbers.
- y_train: Activity of each train register codify with numbers.
- labels: Meaining of the activities (y_test and y_train)
- X_test: Each column is a test mesure.
- X_train: Each column is a train mesure.

#### Merges the training and the test sets to create one data set
Use cbind and rbind to merge the data sets
- xys_test: All test data
- xys_train: All train data
- traintest: All test and train data

#### Get the number of column of mesurement and mean
Subset data.
- mm: Labels of the table
- getcol: Function that get the numbers
- tt_mainsd: Table of mesurements of mean and std

#### Uses descriptive activity names to name the activities in the data set
Use lapply to convert activities to characters
- activity_labels: array of the six activity labels
- actLab: Function that convert numbers to names of the actvity

#### Appropriately labels the data set with descriptive variable names
With gsub and sub, get and change the names of the data

#### From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Split data and get the average
- t: Table with split data of tt_mainsd
- mean_dataframe: Data frame who contains the different average and put them on the df data frame.
- df: Result data frame which contains the averache of each variable for each activity and each subject.

#### Change labels of the new data frame
Change the labels of df with rownames and colnames
