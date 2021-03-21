# Clean-data

Download all the project in your R program, set Clean-data as your working directory using setwd() function in RStudioand execute the script run_analysis.R <br />

In the folder data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/, there is another README.md, which explains all the data of this project. <br />

In the folder scripts, there is one script called run_analysis.R in the folder scripts. <br />
This script:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The result of this program is in result.txt, in the main folder, Clean-data.
