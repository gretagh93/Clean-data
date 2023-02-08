# CLEANNING DATA SET

# Read file tab separated values and "," used as decimals points.
X_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
labels <- read.table(
  "./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")

# Change the names of the columns to understand the data
names(Y_test)[names(Y_test) == "V1"] <- "Activity"
names(Y_train)[names(Y_train) == "V1"] <- "Activity"
names(subject_test)[names(subject_test) == "V1"] <- "ID"
names(subject_train)[names(subject_train) == "V1"] <- "ID"

# Merges the training and the test sets to create one data set.
xys_test<-cbind(subject_test, Y_test, X_test)
xys_train<-cbind(subject_train, Y_train, X_train)
traintest<-rbind(xys_train, xys_test)

# Extracts only the measurements on the mean (mean()) and standard deviation for each measurement. 

# Get the number of column of mesurement and mean
mm<-labels[grepl("*mean\\(|*std\\(", labels$V2),]
# Add two columns more (Activity and ID).
getcol<-function(num){traintest[,num+2]}
tt_mainsd<-sapply(mm$V1, getcol)
tt_mainsd<-as.data.frame(tt_mainsd)
id<-traintest$ID
activity<-traintest$Activity
tt_mainsd<-cbind(id, activity, tt_mainsd)

# Uses descriptive activity names to name the activities in the dataset
# First of all, I create an array of the six activity labels
activity_labels<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
          "SITTING", "STANDING", "LAYING")
# Convert numbers to the name of the activities
actLab<-function(num){num<-activity_labels[num]}
tt_mainsd$activity<-lapply(tt_mainsd[,2], actLab)

# Appropriately labels the data set with descriptive variable names. 
# Create the descriptive labels with mm
mm<-gsub("-", " ", mm$V2)
mm<-sub("^f", "Frequency ", mm)
mm<-sub("^t", "Time ", mm)
# Change the names of the columns
colnames(tt_mainsd)<-c("id", "activity", mm)

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
tt_mainsd$activity<-unlist(tt_mainsd$activity)
# Split tt_mainsd
t<-split(tt_mainsd, tt_mainsd$id)
mean_vector<-c()
# Create the new data frame and get the average.
df<-data.frame()
for(id in c(1:30)){
  mean_dataframe<-data.frame()
  mean_dataframe<-data.frame(id=rep(id, times = 6))
  for (column in c(3:68)){
    mean_dataframe<-
      cbind(mean_dataframe, 
            c(mean_vector, tapply(t$"1"[[column]], t$"1"$activity, mean)))}
  df<-rbind(df, mean_dataframe)
}
# Change labels of the new data frame.
df<-data.frame(df$id, rownames(df), df[2:67])
rownames(df)<-c(1:180)
colnames(df)<-c("id", "activity", mm)

# Write the final result in a txt
write.table(df, "./result.txt", row.names=FALSE)




