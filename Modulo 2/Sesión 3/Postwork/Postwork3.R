#Postwork3
#Postwork3
library(dplyr)
library(ggplot2)
library(readr)

soccer<-as.data.frame(read.csv("/Users/manuelgarcia/Desktop/Datascience/SP1720.csv",sep=","))
soccer<-select(soccer,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)
df.soccer<-as_data_frame(soccer)
df.home<-select(df.soccer,FTHG)
df.visit<-select(df.soccer,FTAG)

Goals<-table(df.soccer$FTHG,df.soccer$FTAG)
Goals_visit<-table(df.visit)
Goals_home<-table(df.home)

Goals<-prop.table(Goals)
Goals_visit<-prop.table(Goals_visit)
Goals_home<-prop.table(Goals_home)


#Probabilidad marginal de home y visit
Goals_home<-as.data.frame(Goals_home)
Goals_visit<-as.data.frame(Goals_visit)

#Probabilidad compuesta 
Goals<-as.data.frame(Goals)

ggplot(Goals_home,aes(x=df.home, y=Freq))+geom_bar(stat="identity")+labs(x="Goles",y="Frecuencia")
ggplot(Goals_visit,aes(x=df.visit, y=Freq))+geom_bar(stat="identity")+labs(x="Goles",y="Frecuencia")

ggplot(Goals,aes(x=Var1,y=Var2,fill=Freq))+ geom_tile()+labs(x="Goles Casa",y="Goles Visitante",fill="Frecuencia")

