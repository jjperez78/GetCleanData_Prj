<center> <H1> CODE BOOK </B1>  </center>


<h2> BEFORE STARTING TO WORK </h2>


<b>This script has been developed to be used on the "UCI HAR Dataset" Folder. This is the main folder for the analized data
when you unzip the downloaded file. As this script uses relative references to access the train and test folders, please set "UCI HAR Dataset" as your working directory.</b>

Librarys used to be loaded


<center><b>library(dplyr)</b></center><br>

<center><b>library(car)</b></center><br>



<h2> FIRST POINT - MERGE BOTH DATA FRAMES</h2>


To merge both data frame first it is useful to have a separate data frame for each of them. After that a simple bind
operation will allow us to merge both data frames.

To keep the information related with the activity and the subject the each data before we merge them.
Activity and Subject are going to be plazed on the first columns to simplify debbuging tasks.

<b>TEST DATA FRAME</b>

Load the experiment data frame:
<center><b>test<-read.table(file = "./test//X_test.txt")</b></center>

Load the activity identificator:
<center><b>testLabel<-read.csv("./test/y_test.txt",header = FALSE)</b></center>

Load the information about the subject:
<center><b>testSubject<-read.csv(file = "./test/subject_test.txt",header=FALSE,sep=" ")</b></center>

Bind columns to join the data, the subject and  activity
<center><b>test_Data<-bind_cols(testLabel,testSubject,test)</b></center>

<b>TRAIN DATA FRAME</b>

Load the experiment data frame:
<center><b>train<-read.table(file = "./train/X_train.txt")</b></center>

Load the activity identificator:
<center><b>trainLabel=read.csv("./train/y_train.txt",header = FALSE)</b></center>

Load the information about the subject:
<center><b>trainSubject<-read.csv(file = "./train/subject_train.txt",header=FALSE,sep=" ")</b></center>

Bind columns to join the data, the subject and  activity
<center><b>train_Data<-bind_cols(trainLabel,trainSubject,train)</b></center>

<b>RAW DATA FRAME</b>

Merge all data using the bind_row function. We force bind_rows to include all the columns in both data frames
<center><b>rawData<-bind_rows(test_Data[,1:ncol(test_Data)],train_Data[,1:ncol(train_Data)])</b></center>

Remove some temporal variables to free memory:
<center><b>rm(test,testLabel,testSubject,test_Data)</b></center>
<center><b>rm(train,trainLabel,trainSubject,train_Data)</b></center>



<h2> SECOND POINT - EXTRACT VALUES BETWEEN MEAN +/- STANDARD DEVIATION </h2>


Using th quantile function we are able to create a categorical variable to classify the points on a given vector.

The function my_quantile calculate the confiance band for a given vector, replazing any value out of this band with NA and returning the rest of the values. The output vector as the same length as the original but includes more NA values.
<b>my_quantile</b>
<ol>
<li>data. Vector. Data to be reviewed.</li>
<li>probs. Vector. Values of probabilities. All of them should be between 0 and 1. my_quantile will use this value as parameter when calling quantile to get the margins of the confiance band. </li>
<li>from. Int. Position on the probs vector which define the lowest value for the confiance band. Range (1,length(probs)-1)</li>
<li>to. Int. Position on the probs vector which define the lowest value for the confiance band. Range (2,length(probs))</li>
</ol>
<b>
my_quantile <- function (data,probs=c(0,1),from=1,to=2)
{
  temp<-quantile(data,probs = probs,na.rm = TRUE)
  data[data < temp[from] | data > temp[to]]<-NA
  return(data)
}</b>

The possibilities to find a point between the mean and one standard deviation, to each side, is 68.2%. According to that Our selected values for my_quantile should be: probs=c(0,0.159,0.659,1), from=2, to=3. 

Sapply is used to get the cleaned values and store them on cleanData
<center><b>cleanData<-as.data.frame(sapply(X = rawData[,3:(ncol(rawData))],FUN = my_quantile,probs=c(0,0.159,0.659,1), from=2, to=3))</b></center>

Adding the activity and the subject columns:
<center><b>cleanData<-bind_cols(rawData[,1:2],cleanData[,1:ncol(cleanData)])</b></center>

Remove some temporal functions:
<center><b>rm(my_quantile)</b></center>



<h2>THIRD POINT - REPLACING THE ACTIVITY NUMBER FOR ITS LABEL </h2>


We use the recode command to replace the numerical values for the apropiate chain:
<center><b>cleanData[,1]<-recode(cleanData[,1],"1='WALKING';2='WALKING_UPSTAIRS';3='WALKING_DOWNSTAIRS';4='SITTING';5='STANDING';6='LAYING'")
</b></center>



<h2>FOURTH POINT - ADDING SOME READABLE LABELS </h2>


First column is activity, second column is subject and the rest os column names are retrieved from features.txt

After loading features.txt the names are assinged in the same order.

Load the file features.txt on a data set:
<center><b>featinfo <- read.csv("features.txt",sep = " ",header = FALSE)</b></center>
<center><b>names(cleanData)<-c("activity","subject",as.character(featinfo[,2]))</b></center>

Remove some temporal variables to free memory:
<center><b>rm(featinfo)</b></center>



<h2>FIFTH POINT - NEW DATA SET</h3>


The function aggregate.data.frame allow to calculate the mean using activity and subject as key fields to create the groups. The result will be storaged on the variable summarizeData:

<center><b>summarizeData<-aggregate.data.frame(x = cleanData[3:563], by=list(cleanData$activity,cleanData$subject), FUN = mean, na.rm=TRUE)</b></center>

It is necessary to correct the names for the first two columns:
<center><b>names(summarizeData)<-c("activity","subject",names(cleanData[,3:563]))</b></center>

Empty values, combinations subject-activity without data, get NaN values. In this step NaN values are replaced by NA values as it is easy to remove them when working in R:

<center><b>summarizeData[summarizeData=="NaN"]<-NA</b></center>



<h2> SIXTH POINT - EXPORTING DATA FRAME TO A TEXT FILE </h2>


Exporting data using write.table function:
<center><b>write.table(x = summarizeData,file = "summarizeData.txt",row.names = FALSE)</b> </center>

To load the table again:
<center><b>read.table(file = "./../605b915000c111e5875bb7779b02d537.txt",header = FALSE,na.strings = "<NA>")</b></center>
