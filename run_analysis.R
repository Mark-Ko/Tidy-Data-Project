####################################################################################
#                                                                                  #
#run_analysis.R                                                                    #               #
#script to process triaxial accelerometer data into a tidy dataset                 #
#                                                                                  #
####################################################################################

#load libraries
library(data.table) #needed for data.table()
library(reshape2)   #needed for melt(), dcast()

#the UCI HAR Dataset should be in your working directory
# if not, change the variable inpath to point to your directory
inpath <- "./UCI HAR Dataset"

#read the accelerometer data and combine
dataTest <- read.table(paste0(inpath, "/test/X_test.txt"))
dataTrain <- read.table(paste0(inpath, "/train/X_train.txt"))
data <- rbind(dataTest,dataTrain)

#read the features data
# these are the labels for the accelerometer dataset
# add these labels to the accelerometer dataset
variableLabel <- read.table(paste0(inpath, "/features.txt"))
colnames(data) <- variableLabel[[2]]

#select the variables that are means or standard deviations of 
# accelerometer measures
dataReduced <- data[, grepl("mean|std", variableLabel[[2]])]
dataReduced <- dataReduced[, !grepl("meanFreq", labels(dataReduced)[[2]])]

#clean up variable names
variableName <- colnames(dataReduced)
variableName <- gsub("-","",variableName, fixed=T)
variableName <- gsub("()","",variableName, fixed=T)
variableName <- gsub("mean","Mean",variableName, fixed=T)
variableName <- gsub("std","SD",variableName, fixed=T)

#rename the columns with the new variable names
colnames(dataReduced) <- variableName

#read the subjects ids
# then combine into one dataset and label the column
subjectTest <- read.table(paste0(inpath, "/test/subject_test.txt"))
subjectTrain <- read.table(paste0(inpath, "/train/subject_train.txt"))
subject <- rbind(subjectTest, subjectTrain)
colnames(subject) <- "subject"

#read the activity data
# then combine into one dataset and label the column
activityTest <- read.table(paste0(inpath, "/test/y_test.txt"))
activityTrain <- read.table(paste0(inpath, "/train/y_train.txt"))
activity <- rbind(activityTest, activityTrain)
colnames(activity) <- "activity"

#read the activity descriptions and clean them up
# then set activity as a factor and label the levels
activityLabel <- read.table(paste0(inpath, "/activity_labels.txt"))
activityLabel[[2]] <- c("walking", "walking upstairs", "walking downstairs",
                     "sitting","standing","laying")
activity <- factor(activity[[1]], labels=as.character(activityLabel[[2]]))

#combine the activity, subject, and accelerometer data into a data table
dataAll <- data.table(activity, subject, dataReduced)

#reshape the data: melt  
#
dataAllmelt <- melt(dataAll,id.vars = c("subject","activity"))

#reshape the data: cast the melt into a wide tidy dataset with mean values
tidyData <- dcast(dataAllmelt, subject + activity ~ variable, mean)

#write the tidy dataset
#
write.table(tidyData, file = "./tidydata.txt", quote=F, row.names=F)

#clean up the environment!!
#
rm(subjectTest,subjectTrain)
rm(dataTest,dataTrain)
rm(activityTest,activityTrain)
rm(dataAllmelt)

