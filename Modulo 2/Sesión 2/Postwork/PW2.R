setwd(r"(C:\Users\Asus\OneDrive - Universidad Politécnica de Yucatán\Concursos - Becas\Bedu - Ciencia de datos\Modulo 2\Sesión 2\Postwork)")

# Importa los datos de soccer de las temporadas 2017/2018, 2018/2019 y 2019/2020 de la primera división de la liga española a R
df <- lapply(dir(),read.csv)

# Importo la librería dplry
library(dplyr)
select(df, Date)

# Me quedo solo con las columnas que me servirían
df <- lapply(df,'[',c('Date','HomeTeam','AwayTeam','FTHG','FTAG','FTR'))

# Unifico la lista en un solo Dataframe
df <- do.call(rbind, df)

# Obteniendo una idea de las características del df
str(df)
head(df)
View(df)
summary(df)

# Transformando las columnas que deberían ser de otro datatype
df <- mutate(df, Date = as.Date(Date, "%d/%m/%y"))


df["Date"]
