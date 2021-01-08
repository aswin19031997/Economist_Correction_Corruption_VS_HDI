library("ggplot2")
library("dplyr")
library("data.table")
df <- fread('Economist_Assignment_Data.csv',drop=1)
print(head(df))

# plotting a scatter plot 

pl <- ggplot(df,aes(CPI,HDI,color=Region)) +
  geom_point()

print(pl)

#plotting with larger circles and adding a trend line
pl <- ggplot(df,aes(CPI,HDI,color=Region)) +
  geom_point(shape=1,size=4)

print(pl)
  

pl2<-pl+geom_smooth(method='lm',formula=y~log(x),se=FALSE,color='red',aes(group=1))

print(pl2)

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

print(pl3)

pl4<-pl3 + theme_bw() + scale_x_continuous(name="Corruption Perceptions Index,2011(10=least corrupt)", limits=c(.9,10.5),breaks=(1:10))

pl5<-pl4+scale_y_continuous(name="Human Development Index, 2011 (1=Best)",
                            limits = c(0.2, 1.0))
print(pl5) 

pl6<-(pl5+ggtitle("Corruption and Human development"))

library("ggthemes")

pl7<-pl6 + theme_economist_white()

print(pl7)