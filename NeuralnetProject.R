library("neuralnet")
library("dplyr")
library("ggplot2")
library("caTools")

#loading the dataset
bank_df<- read.csv("bank_note_data.csv")

#head of dataset 
head(bank_df)

#structure of the dataframe
str(bank_df)

#Building the neural net 

#Creating a train_test_split
df<-scale(bank_df)
set.seed(20)
split<-sample.split(bank_df$Class,SplitRatio = 0.7)
train<-subset(bank_df,split==T)
test<-subset(bank_df,split==F)

#Checking the structure of the train data
str(train)

#Building the neuralnet model
nn<-neuralnet(Class~Image.Var+Image.Skew+Image.Curt+Entropy,data=train,hidden=10,linear.output = FALSE)
plot(nn)

#Predicting on the test dataset 
predict<-compute(nn,test[,1:4])

#Head of the predicted set
head(predict$net.result)

#Rounding the value to nearest possible integer 
prediction<-sapply(predict$net.result,round)

#Creation of confusion matrix
table(prediction,test$Class)

#Importingthe random forest 
library("randomForest")

bank_df$Class<-factor(bank_df$Class)

#Creation of split 
set.seed(50)
split<-sample.split(bank_df$Class,SplitRatio = 0.7)
train<-subset(bank_df,split==T)
test<-subset(bank_df,split==F)

#Creating a Random Forest model 
model<-randomForest(Class~.,data=train)
rf.pred<-predict(model,test)

#Creation of confusion matrix 
table(rf.pred,test$Class)
