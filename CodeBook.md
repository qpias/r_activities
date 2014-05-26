read the data as blank space separated values and combined test & train

* testDataX: test/X _test.txt
* trainDataX: train/X_train.txt
* combinedDataX: combined testDataX & trainDataX

* testDataY: test/y_test.txt
* trainDataY: train/y_train.txt
* combinedDataY: combined testDataY & trainDataY

* testDataSubject: test/subject_test.txt
* trainDataSubject: train/subject_train.txt
* combinedDataSubject: combined testDataSubject & trainDataSubject

combined all data

* allData: combinedDataX + combinedDataY + combinedDataSubject

added fields that are mean / std and create a new data frame 

* features: features.txt
* meanOrStdIndices: features indices containing "mean()" or "std()" in variable name
* meanOrStdMeasurements: allData observations for features specified by the meanOrStdIndices indices

created the tidy data set using library "reshape" 

* Molten: allData transformed into a format for simple grouping
* tidySet: Molten cast into a format with means calculated and grouped by variables V1.1 & V1.2 that represent the activities and subjects

renamed columns with activity names
* colNames: vector for column names representing the activities ("SUBJECT", "VARIABLE","WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

wrote the tidySet into file tidySet.txt with the colNames column names
