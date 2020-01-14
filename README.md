First, we read the "features.txt" file into variable features.
Then, we merge the "subject_test.txt" and "subject_train.txt" into variable subject.
Next, we merge the "X_test.txt" and "X_train.txt" into variable X and merge the "y_test.txt" and "y_train.txt" into variable y. (STEP1)

Then, we read "activity_labels.txt" into variable activity, and turn it into a factor with each activity corresponding to a code. (STEP3)

Now, we merge subject,X and y into a single variable merged. (STEP2)

Next, we find only the columns named subject, code and those columns having the terms mean and std into a variable called tidy.
Now, we replace all the gibberish variable names into fully meaningful variable names. (STEP4)

Lastly, we group the tidy data set by subjects and activities and replace all the measurements with their average, and store this new tidy data in a text file named "TidyData.txt". (STEP5)
