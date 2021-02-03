#Postwork4
library(dplyr)
library(ggplot2)
library(readr)
library(boot)

soccer<-as.data.frame(read.csv("/Users/manuelgarcia/Desktop/Datascience/SP1720.csv",sep=","))
soccer<-select(soccer,Date,HomeTeam,AwayTeam,FTHG,FTAG,FTR)
df.soccer<-as.data.frame(soccer)
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
Goals<-mutate(Goals,Home=Var1,Visit=Var2)
Goals<-select(Goals,Home,Visit,Freq)

mult<-list()

for (i in 1:9) {
  for(j in 1:7){
     mult[7*(i-1)+j]<-as.double(Goals_home$Freq[i])*as.double(Goals_visit$Freq[j])
  }
}

Goals<-mutate(Goals,prob=mult)
Goals<-mutate(Goals,cociente=as.double(Freq)/as.double(prob))
typeof(Goals$prob)

Boots<-boot(Goals$prob,statistic = all,R=10)
plot(Boots)
#Tomando el resultado dado se muestra que tienen independencia lineal las variables

