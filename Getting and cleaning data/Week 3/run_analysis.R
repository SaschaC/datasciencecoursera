# course project

setwd("C:\\Users\\Sascha Coridun\\Documents\\Arbeit\\courses\\coursera\\Getting and cleaning data\\Week 3")

X_test <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"")
Y_test <- scan("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt", quote="\"")

X_train <- read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"")
Y_train <- scan("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt", quote="\"")


subject_train = scan("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test = scan("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"")

activity_labels = read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", quote="\"")

activityNumber = c(Y_train, Y_test)
subjects = c(subject_train, subject_test)

# Part 1:

d = rbind(X_train, X_test)

## Part 2: Select only feature columns corresponding to mean/std measurements

# first determine the columns, then subset columns:

features = read.table("./data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"")
feature_names = features[,2]
mean_features = grep("mean()", feature_names)
std_features = grep("std()", feature_names)
relevant_columns = c(mean_features, std_features) # vector of 79 numbers corresponding to the relevant columns

sub1 = d[,relevant_columns]

# Part 3: add subjects, activity numbers and names

sub2 = cbind(sub1,activityNumber=activityNumber)
sub2$subject = subjects
sub3 = merge(sub2, activity_labels, by.x = "activityNumber", by.y = "V1")
str(sub3)

## Part 4: formatting column (feature) names

relevant_names = feature_names[relevant_columns];relevant_names # get the relevant names used for subsetting earlier
variable_names = gsub("[^[:alnum:]]", "", relevant_names) # remove all non-alphanumeric characters
variable_names = gsub("BodyBody", "Body", variable_names) # remove reduplications
variable_names = gsub("std", "Std", variable_names) # remove reduplications
variable_names = gsub("mean", "Mean", variable_names) # to ensure uniform formatting

length(variable_names)

colnames(sub3)[2:80] = variable_names
colnames(sub3)[82] = "activityName"


# Part 5: Average table

# first convert table into long format:

long = melt(sub3, id = c("subject","activityNumber", "activityName"), measure.vars = colnames(sub3)[2:80])

# now aggregate over long table:

average = aggregate(long$value, by = list(long$subject,long$variable, long$activityName, long$activityNumber),mean)
average=arrange(average, average$Group.1) # sort the table
colnames(average) = c("subject", "feature", "activityName", "activityNumber", "value")
head(average)

write.table(average, file = "./data/tidy_set.csv", row.names = F)
?write.table
