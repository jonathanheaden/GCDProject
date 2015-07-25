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
selectedFeatures <- lapply(requiredFeatures,print)
subjectsandactivities <- select(allData,SubjectID,Activity)
meansandstds <- select(allData, one_of(selectedFeatures$V1))
selectedData <- cbind(subjectsandactivities,meansandstds)

# 3. Use descriptive activity names to name the activities in the data set
activities <- read.table('./activity_labels.txt')
activities <- rename(activities,Activity=V1,ActivityDescription = V2)
mergedData <- merge(selectedData,activities)

# 4. Appropriately label the data set with descriptive variable names. 
#colname <- filter(lookupFrame,grepl("V2$",Lookup)) %>% select(V2)
lookupFrame <- mutate(filter(features, grepl("mean|std",V2)),Lookup=paste("V",V1,sep="") )
# Use the following code to regenerate the renaming commands if the data changes
# Then paste over the below commands:

## renameVars <- vector()
## lapply(lookupFrame, renameVars <- print(paste("mergedData <- rename(mergedData,'",lookupFrame$V2,"'=",lookupFrame$Lookup,")",sep="" ),quote=FALSE ) )

mergedData <- rename(mergedData,tBodyAccmeanX=V1)               
mergedData <- rename(mergedData,tBodyAccmeanY=V2)                
mergedData <- rename(mergedData,tBodyAccmeanZ=V3)                
mergedData <- rename(mergedData,tBodyAccstdX=V4)                 
mergedData <- rename(mergedData,tBodyAccstdY=V5)                 
mergedData <- rename(mergedData,tBodyAccstdZ=V6)                 
mergedData <- rename(mergedData,tGravityAccmeanX=V41)            
mergedData <- rename(mergedData,tGravityAccmeanY=V42)            
mergedData <- rename(mergedData,tGravityAccmeanZ=V43)            
mergedData <- rename(mergedData,tGravityAccstdX=V44)             
mergedData <- rename(mergedData,tGravityAccstdY=V45)             
mergedData <- rename(mergedData,tGravityAccstdZ=V46)            
mergedData <- rename(mergedData,tBodyAccJerkmeanX=V81)           
mergedData <- rename(mergedData,tBodyAccJerkmeanY=V82)           
mergedData <- rename(mergedData,tBodyAccJerkmeanZ=V83)           
mergedData <- rename(mergedData,tBodyAccJerkstdX=V84)            
mergedData <- rename(mergedData,tBodyAccJerkstdY=V85)            
mergedData <- rename(mergedData,tBodyAccJerkstdZ=V86)            
mergedData <- rename(mergedData,tBodyGyromeanX=V121)             
mergedData <- rename(mergedData,tBodyGyromeanY=V122)             
mergedData <- rename(mergedData,tBodyGyromeanZ=V123)             
mergedData <- rename(mergedData,tBodyGyrostdX=V124)              
mergedData <- rename(mergedData,tBodyGyrostdY=V125)              
mergedData <- rename(mergedData,tBodyGyrostdZ=V126)              
mergedData <- rename(mergedData,tBodyGyroJerkmeanX=V161)         
mergedData <- rename(mergedData,tBodyGyroJerkmeanY=V162)         
mergedData <- rename(mergedData,tBodyGyroJerkmeanZ=V163)         
mergedData <- rename(mergedData,tBodyGyroJerkstdX=V164)          
mergedData <- rename(mergedData,tBodyGyroJerkstdY=V165)          
mergedData <- rename(mergedData,tBodyGyroJerkstdZ=V166)          
mergedData <- rename(mergedData,tBodyAccMagmean=V201)             
mergedData <- rename(mergedData,tBodyAccMagstd=V202)              
mergedData <- rename(mergedData,tGravityAccMagmean=V214)          
mergedData <- rename(mergedData,tGravityAccMagstd=V215)           
mergedData <- rename(mergedData,tBodyAccJerkMagmean=V227)         
mergedData <- rename(mergedData,tBodyAccJerkMagstd=V228)          
mergedData <- rename(mergedData,tBodyGyroMagmean=V240)            
mergedData <- rename(mergedData,tBodyGyroMagstd=V241)             
mergedData <- rename(mergedData,tBodyGyroJerkMagmean=V253)        
mergedData <- rename(mergedData,tBodyGyroJerkMagstd=V254)         
mergedData <- rename(mergedData,fBodyAccmeanX=V266)              
mergedData <- rename(mergedData,fBodyAccmeanY=V267)              
mergedData <- rename(mergedData,fBodyAccmeanZ=V268)              
mergedData <- rename(mergedData,fBodyAccstdX=V269)               
mergedData <- rename(mergedData,fBodyAccstdY=V270)               
mergedData <- rename(mergedData,fBodyAccstdZ=V271)               
mergedData <- rename(mergedData,fBodyAccmeanFreqX=V294)          
mergedData <- rename(mergedData,fBodyAccmeanFreqY=V295)          
mergedData <- rename(mergedData,fBodyAccmeanFreqZ=V296)          
mergedData <- rename(mergedData,fBodyAccJerkmeanX=V345)          
mergedData <- rename(mergedData,fBodyAccJerkmeanY=V346)          
mergedData <- rename(mergedData,fBodyAccJerkmeanZ=V347)          
mergedData <- rename(mergedData,fBodyAccJerkstdX=V348)           
mergedData <- rename(mergedData,fBodyAccJerkstdY=V349)           
mergedData <- rename(mergedData,fBodyAccJerkstdZ=V350)           
mergedData <- rename(mergedData,fBodyAccJerkmeanFreqX=V373)      
mergedData <- rename(mergedData,fBodyAccJerkmeanFreqY=V374)      
mergedData <- rename(mergedData,fBodyAccJerkmeanFreqZ=V375)      
mergedData <- rename(mergedData,fBodyGyromeanX=V424)             
mergedData <- rename(mergedData,fBodyGyromeanY=V425)             
mergedData <- rename(mergedData,fBodyGyromeanZ=V426)             
mergedData <- rename(mergedData,fBodyGyrostdX=V427)              
mergedData <- rename(mergedData,fBodyGyrostdY=V428)              
mergedData <- rename(mergedData,fBodyGyrostdZ=V429)              
mergedData <- rename(mergedData,fBodyGyromeanFreqX=V452)         
mergedData <- rename(mergedData,fBodyGyromeanFreqY=V453)         
mergedData <- rename(mergedData,fBodyGyromeanFreqZ=V454)         
mergedData <- rename(mergedData,fBodyAccMagmean=V503)             
mergedData <- rename(mergedData,fBodyAccMagstd=V504)              
mergedData <- rename(mergedData,fBodyAccMagmeanFreq=V513)         
mergedData <- rename(mergedData,fBodyBodyAccJerkMagmean=V516)     
mergedData <- rename(mergedData,fBodyBodyAccJerkMagstd=V517)      
mergedData <- rename(mergedData,fBodyBodyAccJerkMagmeanFreq=V526) 
mergedData <- rename(mergedData,fBodyBodyGyroMagmean=V529)        
mergedData <- rename(mergedData,fBodyBodyGyroMagstd=V530)         
mergedData <- rename(mergedData,fBodyBodyGyroMagmeanFreq=V539)    
mergedData <- rename(mergedData,fBodyBodyGyroJerkMagmean=V542)    
mergedData <- rename(mergedData,fBodyBodyGyroJerkMagstd=V543)     
mergedData <- rename(mergedData,fBodyBodyGyroJerkMagmeanFreq=V552)

