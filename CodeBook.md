Variables in run_analysis.R:
features: stores the information from "features.txt"
data1: temporarily stores test data
data2: temporarily stores train data
subject: combines and stores the subject file from test and train data 
X: combines and stores the X (data set) file from test and train data 
y: combines and stores the y (labels) file from test and train data 
activity: takes the "activity_labels.txt" file and converts the activities into factors corresponding to specific code levels and stores these factors in this variable
merged: merges the subject, X and y variable into one and stores the result in this variable
tidy: selects only specific columns - subject, code(y variable) and certain columns from X which have the terms mean or std in them  
NewTidy: groups the tidy data set by subjects and activities and stores the average of each measurements in this new variable 
TidyData.txt: stores the NewTidy variable in text format