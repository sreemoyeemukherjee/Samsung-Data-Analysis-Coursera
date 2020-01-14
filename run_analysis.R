setwd("E://data science//Getting and cleaning data//UCI HAR Dataset")
path1<-"test"
path2<-"train"
pathm<-"merged"

features<-read.table(paste(getwd(),"features.txt", sep = "//"), col.names=c("n","functions"))

data1<-read.table(paste(getwd(),path1,"subject_test.txt", sep = "//"),col.names = "subject")
data2<-read.table(paste(getwd(),path2,"subject_train.txt",sep = "//"),col.names = "subject")
subject<-rbind(data1,data2)

data1<-read.table(paste(getwd(),path1,"X_test.txt", sep = "//"),col.names = features$functions)
data2<-read.table(paste(getwd(),path2,"X_train.txt",sep = "//"),col.names = features$functions)
X<-rbind(data1,data2)

data1<-read.table(paste(getwd(),path1,"y_test.txt", sep = "//"),col.names = "code")
data2<-read.table(paste(getwd(),path2,"y_train.txt",sep = "//"),col.names = "code")
y<-rbind(data1,data2)

activity<-read.table(paste(getwd(),"activity_labels.txt", sep = "//"), col.names=c("code","activity"))
activity<-gl(n=6,k=1,labels = activity[,2])

merged<-cbind(subject,X,y)

tidy<- merged %>% select(subject, code, contains("mean"), contains("std"))

tidy$code<-activity[tidy$code]

names(tidy)[1]<-"Subject"
names(tidy)[2]<-"Activity"
names(tidy)<-gsub("^t","Time",names(tidy))
names(tidy)<-gsub("^f","Frequency",names(tidy))
names(tidy)<-gsub("Acc","Acceleration",names(tidy))
names(tidy)<-gsub("Gyro","Gyroscope",names(tidy))
names(tidy)<-gsub("Mag","Magnitude",names(tidy))
names(tidy)<-gsub("mean","Mean",names(tidy))
names(tidy)<-gsub("-Freq","Frequency",names(tidy))
names(tidy)<-gsub("gravity","Gravity",names(tidy))
names(tidy)<-gsub("std","STD",names(tidy))
names(tidy)<-gsub("angle","Angle",names(tidy))
names(tidy)<-gsub("BodyBody","Body",names(tidy))
names(tidy)<-gsub("tBody","TimeBody",names(tidy))

NewTidy<-tidy%>% group_by(Subject,Activity)%>%summarise_all(mean)
write.table(NewTidy,"TidyData.txt", row.names = FALSE)