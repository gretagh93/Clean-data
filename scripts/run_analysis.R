# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names. 
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# Read file tab separated values and "," used as decimals points.

# subject_test.txt" y "subject_train.txt" - registros con las ID de cada sujeto.
# y_test.txt" y "y_train.txt" - actividad de cada registro codificada como números.
# activity_labels.txt - Significado de los números de las actividades "y".
# X_test.txt y X_train.txt - marco de datos en el que cada columna es una medida.
# features.txt - nombres de las medidas de "x".

# mergedata <- merge(edu, dom, by.y="CountryCode", all=TRUE)

X_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_train.txt")
Y_train <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_train.txt")
subject_train <- read.table("./data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_train.txt")



