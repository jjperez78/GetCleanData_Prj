<center> <H1> CODE BOOK </B1>  </center>

<H2> TEMPORAL VARIABLES </H2>

<B> Variables created and deleted inside the script </B>

<OL>
<LI> <b>test</b>. This data frame storages information contained on X_test.txt from "UCI HAR Dataset/test". 2947 obs of 561 variables.     Without names. </LI>
<LI> <b>testLabel</b>. This vector storages information contained on y_test.txt.txt from "UCI HAR Dataset/test"". 2947 obs of 1 variable. Without name </LI>
<LI> <b>testSubject</b>. This vector storages information contained on subject_test.txt from "UCI HAR Dataset/test". 2947 obs of 1 variable. Without name </LI>
<LI><b>test_Data</b>. This data frame is the result of join using bind_cols of: test, testLabel and testSubject. 2947 obs of 563 variables. Without names. Columns:
<UL>
<LI>1. Activity</LI>
<LI>2. Subject</LI>
<LI>3 to 563. Test experiment values</Li>
</UL>
</LI>

<LI> <b>train</b>. This data frame storages information contained on X_train.txt from "UCI HAR Dataset/test". 2947 obs of 561 variables. Withouth names</LI>    
<LI> <b>trainLabel</b>. This vector storages information contained on y_train.txt.txt from "UCI HAR Dataset/test"". 2947 obs of 1 variable. Without name</LI>
<LI> <b>trainSubject</b>. This vector storages information contained on subject_train.txt from "UCI HAR Dataset/test". 2947 obs of 1 variable. Without name</LI>   
<LI> <b>train_Data</b>. This data frame is the result of join using bind_cols of: train, trainLabel and trainSubject. 2947 obs of 563 variables. Without names. Columns: 
<UL>
<LI>1. Activity</LI>
<LI>2. Subject</LI>
<LI>3 to 563. Test and train experiment values</LI>
</ul>
</LI>    
<LI> <b>featinfo</b>. This variable storages information contained on activity_labels.txt from "UCI HAR Dataset". This files has a list of names for each variable recoded on the x_yyyy.txt files. 561 obs of 1 variables.</LI>
</OL>

<H2> TEMPORAL FUNCTIONS </H2> 

<b> Functions created inside the script and deleted and the end of it </b>

<ol>
<li><b> my_quantile </b>. my_quantile calculateS a confiance band for a given vector, replazing any value out of this band with NA and returning the rest of the values. The output vector as the same length as the original but includes more NA values. Parameters:
<ol>
<li> data. Vector. Data to be reviewed. </li>
<li> probs. Vector. Values of probabilities. All of them should be between 0 and 1. my_quantile will use this value as parameter when calling quantile to get the margins of the confiance band.</li>
<li>from. Int. Position on the probs vector which define the lowest value for the confiance band. Range (1,length(probs)-1)</li>
<li>to. Int. Position on the probs vector which define the lowest value for the confiance band. Range (2,length(probs))</li>
</ol>
</li>
</ol>


<H2> PERMANENT VARIABLES </H2> 


<b>Variables created and left available after the script finish</b>

<ol>
<li><b>rawData</b></li>. This variable contains all the raw information about the experiment. It is the result of join, using bind_rows, test_Data and train_Data variables. 10299 obs. of 563 variables. Columns:
<ul>
<li>1. Activity</li>
<li>2. Subject</li>
<li>3 to 563. Test experiment values</li>
</ul></li>
<li><b>cleanData</b>. This varaible contains all the cleaned information about the experiment. It is the result of several transformations over the rawData variable. Transformations:
<ul>
<li>Using my_quantile function values out of the range (mean-standard deviation, mean+standard deviation) are removed and replaced with NA.</li>
<li>On the first column, numerical values for activity are replaced for the correspondent character strings.</li>
<li>Added names as follows: first column is activity, second column is subject and the rest os column names are retrieved from features.txt </li>
</ul>
</li>
<li><b>summarizeData</b>. This variables is calculated as a summary of cleanData. It represent the average value for each measured data (columns 3 to 563) for each each activity and subject. It requires several transformation over the data storaged on cleanData:
<ul>
<li>Use of aggregate.data.frame to calculate the mean using activity and subject as key fields to create the groups.</li>
<li>It is necessary to correct the names for the first two columns</li>
<li>As empty values, combinations subject-activity without data, get NaN values they are replaced by NA values.</li>
</ul>
</li>
</ol>