# 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

#measurements <- lookupFrame$V2 #c(lookupFrame["V2"])
measurements <- c(
    "tBodyAccmeanX",            "tBodyAccmeanY",               "tBodyAccmeanZ",              
    "tBodyAccstdX",                "tBodyAccstdY",                "tBodyAccstdZ",               
    "tGravityAccmeanX",            "tGravityAccmeanY",            "tGravityAccmeanZ",           
    "tGravityAccstdX",             "tGravityAccstdY",             "tGravityAccstdZ",            
    "tBodyAccJerkmeanX",           "tBodyAccJerkmeanY",           "tBodyAccJerkmeanZ",          
    "tBodyAccJerkstdX",            "tBodyAccJerkstdY",            "tBodyAccJerkstdZ",           
    "tBodyGyromeanX",              "tBodyGyromeanY",              "tBodyGyromeanZ",             
    "tBodyGyrostdX",               "tBodyGyrostdY",               "tBodyGyrostdZ",              
    "tBodyGyroJerkmeanX",          "tBodyGyroJerkmeanY",          "tBodyGyroJerkmeanZ",         
    "tBodyGyroJerkstdX",           "tBodyGyroJerkstdY",           "tBodyGyroJerkstdZ",          
    "tBodyAccMagmean",             "tBodyAccMagstd",               "tGravityAccMagmean",          
    "tGravityAccMagstd",            "tBodyAccJerkMagmean",          "tBodyAccJerkMagstd",          
    "tBodyGyroMagmean",             "tBodyGyroMagstd",              "tBodyGyroJerkMagmean",        
    "tBodyGyroJerkMagstd",          "fBodyAccmeanX",               "fBodyAccmeanY",              
    "fBodyAccmeanZ",               "fBodyAccstdX",                "fBodyAccstdY",               
    "fBodyAccstdZ",                "fBodyAccmeanFreqX",           "fBodyAccmeanFreqY",          
    "fBodyAccmeanFreqZ",           "fBodyAccJerkmeanX",           "fBodyAccJerkmeanY",          
    "fBodyAccJerkmeanZ",           "fBodyAccJerkstdX",            "fBodyAccJerkstdY",           
    "fBodyAccJerkstdZ",           "fBodyAccJerkmeanFreqX",       "fBodyAccJerkmeanFreqY",      
    "fBodyAccJerkmeanFreqZ",       "fBodyGyromeanX",              "fBodyGyromeanY",             
    "fBodyGyromeanZ",              "fBodyGyrostdX",               "fBodyGyrostdY",              
    "fBodyGyrostdZ",               "fBodyGyromeanFreqX",          "fBodyGyromeanFreqY",         
    "fBodyGyromeanFreqZ",          "fBodyAccMagmean",              "fBodyAccMagstd",              
    "fBodyAccMagmeanFreq",          "fBodyBodyAccJerkMagmean",      "fBodyBodyAccJerkMagstd",     
    "fBodyBodyAccJerkMagmeanFreq",  "fBodyBodyGyroMagmean",         "fBodyBodyGyroMagstd",         
    "fBodyBodyGyroMagmeanFreq",     "fBodyBodyGyroJerkMagmean",     "fBodyBodyGyroJerkMagstd",   
    "fBodyBodyGyroJerkMagmeanFreq"
)

meltedData <- melt(mergedData,id=c("ActivityDescription","SubjectID"),measure.vars = measurements)

ActivityData <- dcast(meltedData,ActivityDescription ~ variable, mean)
SubjectData <- dcast(meltedData,SubjectID ~variable, mean)
ActivityData <- rename(ActivityData,ObjectOfMeasurement=ActivityDescription)
SubjectData <- rename(SubjectData,ObjectOfMeasurement=SubjectID)
SubjectData <- mutate(SubjectData, ObjectOfMeasurement=paste("Subject",ActivityOrSubject,sep=""))
MergedActvityAndSubjectData <- rbind(ActivityData,SubjectData)

# Write the data to tables
write.table(ActivityData, "./ActivityDataShaped.txt", sep="\t")
write.table(SubjectData, "./SubjectDataShaped.txt", sep="\t")
write.table(MergedActvityAndSubjectData, "./AllActivityAndSubjectData.txt", sep="\t")
