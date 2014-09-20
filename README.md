Tidy-Data-Project
=================


----------
   
   
##Creating a Tidy Dataset from  a Smartphone Accelerometer Dataset##

The Samsung Galaxy S II smartphone contains an inertial sensor package consisting of a triaxial accelerometer and gyroscopes. A research group at the University of Genova, Genoa Italy has been using this sensor data for Human Activity  Recognition (**HAR**.) These authors provided a dataset from their research for public use.[Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity
Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence
and Machine Learning. Bruges (Belgium), 24-26 April 2013. [https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf](https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf)] 

The researchers had 30 subjects wear the smartphones at their waist, while performing six activities. The data were randomly partitioned into training data (70%) and testing data (30%.) The training data were used in machine learning to develop an activity classifier, which was evaluated with the test data. [Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. 
Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. *Journal of Universal Computer Science*, vol. 19, no. 9 (2013), 1295-1314 [http://upcommons.upc.edu/e-prints/bitstream/2117/20437/1/jucs_19_09_1295_1314_anguita.pdf](http://upcommons.upc.edu/e-prints/bitstream/2117/20437/1/jucs_19_09_1295_1314_anguita.pdf)]

The dataset is available at :

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

The R script in this **Repo** takes this smartphone dataset and creates a tidy dataset using the principles described by Haley Wickham. [[http://vita.had.co.nz/papers/tidy-data.pdf](http://vita.had.co.nz/papers/tidy-data.pdf)]



----------
This **repo** consists of:  
1. **README.md** - a markdown file describing the creation of the tidy dataset.  
2. **run_analysis.R** - an R script that creates the tidy data set.   
3. **CodeBook.md** - a markdown file describing the variables in the tidy dataset and transformations performed to create them.  
4. **tidydata.txt** - the tidy dataset as a text file. 


----------
## Input Dataset ##

The smartphone dataset contains a README file that lists and describes the files. From that README file:  
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
-  'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30."   

The features are the variables we'll be using. They are in the X data set. The activities are in the y datasets. 
 
The features were normalized and therefore have no units. Each row in the training and test datasets is a feature vector. A detailed discussion of the features and how they were processed can be found in Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. Bruges (Belgium), 24-26 April 2013. [https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf](https://www.elen.ucl.ac.be/Proceedings/esann/esannpdf/es2013-84.pdf)

For free use of this dataset we recognize: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012  

## How to Create the Tidy Dataset ##
 
- Download the smartphone data set and place the file **UCI HAR Dataset** into your working directory. 
- Insure that you have the R packages **data.table** and **reshape2** installed. 
- Source the R script **run_analysis.R**
- A text file **tidydata.txt** will be created in your working directory.  

  
 

## How the R Script Works ##
1. Load the libraries needed:**data.table** and **reshape2**.
2. Read the sensor data (X test and X train) and combine these into a long and wide data frame, **data** (10299 obs. of 561 variables.) 
3. Read the features file (features.txt) and use this as column names for **data**.
4. Subset the data frame **data**, selecting only those columns that are means or standard deviations, producing a reduced data frame (10299 obs. of 66 variables.)
5. Clean up the variable names to make them more readable. 
5. Read the subject data (subject test and subject train) and combine these into a data frame **subject** (10299 obs. of 1 variable.) Name the column "subject".
6. Read the activity data (y test and y train) and the activity labels (activity labels). Combine the activity data into a data frame. Name the column "activity".
7. Clean up the activity labels to make them more readable. Make **activity** a factor with the cleaned labels as level labels.
8. Combine the activity, subject, and inertial data into a data table (10299 obs. of 68 variables.)
9. Melt the combined data to **subject** and **activity**. 
10. Reshape the melt by casting **subject + activity** calculating the mean. This is a wide and short tidy dataset (180 obs. of 68 variables.)
11. Write this tidy data frame to the working directory as tidydata.txt


This script produces a wide and short tidy dataset as described by Wickham. He also describes narrow and long tidy data. The variable names were cleaned up, but uppercase wasn't eliminated as its use helps improve "readability." 

**CodeBook.md** describes in more detail the variables, observations, and transformations performed on the smartphone dataset.
