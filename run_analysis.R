library(dplyr)
# read in data, features and training labels
features <- read.table("UCI HAR Dataset/features.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = c(as.character(features$V2)))
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = c(as.character(features$V2)))
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subtest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
subtrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))

# read in activity labels, make them tidy and merge them with training labels
actlabels <- read.table("UCI HAR Dataset/activity_labels.txt")
actlabels$V2 <- gsub("_","",actlabels$V2) %>% tolower()
ytest = merge(ytest, actlabels, by="V1")
ytrain = merge(ytrain, actlabels, by="V1")

# merge all data, subjects and labels
testdata <- cbind(xtest, subtest, ytest$V2)
names(testdata)[names(testdata) == "ytest$V2"] <- "activity"

traindata <- cbind(xtrain, subtrain, ytrain$V2)
names(traindata)[names(traindata) == "ytrain$V2"] <- "activity"

data <- rbind(traindata, testdata)

# extract measurements on mean and std
datameanstd <-  data[,grep("mean\\.\\.|std\\.\\.", names(data), value = T)]


# make data variable names descriptive and tidy
names(data) <- gsub("-|,|\\(|\\)|\\.", "", names(data)) %>% tolower()
names(data) <- gsub("bodybody", "body", names(data))


# extract 2nd data set with average of each activity and subject
data$subject <- as.factor(data$subject)
data2 <- aggregate(. ~subject + activity, data, FUN = mean)
write.table(data2,file="tidydata2.txt",row.names = F)

