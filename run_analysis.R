
#############################
## BEFORE STARTING TO WORK ##
#############################

## This script has been developed to be used on the "UCI HAR Dataset" Folder. This is the main folder for the analized data
## when you unzip the downloaded file. 

## As this script uses relative references to access the train and test folders, please set "UCI HAR Dataset" as your
## working directory.



## Librarys used to be loaded


library(dplyr)



##########################################
## FIRST POINT - MERGE BOTH DATA FRAMES ##
##########################################

## To merge both data frame first it is useful to have a separate data frame for each of them. After that a simple bind
## operation will allow us to merge both data frames. 
## To keep the information related with the activity and the subject the each data before we merge them.
## Activity and Subject are going to be plazed on the first columns to simplify debbuging tasks.

## TEST DATA FRAME
## Load the experiment data frame
test<-read.table(file = "./test//X_test.txt")

## Load the activity identificator
testLabel<-read.csv("./test/y_test.txt",header = FALSE)

## Load the information about the subject
testSubject<-read.csv(file = "./test/subject_test.txt",header=FALSE,sep=" ")

## Bind columns to join the data, the subject and  activity
test_Data<-bind_cols(testLabel,testSubject,test)

## test_Data dimmesions are 2947x563


## TRAIN DATA FRAME
## Load the experiment data frame
train<-read.table(file = "./train/X_train.txt")

## Load the activity identificator
trainLabel=read.csv("./train/y_train.txt",header = FALSE)

## Load the information about the subject
trainSubject<-read.csv(file = "./train/subject_train.txt",header=FALSE,sep=" ")

## Bind columns to join the data, the subject and  activity
train_Data<-bind_cols(trainLabel,trainSubject,train)
## test_Data dimmesionas are 2947x563

## RAW DATA FRAME
## Merge all data using the bind_row function. We force bind_rows to include all the columns in both data frames

rawData<-bind_rows(test_Data[,1:ncol(test_Data)],train_Data[,1:ncol(train_Data)])

## Remove some temporal variables to free memory
rm(test,testLabel,testSubject,test_Data)
rm(train,trainLabel,trainSubject,train_Data)

## print("Step 1")



#######################################################################
## SECOND POINT - EXTRACT VALUES BETWEEN MEAN +/- STANDARD DEVIATION ##
#######################################################################

## Using th quantile function we are able to create a categorical variable to classify the points on a given vector.
## The function my_quantile calculate the confiance band for a given vector, replazing any value out of this band
## with NA and returning the rest of the values. The output vector as the same length as the original but includes
## more NA values.

## my_quantile
## data. Vector. Data to be reviewed.
## probs. Vector. Values of probabilities. All of them should be between 0 and 1. my_quantile will use this value as
##        parameter when calling quantile to get the margins of the confiance band. 
## from. Int. Position on the probs vector which define the lowest value for the confiance band. Range (1,length(probs)-1)
## to. Int. Position on the probs vector which define the lowest value for the confiance band. Range (2,length(probs))

my_quantile <- function (data,probs=c(0,1),from=1,to=2)
{
  temp<-quantile(data,probs = probs,na.rm = TRUE)
  data[data < temp[from] | data > temp[to]]<-NA
  return(data)
}

## The possibilities to find a point between the mean and one standard deviation, to each side, is 68.2%.
## According to that Our selected values for my_quantile should be: probs=c(0,0.159,0.659,1), from=2, to=3. 
## Sapply is used to get the cleaned values and store them on cleanData

cleanData<-as.data.frame(sapply(X = rawData[,3:(ncol(rawData))],FUN = my_quantile,probs=c(0,0.159,0.659,1), from=2, to=3))

## Adding the activity and the subject columns

cleanData<-bind_cols(rawData[,1:2],cleanData[,1:ncol(cleanData)])

## Remove some temporal functions
rm(my_quantile)

## print("Step 2")



###############################################################
## THIRD POINT - REPLACING THE ACTIVITY NUMBER FOR ITS LABEL ##
###############################################################

## Load the file activity_labels.txt on a data frame called activityLabels


activityLabels<-read.csv("activity_labels.txt",header = FALSE,sep = " ")
names(activityLabels)<-c("id","label")

## ActivityLabels as two variables. The first variable is the numerical reference for each activity
## and it is the same value we can see on the first column of cleanData. Using a loop we replace any row on cleanData with
## the correspondent string 

for (i in 1:length(activityLabels[,2]))
{
  cleanData[cleanData$activity==i,1]<-as.character(activityLabels[i,2])
}

## Remove some temporal variables to free memory
rm(activityLabels,i)

## print("Step 3")


################################################
## FOURTH POINT - ADDING SOME READABLE LABELS ##
################################################

## First column is activity, second column is subject and the rest os column names are retrieved from features.txt
## After loading features.txt the names are assinged in the same order.

## Load the file features.txt on a data set

featinfo <- read.csv("features.txt",sep = " ",header = FALSE)
names(cleanData)<-c("activity","subject",as.character(featinfo[,2]))

## Remove some temporal variables to free memory
rm(featinfo)

## print("Step 4")


#################################
## FIFTH POINT - NEW DATA SET  ##
#################################

## The function aggregate.data.frame allow to calculate the mean using activity and subject as key fields to create the groups.
## The result will be storaged on the variable summarizeData

summarizeData<-aggregate.data.frame(x = cleanData[3:563], by=list(cleanData$activity,cleanData$subject), FUN = mean, na.rm=TRUE)

## It is necessary to correct the names for the first two columns

names(summarizeData)<-c("activity","subject",names(cleanData[,3:563]))

## Empty values, combinations subject-activity without data, get NaN values. In this step NaN values are replaced by NA values
## as it is easy to remove them when working in R

summarizeData[summarizeData=="NaN"]<-NA


## print("Step 5")


#######################################################
## SIXTH POINT - EXPORTING DATA FRAME TO A TEXT FILE ##
#######################################################

## Exporting data using write.table function

write.table(x = summarizeData,file = "summarizeData.txt",row.names = FALSE)

## To load the table again
## read.table(file = "./../605b915000c111e5875bb7779b02d537.txt",header = FALSE,na.strings = "<NA>")