<h2> APENDIX - NAMES FOR SUMMARIZEDATA AND CLEANDATA </h2>

  [1] "activity"                             "subject"                              "tBodyAcc-mean()-X"                   
  [4] "tBodyAcc-mean()-Y"                    "tBodyAcc-mean()-Z"                    "tBodyAcc-std()-X"                    
  [7] "tBodyAcc-std()-Y"                     "tBodyAcc-std()-Z"                     "tBodyAcc-mad()-X"                    
 [10] "tBodyAcc-mad()-Y"                     "tBodyAcc-mad()-Z"                     "tBodyAcc-max()-X"                    
 [13] "tBodyAcc-max()-Y"                     "tBodyAcc-max()-Z"                     "tBodyAcc-min()-X"                    
 [16] "tBodyAcc-min()-Y"                     "tBodyAcc-min()-Z"                     "tBodyAcc-sma()"                      
 [19] "tBodyAcc-energy()-X"                  "tBodyAcc-energy()-Y"                  "tBodyAcc-energy()-Z"                 
 [22] "tBodyAcc-iqr()-X"                     "tBodyAcc-iqr()-Y"                     "tBodyAcc-iqr()-Z"                    
 [25] "tBodyAcc-entropy()-X"                 "tBodyAcc-entropy()-Y"                 "tBodyAcc-entropy()-Z"                
 [28] "tBodyAcc-arCoeff()-X,1"               "tBodyAcc-arCoeff()-X,2"               "tBodyAcc-arCoeff()-X,3"              
 [31] "tBodyAcc-arCoeff()-X,4"               "tBodyAcc-arCoeff()-Y,1"               "tBodyAcc-arCoeff()-Y,2"              
 [34] "tBodyAcc-arCoeff()-Y,3"               "tBodyAcc-arCoeff()-Y,4"               "tBodyAcc-arCoeff()-Z,1"              
 [37] "tBodyAcc-arCoeff()-Z,2"               "tBodyAcc-arCoeff()-Z,3"               "tBodyAcc-arCoeff()-Z,4"              
 [40] "tBodyAcc-correlation()-X,Y"           "tBodyAcc-correlation()-X,Z"           "tBodyAcc-correlation()-Y,Z"          
 [43] "tGravityAcc-mean()-X"                 "tGravityAcc-mean()-Y"                 "tGravityAcc-mean()-Z"                
 [46] "tGravityAcc-std()-X"                  "tGravityAcc-std()-Y"                  "tGravityAcc-std()-Z"                 
 [49] "tGravityAcc-mad()-X"                  "tGravityAcc-mad()-Y"                  "tGravityAcc-mad()-Z"                 
 [52] "tGravityAcc-max()-X"                  "tGravityAcc-max()-Y"                  "tGravityAcc-max()-Z"                 
 [55] "tGravityAcc-min()-X"                  "tGravityAcc-min()-Y"                  "tGravityAcc-min()-Z"                 
 [58] "tGravityAcc-sma()"                    "tGravityAcc-energy()-X"               "tGravityAcc-energy()-Y"              
 [61] "tGravityAcc-energy()-Z"               "tGravityAcc-iqr()-X"                  "tGravityAcc-iqr()-Y"                 
 [64] "tGravityAcc-iqr()-Z"                  "tGravityAcc-entropy()-X"              "tGravityAcc-entropy()-Y"             
 [67] "tGravityAcc-entropy()-Z"              "tGravityAcc-arCoeff()-X,1"            "tGravityAcc-arCoeff()-X,2"           
 [70] "tGravityAcc-arCoeff()-X,3"            "tGravityAcc-arCoeff()-X,4"            "tGravityAcc-arCoeff()-Y,1"           
 [73] "tGravityAcc-arCoeff()-Y,2"            "tGravityAcc-arCoeff()-Y,3"            "tGravityAcc-arCoeff()-Y,4"           
 [76] "tGravityAcc-arCoeff()-Z,1"            "tGravityAcc-arCoeff()-Z,2"            "tGravityAcc-arCoeff()-Z,3"           
 [79] "tGravityAcc-arCoeff()-Z,4"            "tGravityAcc-correlation()-X,Y"        "tGravityAcc-correlation()-X,Z"       
 [82] "tGravityAcc-correlation()-Y,Z"        "tBodyAccJerk-mean()-X"                "tBodyAccJerk-mean()-Y"               
 [85] "tBodyAccJerk-mean()-Z"                "tBodyAccJerk-std()-X"                 "tBodyAccJerk-std()-Y"                
 [88] "tBodyAccJerk-std()-Z"                 "tBodyAccJerk-mad()-X"                 "tBodyAccJerk-mad()-Y"                
 [91] "tBodyAccJerk-mad()-Z"                 "tBodyAccJerk-max()-X"                 "tBodyAccJerk-max()-Y"                
 [94] "tBodyAccJerk-max()-Z"                 "tBodyAccJerk-min()-X"                 "tBodyAccJerk-min()-Y"                
 [97] "tBodyAccJerk-min()-Z"                 "tBodyAccJerk-sma()"                   "tBodyAccJerk-energy()-X"             
