batting<-read.csv('Batting.csv')
print(head(batting))
str(batting)
print(head(batting$AB))
print(head(batting$X2B))

#Creating a new column BA for calculating the batting average 
batting$BA <- batting$H/batting$AB

print(tail(batting$BA,5))

batting$OBP <- (batting$H+batting$BB+batting$HBP)/(batting$AB+batting$BB+batting$HBP+batting$SF)

batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

batting$SLG <- (batting$X1B+ 2*batting$X2B + 3*batting$X3B + 4 * batting$HR)/batting$AB

str(batting)

salary <- read.csv('Salaries.csv')

print(summary(batting))

#have batting data from 1985

batting <- subset(batting,yearID>=1985)

print(summary(batting))

#merging batting and salary dataframe 

combo <- merge(batting,salary, by=c('playerID','yearID'))

print(summary(combo))

#finding the lost player

lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01'))

print(lost_players)

lost_players <- subset(lost_players,yearID==2001)

lost_players<- lost_players[,c('playerID','H','X2B','HR','OBP','SLG','BA','AB')]

print(lost_players)

mean_lostPlayer_OBP <- mean(lost_players$OBP)

mean_lost_players_AB <- mean(lost_players$AB)

print(mean_lostPlayer_OBP)

print(mean_lost_players_AB)


# Finding replacement for the lost player 
library('dplyr')
avail_players <- filter(combo,yearID==2001)

library('ggplot2')

p1<- ggplot(avail_players,aes(OBP,salary)) +geom_point()

print(p1)

#segregating available players  for OBP>0 and salary < 8 million

filter1<- filter(avail_players,OBP>0, salary< 8000000)

print(filter1)

#Segregating data for At bats greater than lost players 

filter2 <- filter(filter1, AB>500)

print(filter2)

filter3<- filter(filter2, OBP>=mean_lostPlayer_OBP)

print("All filters applied")

print(filter3)

p2 <- ggplot(filter3,aes(OBP,salary))+geom_point()

library('plotly')

p3<-ggplotly(p2)

print(p3)

player <- filter3[,c('playerID','OBP','AB','salary')]

#print(player)

possible<-arrange(player,desc(OBP))

print(possible)

print(possible[2:4,])