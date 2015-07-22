library(dplyr)

# 1. Merge the training and the test sets to create one data set.

testDataX <- read.table("./test/X_test.txt")
testDataY <- read.table("./test/y_test.txt")
testSubjects <- read.table("./test/subject_test.txt")
trainDataX <- read.table("./train/X_train.txt")
trainDataY <- read.table("./train/y_train.txt")
trainSubjects <- read.table("./train/subject_train.txt")
testDataY<-rename(testDataY,Activity=V1)
trainDataY<-rename(trainDataY,Activity=V1)
testSubjects <- rename(testSubjects,SubjectID=V1)
trainSubjects <- rename(trainSubjects,SubjectID=V1)
                      

testData <- cbind(testSubjects,testDataY,testDataX)
trainData <- cbind(trainSubjects,trainDataY,trainDataX)

allData <- rbind(testData,trainData)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./features.txt")
requiredFeatures <- filter(features, grepl("mean()|std()",V2)) %>% select (V1)
requiredFeatures <- mutate(requiredFeatures, V1=paste("V",V1,sep=""))
subjectsandactivities <- select(allData,SubjectID,Activity)
meansandstds <- select(allData, one_of(as.vector(requiredFeatures, mode="character")))
selectedData <- cbind(subjectsandactivities,meansandstds)

# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive variable names. 
# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
