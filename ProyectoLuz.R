# importar datos de csv
file.choose()
#se guarda en un data frame el archivo csv
DfLuzR=read.csv("C:\\Users\\dalej\\Documents\\ProyectosR\\ReciboLuz\\encuesta_luz_abril.csv")
#Aqui podemos ver el archivo en una tabla de R 
View(DfLuzR)
#Aqui conocemos cuales son las variables(el nombre de las columnas)
names(DfLuzR)


#Media 
# Quita el signo de pesos y comas, luego convierte a numérico
DfLuzR$LuzPesos <- as.numeric(gsub("[$,]", "", DfLuzR$LuzPesos))
#luego si porcedemos a sacar la media
print(paste("La media de Monterrey y su Area Metropolitana es de: ", mean(DfLuzR$LuzPesos), " de recibo de luz en pesos"))

#Mediana
print(paste("La mediana Monterrey y su Area Metropolitana es de: ", median(DfLuzR$LuzPesos), " de recibo de luz en pesos"))

#Moda
print(paste("La moda Monterrey y su Area Metropolitana es de: ", moda(DfLuzR$LuzPesos), " de recibo de luz en pesos"))

#Varianza 
print(paste("La Varianza para este dato de cuanto pagarons seria de: ", var(DfLuzR$LuzPesos)))

#Desviacion Estandar
print(paste("La Varianza para este dato de cuanto pagarons seria de: ", diff(range((DfLuzR$LuzPesos)))))


# Histograma de LuzPesos
hist(DfLuzR$LuzPesos,
     main = "Histograma de Luz en Pesos",
     xlab = "Luz en Pesos",
     ylab = "Frecuencia",
     col = "lightblue",
     border = "black")

# Calcular el histograma sin graficar
h <- hist(DfLuzR$LuzPesos, plot = FALSE)

# Graficar polígono
plot(h$mids, h$counts, type = "b", 
     main = "Polígono de Frecuencias de LuzPesos",
     xlab = "Luz en Pesos",
     ylab = "Frecuencia",
     col = "red",
     pch = 19)
# Grafica de barras 
barplot(table(DfLuzR$Municipio),
        main = "Número de Encuestados por Municipio",
        xlab = "Municipio",
        ylab = "Frecuencia",
        col = rainbow(length(unique(DfLuzR$Municipio))))

# Grafica pastel
pie(table(DfLuzR$Municipio),
    main = "Distribución de Encuestados por Municipio",
    col = rainbow(length(unique(DfLuzR$Municipio))))

#cuartiles
cuartiles <- quantile(DfLuzR$LuzPesos)
for (i in 2:4){
  mensaje <- paste("Cuartil", i-1 , names(cuartiles)[i], "es", cuartiles[i])
  print(mensaje)
}

