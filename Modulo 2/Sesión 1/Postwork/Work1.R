setwd(r'(C:\Users\Asus\OneDrive - Universidad Politécnica de Yucatán\Concursos - Becas\Bedu - Ciencia de datos\Modulo 2\Sesión 1\Postwork)')
library(dplyr)


# Importa los datos de soccer de la temporada 2019/2020 de la primera división de la liga española a R, los datos los puedes encontrar en el siguiente enlace:
df <- lapply(dir(),read.csv)

# Las uno en un solo DF
df <- do.call(rbind, df)

# Del data frame que resulta de importar los datos a R, extrae las columnas que contienen los números de goles anotados por los equipos que jugaron en casa (FTHG) y los goles anotados por los equipos que jugaron como visitante (FTAG)
df <- select(df, FTHG,FTAG)

# Consulta cómo funciona la función table en R al ejecutar en la consola ?table
?table

# La probabilidad (marginal) de que el equipo que juega en casa anote x goles (x = 0, 1, 2, ...)

# Creo columnas con 0 en donde posteriormente itetaré para poner la información correcta
df <- mutate(df, Freq_FTHG = 0,Prob_FTHG = 0,Freq_FTAG=0,Prob_FTAG = 0,Freq_Ambos=0,
       Prob_Ambos = 0)

# Calculo tres tres tablas que contendrán las frecuencias individuales y conjuntas
freq.fthg <- as.data.frame(table(df$FTHG))
freq.ftag <- as.data.frame(table(df$FTAG))


# Aquí relleno mi tabla con la información correspondiente
for (i in 1:dim(df)[1]){
  df$Freq_FTAG[i] = freq.ftag[freq.ftag==df$FTAG[i],]$Freq
  df$Freq_FTHG[i] = freq.fthg[freq.fthg==df$FTHG[i],]$Freq
}

# Continuo calculando las probabilidades
df <- mutate(df,Prob_FTHG = Freq_FTHG/dim(df)[1], Prob_FTAG = Freq_FTAG/dim(df)[1])
# Calculo ahora con la probabilidad conjunta de ambos sucesos
df <- mutate(df, Prob_Ambos = Prob_FTHG*Prob_FTAG)

# Discrimo y me quedo solo con las columnas que me fueron solicitadas
df <- select(df, FTHG,FTAG,Prob_FTHG,Prob_FTAG,Prob_Ambos)
# Verifico mi resultado final
head(df)