[100] "tBodyAccJerk-energy()-Y"              "tBodyAccJerk-energy()-Z"              "tBodyAccJerk-iqr()-X"                
[103] "tBodyAccJerk-iqr()-Y"                 "tBodyAccJerk-iqr()-Z"                 "tBodyAccJerk-entropy()-X"            
[106] "tBodyAccJerk-entropy()-Y"             "tBodyAccJerk-entropy()-Z"             "tBodyAccJerk-arCoeff()-X,1"          
[109] "tBodyAccJerk-arCoeff()-X,2"           "tBodyAccJerk-arCoeff()-X,3"           "tBodyAccJerk-arCoeff()-X,4"          
[112] "tBodyAccJerk-arCoeff()-Y,1"           "tBodyAccJerk-arCoeff()-Y,2"           "tBodyAccJerk-arCoeff()-Y,3"          
[115] "tBodyAccJerk-arCoeff()-Y,4"           "tBodyAccJerk-arCoeff()-Z,1"           "tBodyAccJerk-arCoeff()-Z,2"          
[118] "tBodyAccJerk-arCoeff()-Z,3"           "tBodyAccJerk-arCoeff()-Z,4"           "tBodyAccJerk-correlation()-X,Y"      
[121] "tBodyAccJerk-correlation()-X,Z"       "tBodyAccJerk-correlation()-Y,Z"       "tBodyGyro-mean()-X"                  
[124] "tBodyGyro-mean()-Y"                   "tBodyGyro-mean()-Z"                   "tBodyGyro-std()-X"                   
[127] "tBodyGyro-std()-Y"                    "tBodyGyro-std()-Z"                    "tBodyGyro-mad()-X"                   
[130] "tBodyGyro-mad()-Y"                    "tBodyGyro-mad()-Z"                    "tBodyGyro-max()-X"                   
[133] "tBodyGyro-max()-Y"                    "tBodyGyro-max()-Z"                    "tBodyGyro-min()-X"                   
[136] "tBodyGyro-min()-Y"                    "tBodyGyro-min()-Z"                    "tBodyGyro-sma()"                     
[139] "tBodyGyro-energy()-X"                 "tBodyGyro-energy()-Y"                 "tBodyGyro-energy()-Z"                
[142] "tBodyGyro-iqr()-X"                    "tBodyGyro-iqr()-Y"                    "tBodyGyro-iqr()-Z"                   
[145] "tBodyGyro-entropy()-X"                "tBodyGyro-entropy()-Y"                "tBodyGyro-entropy()-Z"               
[148] "tBodyGyro-arCoeff()-X,1"              "tBodyGyro-arCoeff()-X,2"              "tBodyGyro-arCoeff()-X,3"             
[151] "tBodyGyro-arCoeff()-X,4"              "tBodyGyro-arCoeff()-Y,1"              "tBodyGyro-arCoeff()-Y,2"             
[154] "tBodyGyro-arCoeff()-Y,3"              "tBodyGyro-arCoeff()-Y,4"              "tBodyGyro-arCoeff()-Z,1"             
[157] "tBodyGyro-arCoeff()-Z,2"              "tBodyGyro-arCoeff()-Z,3"              "tBodyGyro-arCoeff()-Z,4"             
[160] "tBodyGyro-correlation()-X,Y"          "tBodyGyro-correlation()-X,Z"          "tBodyGyro-correlation()-Y,Z"         
[163] "tBodyGyroJerk-mean()-X"               "tBodyGyroJerk-mean()-Y"               "tBodyGyroJerk-mean()-Z"              
[166] "tBodyGyroJerk-std()-X"                "tBodyGyroJerk-std()-Y"                "tBodyGyroJerk-std()-Z"               
[169] "tBodyGyroJerk-mad()-X"                "tBodyGyroJerk-mad()-Y"                "tBodyGyroJerk-mad()-Z"               
[172] "tBodyGyroJerk-max()-X"                "tBodyGyroJerk-max()-Y"                "tBodyGyroJerk-max()-Z"               
[175] "tBodyGyroJerk-min()-X"                "tBodyGyroJerk-min()-Y"                "tBodyGyroJerk-min()-Z"               
[178] "tBodyGyroJerk-sma()"                  "tBodyGyroJerk-energy()-X"             "tBodyGyroJerk-energy()-Y"            
[181] "tBodyGyroJerk-energy()-Z"             "tBodyGyroJerk-iqr()-X"                "tBodyGyroJerk-iqr()-Y"               
[184] "tBodyGyroJerk-iqr()-Z"                "tBodyGyroJerk-entropy()-X"            "tBodyGyroJerk-entropy()-Y"           
[187] "tBodyGyroJerk-entropy()-Z"            "tBodyGyroJerk-arCoeff()-X,1"          "tBodyGyroJerk-arCoeff()-X,2"         
[190] "tBodyGyroJerk-arCoeff()-X,3"          "tBodyGyroJerk-arCoeff()-X,4"          "tBodyGyroJerk-arCoeff()-Y,1"         
[193] "tBodyGyroJerk-arCoeff()-Y,2"          "tBodyGyroJerk-arCoeff()-Y,3"          "tBodyGyroJerk-arCoeff()-Y,4"         
[196] "tBodyGyroJerk-arCoeff()-Z,1"          "tBodyGyroJerk-arCoeff()-Z,2"          "tBodyGyroJerk-arCoeff()-Z,3"         
[199] "tBodyGyroJerk-arCoeff()-Z,4"          "tBodyGyroJerk-correlation()-X,Y"      "tBodyGyroJerk-correlation()-X,Z"     
[202] "tBodyGyroJerk-correlation()-Y,Z"      "tBodyAccMag-mean()"                   "tBodyAccMag-std()"                   
[205] "tBodyAccMag-mad()"                    "tBodyAccMag-max()"                    "tBodyAccMag-min()"                   
[208] "tBodyAccMag-sma()"                    "tBodyAccMag-energy()"                 "tBodyAccMag-iqr()"                   
[211] "tBodyAccMag-entropy()"                "tBodyAccMag-arCoeff()1"               "tBodyAccMag-arCoeff()2"              
[214] "tBodyAccMag-arCoeff()3"               "tBodyAccMag-arCoeff()4"               "tGravityAccMag-mean()"               
[217] "tGravityAccMag-std()"                 "tGravityAccMag-mad()"                 "tGravityAccMag-max()"                
[220] "tGravityAccMag-min()"                 "tGravityAccMag-sma()"                 "tGravityAccMag-energy()"             
[223] "tGravityAccMag-iqr()"                 "tGravityAccMag-entropy()"             "tGravityAccMag-arCoeff()1"           
[226] "tGravityAccMag-arCoeff()2"            "tGravityAccMag-arCoeff()3"            "tGravityAccMag-arCoeff()4"           
[229] "tBodyAccJerkMag-mean()"               "tBodyAccJerkMag-std()"                "tBodyAccJerkMag-mad()"               
[232] "tBodyAccJerkMag-max()"                "tBodyAccJerkMag-min()"                "tBodyAccJerkMag-sma()"               
[235] "tBodyAccJerkMag-energy()"             "tBodyAccJerkMag-iqr()"                "tBodyAccJerkMag-entropy()"           
[238] "tBodyAccJerkMag-arCoeff()1"           "tBodyAccJerkMag-arCoeff()2"           "tBodyAccJerkMag-arCoeff()3"          
[241] "tBodyAccJerkMag-arCoeff()4"           "tBodyGyroMag-mean()"                  "tBodyGyroMag-std()"                  
[244] "tBodyGyroMag-mad()"                   "tBodyGyroMag-max()"                   "tBodyGyroMag-min()"                  
[247] "tBodyGyroMag-sma()"                   "tBodyGyroMag-energy()"                "tBodyGyroMag-iqr()"                  
[250] "tBodyGyroMag-entropy()"               "tBodyGyroMag-arCoeff()1"              "tBodyGyroMag-arCoeff()2"             
[253] "tBodyGyroMag-arCoeff()3"              "tBodyGyroMag-arCoeff()4"              "tBodyGyroJerkMag-mean()"             
[256] "tBodyGyroJerkMag-std()"               "tBodyGyroJerkMag-mad()"               "tBodyGyroJerkMag-max()"              
[259] "tBodyGyroJerkMag-min()"               "tBodyGyroJerkMag-sma()"               "tBodyGyroJerkMag-energy()"           
[262] "tBodyGyroJerkMag-iqr()"               "tBodyGyroJerkMag-entropy()"           "tBodyGyroJerkMag-arCoeff()1"         
[265] "tBodyGyroJerkMag-arCoeff()2"          "tBodyGyroJerkMag-arCoeff()3"          "tBodyGyroJerkMag-arCoeff()4"         
[268] "fBodyAcc-mean()-X"                    "fBodyAcc-mean()-Y"                    "fBodyAcc-mean()-Z"                   
[271] "fBodyAcc-std()-X"                     "fBodyAcc-std()-Y"                     "fBodyAcc-std()-Z"                    
[274] "fBodyAcc-mad()-X"                     "fBodyAcc-mad()-Y"                     "fBodyAcc-mad()-Z"                    
[277] "fBodyAcc-max()-X"                     "fBodyAcc-max()-Y"                     "fBodyAcc-max()-Z"                    
[280] "fBodyAcc-min()-X"                     "fBodyAcc-min()-Y"                     "fBodyAcc-min()-Z"                    
[283] "fBodyAcc-sma()"                       "fBodyAcc-energy()-X"                  "fBodyAcc-energy()-Y"                 
[286] "fBodyAcc-energy()-Z"                  "fBodyAcc-iqr()-X"                     "fBodyAcc-iqr()-Y"                    
[289] "fBodyAcc-iqr()-Z"                     "fBodyAcc-entropy()-X"                 "fBodyAcc-entropy()-Y"                
[292] "fBodyAcc-entropy()-Z"                 "fBodyAcc-maxInds-X"                   "fBodyAcc-maxInds-Y"                  
[295] "fBodyAcc-maxInds-Z"                   "fBodyAcc-meanFreq()-X"                "fBodyAcc-meanFreq()-Y"               
[298] "fBodyAcc-meanFreq()-Z"                "fBodyAcc-skewness()-X"                "fBodyAcc-kurtosis()-X"               
[301] "fBodyAcc-skewness()-Y"                "fBodyAcc-kurtosis()-Y"                "fBodyAcc-skewness()-Z"               
[304] "fBodyAcc-kurtosis()-Z"                "fBodyAcc-bandsEnergy()-1,8"           "fBodyAcc-bandsEnergy()-9,16"         
[307] "fBodyAcc-bandsEnergy()-17,24"         "fBodyAcc-bandsEnergy()-25,32"         "fBodyAcc-bandsEnergy()-33,40"        
[310] "fBodyAcc-bandsEnergy()-41,48"         "fBodyAcc-bandsEnergy()-49,56"         "fBodyAcc-bandsEnergy()-57,64"        
[313] "fBodyAcc-bandsEnergy()-1,16"          "fBodyAcc-bandsEnergy()-17,32"         "fBodyAcc-bandsEnergy()-33,48"        
[316] "fBodyAcc-bandsEnergy()-49,64"         "fBodyAcc-bandsEnergy()-1,24"          "fBodyAcc-bandsEnergy()-25,48"        
[319] "fBodyAcc-bandsEnergy()-1,8"           "fBodyAcc-bandsEnergy()-9,16"          "fBodyAcc-bandsEnergy()-17,24"        
[322] "fBodyAcc-bandsEnergy()-25,32"         "fBodyAcc-bandsEnergy()-33,40"         "fBodyAcc-bandsEnergy()-41,48"        
[325] "fBodyAcc-bandsEnergy()-49,56"         "fBodyAcc-bandsEnergy()-57,64"         "fBodyAcc-bandsEnergy()-1,16"         
[328] "fBodyAcc-bandsEnergy()-17,32"         "fBodyAcc-bandsEnergy()-33,48"         "fBodyAcc-bandsEnergy()-49,64"        
[331] "fBodyAcc-bandsEnergy()-1,24"          "fBodyAcc-bandsEnergy()-25,48"         "fBodyAcc-bandsEnergy()-1,8"          
[334] "fBodyAcc-bandsEnergy()-9,16"          "fBodyAcc-bandsEnergy()-17,24"         "fBodyAcc-bandsEnergy()-25,32"        
[337] "fBodyAcc-bandsEnergy()-33,40"         "fBodyAcc-bandsEnergy()-41,48"         "fBodyAcc-bandsEnergy()-49,56"        
[340] "fBodyAcc-bandsEnergy()-57,64"         "fBodyAcc-bandsEnergy()-1,16"          "fBodyAcc-bandsEnergy()-17,32"        
[343] "fBodyAcc-bandsEnergy()-33,48"         "fBodyAcc-bandsEnergy()-49,64"         "fBodyAcc-bandsEnergy()-1,24"         
[346] "fBodyAcc-bandsEnergy()-25,48"         "fBodyAccJerk-mean()-X"                "fBodyAccJerk-mean()-Y"               
[349] "fBodyAccJerk-mean()-Z"                "fBodyAccJerk-std()-X"                 "fBodyAccJerk-std()-Y"                
[352] "fBodyAccJerk-std()-Z"                 "fBodyAccJerk-mad()-X"                 "fBodyAccJerk-mad()-Y"                
[355] "fBodyAccJerk-mad()-Z"                 "fBodyAccJerk-max()-X"                 "fBodyAccJerk-max()-Y"                
[358] "fBodyAccJerk-max()-Z"                 "fBodyAccJerk-min()-X"                 "fBodyAccJerk-min()-Y"                
[361] "fBodyAccJerk-min()-Z"                 "fBodyAccJerk-sma()"                   "fBodyAccJerk-energy()-X"             
[364] "fBodyAccJerk-energy()-Y"              "fBodyAccJerk-energy()-Z"              "fBodyAccJerk-iqr()-X"                
[367] "fBodyAccJerk-iqr()-Y"                 "fBodyAccJerk-iqr()-Z"                 "fBodyAccJerk-entropy()-X"            
[370] "fBodyAccJerk-entropy()-Y"             "fBodyAccJerk-entropy()-Z"             "fBodyAccJerk-maxInds-X"              
[373] "fBodyAccJerk-maxInds-Y"               "fBodyAccJerk-maxInds-Z"               "fBodyAccJerk-meanFreq()-X"           
[376] "fBodyAccJerk-meanFreq()-Y"            "fBodyAccJerk-meanFreq()-Z"            "fBodyAccJerk-skewness()-X"           
[379] "fBodyAccJerk-kurtosis()-X"            "fBodyAccJerk-skewness()-Y"            "fBodyAccJerk-kurtosis()-Y"           
[382] "fBodyAccJerk-skewness()-Z"            "fBodyAccJerk-kurtosis()-Z"            "fBodyAccJerk-bandsEnergy()-1,8"      
[385] "fBodyAccJerk-bandsEnergy()-9,16"      "fBodyAccJerk-bandsEnergy()-17,24"     "fBodyAccJerk-bandsEnergy()-25,32"    
[388] "fBodyAccJerk-bandsEnergy()-33,40"     "fBodyAccJerk-bandsEnergy()-41,48"     "fBodyAccJerk-bandsEnergy()-49,56"    
[391] "fBodyAccJerk-bandsEnergy()-57,64"     "fBodyAccJerk-bandsEnergy()-1,16"      "fBodyAccJerk-bandsEnergy()-17,32"    
[394] "fBodyAccJerk-bandsEnergy()-33,48"     "fBodyAccJerk-bandsEnergy()-49,64"     "fBodyAccJerk-bandsEnergy()-1,24"     
[397] "fBodyAccJerk-bandsEnergy()-25,48"     "fBodyAccJerk-bandsEnergy()-1,8"       "fBodyAccJerk-bandsEnergy()-9,16"     
[400] "fBodyAccJerk-bandsEnergy()-17,24"     "fBodyAccJerk-bandsEnergy()-25,32"     "fBodyAccJerk-bandsEnergy()-33,40"    
[403] "fBodyAccJerk-bandsEnergy()-41,48"     "fBodyAccJerk-bandsEnergy()-49,56"     "fBodyAccJerk-bandsEnergy()-57,64"    
[406] "fBodyAccJerk-bandsEnergy()-1,16"      "fBodyAccJerk-bandsEnergy()-17,32"     "fBodyAccJerk-bandsEnergy()-33,48"    
[409] "fBodyAccJerk-bandsEnergy()-49,64"     "fBodyAccJerk-bandsEnergy()-1,24"      "fBodyAccJerk-bandsEnergy()-25,48"    
[412] "fBodyAccJerk-bandsEnergy()-1,8"       "fBodyAccJerk-bandsEnergy()-9,16"      "fBodyAccJerk-bandsEnergy()-17,24"    
[415] "fBodyAccJerk-bandsEnergy()-25,32"     "fBodyAccJerk-bandsEnergy()-33,40"     "fBodyAccJerk-bandsEnergy()-41,48"    
[418] "fBodyAccJerk-bandsEnergy()-49,56"     "fBodyAccJerk-bandsEnergy()-57,64"     "fBodyAccJerk-bandsEnergy()-1,16"     
[421] "fBodyAccJerk-bandsEnergy()-17,32"     "fBodyAccJerk-bandsEnergy()-33,48"     "fBodyAccJerk-bandsEnergy()-49,64"    
[424] "fBodyAccJerk-bandsEnergy()-1,24"      "fBodyAccJerk-bandsEnergy()-25,48"     "fBodyGyro-mean()-X"                  
[427] "fBodyGyro-mean()-Y"                   "fBodyGyro-mean()-Z"                   "fBodyGyro-std()-X"                   
[430] "fBodyGyro-std()-Y"                    "fBodyGyro-std()-Z"                    "fBodyGyro-mad()-X"                   
[433] "fBodyGyro-mad()-Y"                    "fBodyGyro-mad()-Z"                    "fBodyGyro-max()-X"                   
[436] "fBodyGyro-max()-Y"                    "fBodyGyro-max()-Z"                    "fBodyGyro-min()-X"                   
[439] "fBodyGyro-min()-Y"                    "fBodyGyro-min()-Z"                    "fBodyGyro-sma()"                     
[442] "fBodyGyro-energy()-X"                 "fBodyGyro-energy()-Y"                 "fBodyGyro-energy()-Z"                
[445] "fBodyGyro-iqr()-X"                    "fBodyGyro-iqr()-Y"                    "fBodyGyro-iqr()-Z"                   
[448] "fBodyGyro-entropy()-X"                "fBodyGyro-entropy()-Y"                "fBodyGyro-entropy()-Z"               
[451] "fBodyGyro-maxInds-X"                  "fBodyGyro-maxInds-Y"                  "fBodyGyro-maxInds-Z"                 
[454] "fBodyGyro-meanFreq()-X"               "fBodyGyro-meanFreq()-Y"               "fBodyGyro-meanFreq()-Z"              
[457] "fBodyGyro-skewness()-X"               "fBodyGyro-kurtosis()-X"               "fBodyGyro-skewness()-Y"              
[460] "fBodyGyro-kurtosis()-Y"               "fBodyGyro-skewness()-Z"               "fBodyGyro-kurtosis()-Z"              
[463] "fBodyGyro-bandsEnergy()-1,8"          "fBodyGyro-bandsEnergy()-9,16"         "fBodyGyro-bandsEnergy()-17,24"       
[466] "fBodyGyro-bandsEnergy()-25,32"        "fBodyGyro-bandsEnergy()-33,40"        "fBodyGyro-bandsEnergy()-41,48"       
[469] "fBodyGyro-bandsEnergy()-49,56"        "fBodyGyro-bandsEnergy()-57,64"        "fBodyGyro-bandsEnergy()-1,16"        
[472] "fBodyGyro-bandsEnergy()-17,32"        "fBodyGyro-bandsEnergy()-33,48"        "fBodyGyro-bandsEnergy()-49,64"       
[475] "fBodyGyro-bandsEnergy()-1,24"         "fBodyGyro-bandsEnergy()-25,48"        "fBodyGyro-bandsEnergy()-1,8"         
[478] "fBodyGyro-bandsEnergy()-9,16"         "fBodyGyro-bandsEnergy()-17,24"        "fBodyGyro-bandsEnergy()-25,32"       
[481] "fBodyGyro-bandsEnergy()-33,40"        "fBodyGyro-bandsEnergy()-41,48"        "fBodyGyro-bandsEnergy()-49,56"       
[484] "fBodyGyro-bandsEnergy()-57,64"        "fBodyGyro-bandsEnergy()-1,16"         "fBodyGyro-bandsEnergy()-17,32"       
[487] "fBodyGyro-bandsEnergy()-33,48"        "fBodyGyro-bandsEnergy()-49,64"        "fBodyGyro-bandsEnergy()-1,24"        
[490] "fBodyGyro-bandsEnergy()-25,48"        "fBodyGyro-bandsEnergy()-1,8"          "fBodyGyro-bandsEnergy()-9,16"        
[493] "fBodyGyro-bandsEnergy()-17,24"        "fBodyGyro-bandsEnergy()-25,32"        "fBodyGyro-bandsEnergy()-33,40"       
[496] "fBodyGyro-bandsEnergy()-41,48"        "fBodyGyro-bandsEnergy()-49,56"        "fBodyGyro-bandsEnergy()-57,64"       
[499] "fBodyGyro-bandsEnergy()-1,16"         "fBodyGyro-bandsEnergy()-17,32"        "fBodyGyro-bandsEnergy()-33,48"       
[502] "fBodyGyro-bandsEnergy()-49,64"        "fBodyGyro-bandsEnergy()-1,24"         "fBodyGyro-bandsEnergy()-25,48"       
[505] "fBodyAccMag-mean()"                   "fBodyAccMag-std()"                    "fBodyAccMag-mad()"                   
[508] "fBodyAccMag-max()"                    "fBodyAccMag-min()"                    "fBodyAccMag-sma()"                   
[511] "fBodyAccMag-energy()"                 "fBodyAccMag-iqr()"                    "fBodyAccMag-entropy()"               
[514] "fBodyAccMag-maxInds"                  "fBodyAccMag-meanFreq()"               "fBodyAccMag-skewness()"              
[517] "fBodyAccMag-kurtosis()"               "fBodyBodyAccJerkMag-mean()"           "fBodyBodyAccJerkMag-std()"           
[520] "fBodyBodyAccJerkMag-mad()"            "fBodyBodyAccJerkMag-max()"            "fBodyBodyAccJerkMag-min()"           
[523] "fBodyBodyAccJerkMag-sma()"            "fBodyBodyAccJerkMag-energy()"         "fBodyBodyAccJerkMag-iqr()"           
[526] "fBodyBodyAccJerkMag-entropy()"        "fBodyBodyAccJerkMag-maxInds"          "fBodyBodyAccJerkMag-meanFreq()"      
[529] "fBodyBodyAccJerkMag-skewness()"       "fBodyBodyAccJerkMag-kurtosis()"       "fBodyBodyGyroMag-mean()"             
[532] "fBodyBodyGyroMag-std()"               "fBodyBodyGyroMag-mad()"               "fBodyBodyGyroMag-max()"              
[535] "fBodyBodyGyroMag-min()"               "fBodyBodyGyroMag-sma()"               "fBodyBodyGyroMag-energy()"           
[538] "fBodyBodyGyroMag-iqr()"               "fBodyBodyGyroMag-entropy()"           "fBodyBodyGyroMag-maxInds"            
[541] "fBodyBodyGyroMag-meanFreq()"          "fBodyBodyGyroMag-skewness()"          "fBodyBodyGyroMag-kurtosis()"         
[544] "fBodyBodyGyroJerkMag-mean()"          "fBodyBodyGyroJerkMag-std()"           "fBodyBodyGyroJerkMag-mad()"          
[547] "fBodyBodyGyroJerkMag-max()"           "fBodyBodyGyroJerkMag-min()"           "fBodyBodyGyroJerkMag-sma()"          
[550] "fBodyBodyGyroJerkMag-energy()"        "fBodyBodyGyroJerkMag-iqr()"           "fBodyBodyGyroJerkMag-entropy()"      
[553] "fBodyBodyGyroJerkMag-maxInds"         "fBodyBodyGyroJerkMag-meanFreq()"      "fBodyBodyGyroJerkMag-skewness()"     
[556] "fBodyBodyGyroJerkMag-kurtosis()"      "angle(tBodyAccMean,gravity)"          "angle(tBodyAccJerkMean),gravityMean)"
[559] "angle(tBodyGyroMean,gravityMean)"     "angle(tBodyGyroJerkMean,gravityMean)" "angle(X,gravityMean)"                
[562] "angle(Y,gravityMean)"                 "angle(Z,gravityMean)" 

