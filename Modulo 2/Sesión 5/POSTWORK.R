install.packages("fbRanks")

library(dplyr)
library(fbRanks)

data1<- read.csv("SP1-1718.csv")
data2<- read.csv("SP1-1819.csv")
data3<- read.csv("SP1-1920.csv")

data1<-select(data1,date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam,away.score = FTAG)
data2<-select(data2,date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam,away.score = FTAG)
data3<-select(data3,date = Date, home.team = HomeTeam, home.score = FTHG, away.team = AwayTeam,away.score = FTAG)



SmallData <- rbind(data1,data2,data3)

SmallData <- mutate(SmallData, date = as.Date(date,"%d/%m/%y"))
str(SmallData)

write.csv(SmallData, file = "soccer.csv")



listasoccer <- create.fbRanks.dataframes("soccer.csv")

anotaciones <- listasoccer$scores
equipos <- listasoccer$teams

fecha <- unique(anotaciones$date)
n <- length(fecha)
n

raking <- rank.teams(anotaciones,equipos, max.date = fecha[n-1], min.date = fecha[1])

predict(raking,date= fecha[n])
