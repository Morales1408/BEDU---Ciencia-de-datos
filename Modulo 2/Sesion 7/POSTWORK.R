install.packages("mongolite", dependencies = TRUE)
library(mongolite)

db <- mongo(
  collection = "match", 
  db="match_games",
  url= "mongodb+srv://irisMojica:password@cluster0.tdsc3.mongodb.net/test",
  verbose = FALSE,
  options = ssl_options()
  )

datos <- read.csv("data.csv")
db$insert(datos)

db$count()

db$find('{"Date":"2017-12-20","HomeTeam":"Real Madrid"}')

rm(db)
