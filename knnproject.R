library('ISLR')

#Headmof iris series 
head(iris)

#Structure of Iris Series 
str(iris)

#Standardizing factor
df <- scale(iris[1:4])

#checking variance to whether the scaling worked 
df
var(df[,1])

#Joining with the standardized data 
df1<- cbind(df,iris[5])

#Checking the the new data frame using caTools 
head(df1)

set.seed(101)

library('caTools')

sample<-sample.split(df1$Species,SplitRatio = 0.7)
train<-subset(df1,sample==TRUE)
test<-subset(df1,sample==FALSE)

#using KNN 
library("class")

predicted_species<- knn(train[1:4],test[1:4],train$Species,k=1)

predicted_species

#misclassification rate 

miss.error<- mean(train$Species!=predicted_species)

miss.error

#Creating a plot for error rate 
error.rate<-NULL
predicted_species<-NULL
for(i in 1:10){
  predicted_species<-knn(train[1:4],test[1:4],train$Species,k=i)
  error.rate[i]<- mean(test$Species!=predicted_species)
}

print(error.rate)

#importing ggplot
library('ggplot2')
kvalues<-1:10
df3<-data.frame(kvalues,error.rate)
ggplot(df3)+geom_point(aes(kvalues,error.rate))+geom_line(aes(kvalues,error.rate),color='red',lty='dotted',lwd=1.2)

