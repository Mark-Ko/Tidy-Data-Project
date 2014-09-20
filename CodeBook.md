Tidy-Data-Project
================= 

# CodeBook.md #

----------
This is a code book for the Tidy Data Project, which creates a "tidy" dataset from the publicly available Samsung Smartphone Human Activity Recognition Dataset.  

The script run_analysis.R creates a wide and short tidy dataset from the smartphone dataset. See [http://vita.had.co.nz/papers/tidy-data.pdf](http://vita.had.co.nz/papers/tidy-data.pdf) for a discussion of tidying data. 

## Input Data ##

The Samsung Galaxy S II smartphone contains an inertial sensor package consisting of a triaxial accelerometer and gyroscopes. A research group at the University of Genova, Genoa Italy has been using this sensor data for Human Activity  Recognition (**HAR**.) These authors provided a dataset from their research for public use.[Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity
Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence
and Machine Learning. Bruges (Belgium), 24-26 April 2013. [https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf](https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf)] 

The researchers had 30 subjects wear the smartphones at their waist, while performing six activities that were a proxy for Activities of Daily Living (ADL.) The activities were walking, walking upstairs, walking downstairs, sitting, standing, and laying. During the activities, the phone's 3-axis linear acceleration and angular velocity were recorded at a sampling rate of 50Hz.

As described by the investigators:  
"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

 The data were randomly partitioned into training data (70%) and testing data (30%.) The training data were used in machine learning to develop an activity classifier, which was evaluated with the test data. [Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. 
Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. *Journal of Universal Computer Science*, vol. 19, no. 9 (2013), 1295-1314  [http://upcommons.upc.edu/e-prints/bitstream/2117/20437/1/jucs_19_09_1295_1314_anguita.pdf](http://upcommons.upc.edu/e-prints/bitstream/2117/20437/1/jucs_19_09_1295_1314_anguita.pdf)]  

The smartphone dataset is available at :

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

The download includes a README file which describes the files:    
"For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30." 

The features are the variables we'll be using. They are in the X datasets. The activities are in the y datasets.   

The features were normalized and therefore have no units. Each row in the training and test datasets is a feature vector. A detailed discussion of the features and how they were processed can be found in Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. Bruges (Belgium), 24-26 April 2013. [https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf](https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf) 

## Output Data ##
The output of run_analysis.R is a data frame with 180 observations of 68 variables.   
Variables prefixed with a "t" are time domain and those prefixed with an "f" are frequency domain.  
X,Y, and Z refer to the component of the feature in the standard Euclidian 3-dimensional vector space. 
### Variables ###
1. subject   				integer: 1-30
2. activity  				Factor w/6 levels
										1=walking
										2=walking upstairs
										3=walking downstairs
										4=sitting
										5=standing
										6=laying
3. tBodyAccMeanX 			numeric: normalized range to [-1,1]
4. tBodyAccMeanY 			numeric: normalized range to [-1,1]
5. tBodyAccMeanZ 			numeric: normalized range to [-1,1]
6. tBodyAccSDX 				numeric: normalized range to [-1,1]
7. tBodyAccSDY 				numeric: normalized range to [-1,1]
8. tBodyAccSDZ 				numeric: normalized range to [-1,1]
9. tGravityAccMeanX 		numeric: normalized range to [-1,1]
10. tGravityAccMeanY 		numeric: normalized range to [-1,1]
11. tGravityAccMeanZ 		numeric: normalized range to [-1,1]
12. tGravityAccSDX 			numeric: normalized range to [-1,1]
13. tGravityAccSDY 			numeric: normalized range to [-1,1]
14. tGravityAccSDZ 			numeric: normalized range to [-1,1]
15. tBodyAccJerkMeanX 		numeric: normalized range to [-1,1]
16. tBodyAccJerkMeanY 		numeric: normalized range to [-1,1]
17. tBodyAccJerkMeanZ 		numeric: normalized range to [-1,1]
18. tBodyAccJerkSDX 		numeric: normalized range to [-1,1]
19. tBodyAccJerkSDY 		numeric: normalized range to [-1,1]
20. tBodyAccJerkSDZ 		numeric: normalized range to [-1,1]
21. tBodyGyroMeanX 			numeric: normalized range to [-1,1]
22. tBodyGyroMeanY 			numeric: normalized range to [-1,1]
23. tBodyGyroMeanZ 			numeric: normalized range to [-1,1]
24. tBodyGyroSDX 			numeric: normalized range to [-1,1]
25. tBodyGyroSDY 			numeric: normalized range to [-1,1]
26. tBodyGyroSDZ 			numeric: normalized range to [-1,1]
27. tBodyGyroJerkMeanX 		numeric: normalized range to [-1,1]
28. tBodyGyroJerkMeanY 		numeric: normalized range to [-1,1]
29. tBodyGyroJerkMeanZ 		numeric: normalized range to [-1,1]
30. tBodyGyroJerkSDX 		numeric: normalized range to [-1,1]
31. tBodyGyroJerkSDY 		numeric: normalized range to [-1,1]
32. tBodyGyroJerkSDZ 		numeric: normalized range to [-1,1]
33. tBodyAccMagMean 		numeric: normalized range to [-1,1]
34. tBodyAccMagSD 			numeric: normalized range to [-1,1]
35. tGravityAccMagMean 		numeric: normalized range to [-1,1]
36. tGravityAccMagSD 		numeric: normalized range to [-1,1]
37. tBodyAccJerkMagMean 	numeric: normalized range to [-1,1]
38. tBodyAccJerkMagSD 		numeric: normalized range to [-1,1]
39. tBodyGyroMagMean 		numeric: normalized range to [-1,1]
40. tBodyGyroMagSD 			numeric: normalized range to [-1,1]
41. tBodyGyroJerkMagMean 	numeric: normalized range to [-1,1]
42. tBodyGyroJerkMagSD 		numeric: normalized range to [-1,1]
43. fBodyAccMeanX 			numeric: normalized range to [-1,1]
44. fBodyAccMeanY 			numeric: normalized range to [-1,1]
45. fBodyAccMeanZ 			numeric: normalized range to [-1,1]
46. fBodyAccSDX 			numeric: normalized range to [-1,1]
47. fBodyAccSDY 			numeric: normalized range to [-1,1]
48. fBodyAccSDZ 			numeric: normalized range to [-1,1]
49. fBodyAccJerkMeanX 		numeric: normalized range to [-1,1]
50. fBodyAccJerkMeanY 		numeric: normalized range to [-1,1]
51. fBodyAccJerkMeanZ 		numeric: normalized range to [-1,1]
52. fBodyAccJerkSDX 		numeric: normalized range to [-1,1]
53. fBodyAccJerkSDY 		numeric: normalized range to [-1,1]
54. fBodyAccJerkSDZ			numeric: normalized range to [-1,1]
55. fBodyGyroMeanX 			numeric: normalized range to [-1,1]
56. fBodyGyroMeanY 			numeric: normalized range to [-1,1]
57. fBodyGyroMeanZ 			numeric: normalized range to [-1,1]
58. fBodyGyroSDX 			numeric: normalized range to [-1,1]
59. fBodyGyroSDY 			numeric: normalized range to [-1,1]
60. fBodyGyroSDZ 			numeric: normalized range to [-1,1]
61. fBodyAccMagMean 		numeric: normalized range to [-1,1]
62. fBodyAccMagSD 			numeric: normalized range to [-1,1]
63. fBodyBodyAccJerkMagMean numeric: normalized range to [-1,1]
64. fBodyBodyAccJerkMagSD 	numeric: normalized range to [-1,1]
65. fBodyBodyGyroMagMean 	numeric: normalized range to [-1,1]
66. fBodyBodyGyroMagSD 		 numeric: normalized range to [-1,1]
67. fBodyBodyGyroJerkMagMean numeric: normalized range to [-1,1]
68. fBodyBodyGyroJerkMagSD 	 numeric: normalized range to [-1,1]

### Observations ###

The observations are the average of the variable for each activity of each subject. These are numeric in normalized range  [-1,1]. There are 30 subjects and six activities per subject. Therefore there are 6*30=180 observations in the data frame.  

## Data Transformations ##

The script **run_analysis.R** uses the packages data.table and reshape2.  

- The X (feature variables), y (activities), subjects, feature labels, and activity labels data are read in using read.table.
- All 561 columns of the test and training feature data are **combined** with rbind and the feature labels are added as column names. (Dimension 10299,561)
- The feature data is **subset** using grepl so that only variables of mean and std are kept in the data frame. (Dimension 10299,66)
- The feature variable names are **cleaned up** to make them more readable and understandable. Dashes and parentheses are removed, the m in mean is made uppercase, and std is changed to SD.
- The subject test and training data are read in using read.table and **combined** with rbind. The column is named "subject". (Dimension 10299,1)
- The activity test and training data and activity labels are read in using read.table and **combined** with rbind. The activity labels are **cleaned up**: they are made all lower case and underscores were replaced with spaces.
- The activity data is **converted** into a factor with the activity labels as levels.
- The activity, subject, and feature variables are **combined** into a data table. (Dimension 10229,68).
- The combined dataset is **reshaped** with melt using subject and activity as id variables.
- The melted dataset is **reshaped** with dcast using casting variables subject+activity and **aggregation** function mean.
- The resulting tidy dataset is written as a text file tidydata.txt with write.table and no quotes for variable names and no row numbers.


 
