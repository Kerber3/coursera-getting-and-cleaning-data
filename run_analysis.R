## 1 upload of data sets ##

X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"")
X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"")
features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")

## 2 put data together; first rowwise and then coloumnwise ##

subject <- rbind(subject_test, subject_train)
label <- rbind(y_test,y_train)
data <- rbind(X_test,X_train) 

## 3 set variable names ##

colnames(data)<-features[,2]

## 4 select coloumns ##

data <- alldata[ , !duplicated(colnames(alldata))]     ### not using this expression error occured - duplicated coloumnnames
extract_data <- select(data, matches("(mean|std)\\(.*\\)"))

alldata <- cbind(subject, label, extract_data)

alldata<- rename(subject=V1,label=V2)

## 5 set Activity labels as character 
data$Activity <- factor(data$Activity,label=as.character(activity_labels$V2))

## 6 tidy variable names ##

str(alldata) ## show structure of datas

# write out the variable names
names(alldata)<-gsub("^t", "time", names(alldata))
names(alldata)<-gsub("^f", "frequency", names(alldata))
names(alldata)<-gsub("Acc", "Accelerometer", names(alldata))
names(alldata)<-gsub("Gyro", "Gyroscope", names(alldata))
names(alldata)<-gsub("Mag", "Magnitude", names(alldata))
names(alldata)<-gsub("BodyBody", "Body", names(alldata))

# delete - out of names
names(alldata)<-gsub("-", "", names(alldata))






