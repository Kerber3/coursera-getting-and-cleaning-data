X_train <- read.table("D:/Users/Katja/Dropbox/UCI HAR Dataset/train/X_train.txt", quote="\"")


X_test <- read.table("D:/Users/Katja/Dropbox/UCI HAR Dataset/test/X_test.txt", quote="\"")
View(X_test)
features <- read.table("D:/Users/Katja/Dropbox/UCI HAR Dataset/features.txt", quote="\"")
View(features)




list <-as.list(features$V2)
names(alldata)
list
colnames(X_test) <- list
colnames(X_train) <- list


alldata <- rbind(X_test,X_train) 
data <- alldata[ , !duplicated(colnames(alldata))]
extract_Data <- select(data,  matches("(mean|std)\\(.*\\)"))
