library('dplyr')
library('ggplot2')
library('corrplot')
library('caTools')

bike <- read.csv("bikeshare.csv")
# to Find if there is any null value in the dataframe 
print(any(is.na(bike)))

print(head(bike))
#Exploratory Data analysis
# COunt vs Temp plot
p1<- ggplot(bike,aes(y=count,x=temp))+geom_point(alpha=0.2,aes(color=temp))


#Count Vs datetime with temp as color 

bike$datetime <- as.POSIXct(bike$datetime)

p2<-ggplot(bike,aes(datetime,count))+geom_point(alpha=0.5,aes(color=temp))+ scale_color_continuous(low="#55D8CE",high="#FF6E2E")

print(p2)

#Correlation between temp and count 

correlation <- cor(bike[,c('temp','count')])

print(correlation)

# Analysing the data type of the columns
print(str(bike))

p3<- ggplot(bike,aes(y=count,x=as.factor(season)))+geom_boxplot(aes(color=as.factor(season)))

print(p3)

bike$hour <- sapply(bike$datetime,function(x){format(x,"%H")})

print(head(bike))

#Creating a scatterplot with color VS hour with color based on temp 

p4<- ggplot(filter(bike,workingday==1),aes(hour,count))+ geom_point(position = position_jitter(w=1,h=0),alpha=0.5,aes(color=temp))
p5<- p4 + scale_colour_gradientn(colors=c('dark blue','blue','light blue', 'light green', 'yellow', 'orange', 'red'))
print(p5)


#Creating a plot for non-working day
p6<-ggplot(filter(bike,workingday==0),aes(hour,count))+geom_point(position=position_jitter(w=1,h=0),alpha=0.5,aes(color=temp))
p7<- p6+scale_color_gradientn(colors=c("dark blue",'blue','light blue', 'light green', 'yellow', 'orange', 'red'))
print(p7)

#Creating a linear model

temp.model<- lm(count~temp,data=bike)

print(summary(temp.model))

manual_method <- 6.0462+9.17*25

temp.test <-data.frame(temp=c(25))
print(temp.test)
Count<-predict(temp.model,temp.test)
print(Count)

bike$hour<- sapply(bike$hour,as.numeric)

print(str(bike))

perm.model<-lm(count~season+holiday+workingday+weather+temp+humidity+windspeed+hour,data=bike)

print(summary(perm.model))