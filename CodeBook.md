# Code Book
This code book describes the variables used in the data set. Furthermore, a brief description of script operation is described.

## Variables:
> There are 68 variables in the tidy data set. >
> subject:  Subjects used in gathering the data - labeled 1..30  
> activity: Activities for which data was measured -  laying sitting standing walking walkingdownstairs walkingupstairs  
> Measurement variables: These are very similar to the original data set described in "features.txt" and "featuresinfo.txt".
> However, alphanumeric characters have been removed and all names changed to lower case as these are the requirements of tidy data.  
  
  
 [1] "subject"              "activity"             "tbodyaccmeanx"       
 [4] "tbodyaccmeany"        "tbodyaccmeanz"        "tbodyaccstdx"        
 [7] "tbodyaccstdy"         "tbodyaccstdz"         "tgravityaccmeanx"    
[10] "tgravityaccmeany"     "tgravityaccmeanz"     "tgravityaccstdx"     
[13] "tgravityaccstdy"      "tgravityaccstdz"      "tbodyaccjerkmeanx"   
[16] "tbodyaccjerkmeany"    "tbodyaccjerkmeanz"    "tbodyaccjerkstdx"    
[19] "tbodyaccjerkstdy"     "tbodyaccjerkstdz"     "tbodygyromeanx"      
[22] "tbodygyromeany"       "tbodygyromeanz"       "tbodygyrostdx"       
[25] "tbodygyrostdy"        "tbodygyrostdz"        "tbodygyrojerkmeanx"  
[28] "tbodygyrojerkmeany"   "tbodygyrojerkmeanz"   "tbodygyrojerkstdx"   
[31] "tbodygyrojerkstdy"    "tbodygyrojerkstdz"    "tbodyaccmagmean"     
[34] "tbodyaccmagstd"       "tgravityaccmagmean"   "tgravityaccmagstd"   
[37] "tbodyaccjerkmagmean"  "tbodyaccjerkmagstd"   "tbodygyromagmean"    
[40] "tbodygyromagstd"      "tbodygyrojerkmagmean" "tbodygyrojerkmagstd" 
[43] "fbodyaccmeanx"        "fbodyaccmeany"        "fbodyaccmeanz"       
[46] "fbodyaccstdx"         "fbodyaccstdy"         "fbodyaccstdz"        
[49] "fbodyaccjerkmeanx"    "fbodyaccjerkmeany"    "fbodyaccjerkmeanz"   
[52] "fbodyaccjerkstdx"     "fbodyaccjerkstdy"     "fbodyaccjerkstdz"    
[55] "fbodygyromeanx"       "fbodygyromeany"       "fbodygyromeanz"      
[58] "fbodygyrostdx"        "fbodygyrostdy"        "fbodygyrostdz"       
[61] "fbodyaccmagmean"      "fbodyaccmagstd"       "fbodyaccjerkmagmean" 
[64] "fbodyaccjerkmagstd"   "fbodygyromagmean"     "fbodygyromagstd"     
[67] "fbodygyrojerkmagmean" "fbodygyrojerkmagstd" 

## Code Description:
1. Data, features and training labels are read in. 
2. Activity labels are read in, made tidy and merged with training labels. This also takes care of the third requirement in the course project.i.e.Appropriately labeling the data with descriptive names.
3. All data is then merged forming one data table.
4. Mean and median measurements are extracted. Here we grep for mean.. and std.. instead of mean() and std() since the brackets in the variable names are coerced to dots when data is read in with read.table function with col.names argument in the first step.
5. Variable names are made tidy by removing alphanumeric characters and lowering the name case. Also, "bodybody" string in variable names are changed to "body".
6. Second data set is extracted with average of each activity and subject

