# Course Project for 'Getting and Cleaning Data with R'

## Analysis steps
### 1. Merge the training and the test sets to create one data set.
First step is to assemble the data;  
test and train x files contain the data readings.    
test and train y files contain the Activity ID for each recording.
test and train subject files contain the Subject ID for each recording. 
The variable names in the y & subject frames need to be renamed to avoid conflict with the V1 name in the x files.    

The various component frames are joined with cbind, then the test and train data sets are joined with rbind.

### 2. Extract only the measurements on the mean and standard deviation for each measurement. 
The variable names are presented in the features.txt file.  
Any feature which includes "mean()" or "std()" in its text is selected for inclusion.
The AllData table created in step one is filtered to only include columns which are included in the selectedFeatures 

### 3. Use descriptive activity names to name the activities in the data set
The activity labels text file contains the descriptive text for each activity ID. These are merged into the data set via lookup of the activity ID.

### 4. Appropriately label the data set with descriptive variable names. 
The previously manipulated data is further changed to rename each column with a descriptive name that doesn't include special characters "()-" are removed from what is in features.txt

### 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
The data from steps 1-4 is melted to allow aggregate calculation of the mean using dcast from the dplyr package