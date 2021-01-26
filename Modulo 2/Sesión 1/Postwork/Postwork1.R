library(dplyr)

soccer<-read_csv("/Users/manuelgarcia/Desktop/Datascience/SP1.csv")
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
Goals_home
Goals_visit

#Probabilidad marginal compuesta 
Goals
