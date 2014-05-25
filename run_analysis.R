#read and combine data

testDataX <- read.table("/home/saasbook/UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
trainDataX <- read.table("/home/saasbook/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
combinedDataX <- rbind(testDataX, trainDataX)

testDataY <- read.table("/home/saasbook/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
trainDataY <- read.table("/home/saasbook/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
combinedDataY <- rbind(testDataY, trainDataY)

testDataSubject <- read.table("/home/saasbook/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
trainDataSubject <- read.table("/home/saasbook/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
combinedDataSubject <- rbind(testDataSubject, trainDataSubject)

allData <- combinedDataX
allData[562] <- combinedDataY[1]
allData[563] <- combinedDataSubject[1]

#get fields that are mean / std and create a new data frame 

features <- read.table("/home/saasbook/UCI HAR Dataset/features.txt", header = FALSE, sep = "")
meanOrStdIndices <- grep("mean\\(\\)|std\\(\\)",features[2])
meanOrStdMeasurements <- allData[meanOrStdIndices]


#create the tidy data set

library(reshape)
Molten <- melt(allData, id.vars = c("V1.1","V1.2"))
tidySet <- cast(V1.2 +  variable ~ V1.1, data = Molten, fun = mean)

#rename columns with activity names
colNames <- c("SUBJECT", "VARIABLE","WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
colnames(tidySet) <- colNames
write.table(tidySet,file="tidySet.txt",row.names=FALSE,quote=FALSE)
