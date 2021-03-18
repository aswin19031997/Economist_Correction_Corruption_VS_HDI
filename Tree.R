library("ISLR")
library("ggplot2")
library("tidyverse")

df<-College

head(df)

names(df)

#EDA
#Scatterplot of Grad.Rate vs Room.Board color by private column
df1<-ggplot(df,aes(Grad.Rate,Room.Board))+geom_point(aes(color=Private))
df1

#Histogram of full time undergrad students, color by private
df2<-ggplot(df,aes(F.Undergrad))+geom_histogram(aes(fill=Private),color="black")
df2

#Histogram of Grad.Rate
df3<-ggplot(df,aes(Grad.Rate))+geom_histogram(aes(fill=Private),color="black")
df3

subset(df,Grad.Rate>100)

#Changing the Grad rate to 100%
df["Cazenovia","Grad.Rate"]<-100

#imorting the CaTools library
library("caTools")

#Splitting the dataset into 70
set.seed(101)
sample=sample.split(df$Private,SplitRatio = .70)
train=subset(df,sample==TRUE)
test=subset(df,sample==FALSE)

#library rpart
library("rpart")
tree<-rpart(Private~.,method="class",data=train)
tree.pred<-predict(tree, test)

#Head of Predicted values 
head(tree.pred)

#turning these 2 into one column
joiner<- function(x){
  if(x>=0.5){
    return("Yes")
  }else{
    return("No")
  }
}

#Creating a new column Private for predicted 
tree.pred<- as.data.frame(tree.pred)
tree.pred$Private<-sapply(tree.pred$Yes,joiner)
head(tree.pred)

#Creating a confusion matrix 
table(tree.pred$Private,test$Private)

#library of rpart.plot
library(rpart.plot)

#Plotting the tree plot 
prp(tree)

#Loading the Library of RandomForest
library(randomForest)

#Using Random Forest to predict
model<- randomForest(Private~.,importance=TRUE, data=train)

#plotting the confusion matrix 
model$confusion

#Examining model importance 
model$importance

#Predict result using random forest
random.pred<- predict(model,test)


#Confusion matrix 
table(random.pred,test$Private)
