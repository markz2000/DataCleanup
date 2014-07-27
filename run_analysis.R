# Course Project

activities=read.table("./ProjectData/UCI HAR Dataset/activity_labels.txt")
features = read.table("./ProjectData/UCI HAR Dataset/features.txt")

subject_train = read.table("./ProjectData/UCI HAR Dataset/train/subject_train.txt")
y_train = read.table("./ProjectData/UCI HAR Dataset/train/y_train.txt")
x_train = read.table("./ProjectData/UCI HAR Dataset/train/X_train.txt")

subject_test = read.table("./ProjectData/UCI HAR Dataset/test/subject_test.txt")
y_test = read.table("./ProjectData/UCI HAR Dataset/test/y_test.txt")
x_test = read.table("./ProjectData/UCI HAR Dataset/test/X_test.txt")

## Process Training Data
training_data=data=x_train          ## Copy data for processing

names(training_data) = gsub("-","_",gsub("\\(|)","",features$V2))  # remove '()' frmo the column name and replaces '-' to '_'

meanCols = names(training_data[grep("mean",names(training_data))])  ## Select column names for 'mean' measurements
stdCols = names(training_data[grep("std",names(training_data))])  ## Select column names for 'std' measurements
allColls = sort(c(stdCols,meanCols))    ## Create sorted columns list

tData = subset(training_data,select=allColls)

## Process Testing Data
testing_data=data=x_test          ## Copy data for processing
names(testing_data) = gsub("-","_",gsub("\\(|)","",features$V2))  # remove '()' frmo the column name and replaces '-' to '_'

tstData = subset(training_data,select=allColls)

## Join test and training data 

joinedData = data.frame(tstData,tData)

write.table(joinedData,"./tidyData")