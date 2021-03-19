


# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Read file tab separated values and "," used as decimals points.

# subject_test.txt" y "subject_train.txt" - registros con las ID de cada sujeto.
# y_test.txt" y "y_train.txt" - actividad de cada registro codificada como números.
# activity_labels.txt - Significado de los números de las actividades "y".
# X_test.txt y X_train.txt - marco de datos en el que cada columna es una medida.
# features.txt - nombres de las medidas de "x".

X_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")

# Change the names of the columns to understand the data
names(Y_test)[names(Y_test) == "V1"] <- "Activiy"
names(Y_train)[names(Y_train) == "V1"] <- "Activiy"
names(subject_test)[names(subject_test) == "V1"] <- "ID"
names(subject_train)[names(subject_train) == "V1"] <- "ID"

# Merges the training and the test sets to create one data set.
xys_test<-cbind(subject_test, Y_test, X_test)
xys_train<-cbind(subject_train, Y_train, X_train)
traintest<-rbind(xys_train, xys_test)

# Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
# In the document features.txt, we can see the meaning of each column. The columns 
# std - Standard Desviation
# 4, 5, 6, 44, 45, 46, 84, 85, 86    
# 124, 125, 126, 164, 165, 166
# 202, 215, 228, 241, 254, 269, 270, 271
# 349, 348, 350, 427, 428, 429, 504, 517, 530, 543,
# Mean
# 1, 2, 3, 41, 42, 43, 81, 82, 83,  
# 121, 122, 123, 161, 162, 163, 
# 214, 227, 240, 253, 266, 267, 268,
# 345, 346, 347, 424, 425, 426, 503, 516, 529, 542
# We add two columns more.

tt_mainsd <-
  cbind(traintest[, 1:8], traintest[, 43:48], traintest[, 83:88], 
      traintest[, 123:128], traintest[, 163:168], traintest[, 204], 
      traintest[, 216:217], traintest[, 218], traintest[, 228:229], 
      traintest[, 242:243], traintest[, 255:256], traintest[, 268:273], 
      traintest[, 347:352], traintest[, 426:431], traintest[, 505:506], 
      traintest[, 518:519], traintest[, 531:532], traintest[, 544:545])

# Uses descriptive activity names to name the activities in the data set
# First of all, I create an array of the six activity labels
activity_labels<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", 
                  "SITTING", "STANDING", "LAYING")
# Convert numbers to the name of the activities
convert_activity<-function(num){num<-activity_labels[num]}
tt_mainsd$Activiy<-lapply(tt_mainsd[,2], convert_activity)





