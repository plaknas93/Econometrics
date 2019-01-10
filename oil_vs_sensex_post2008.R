#Covariance Matrix


data=read.csv(file='D:/RWork/rProjects/Econometrics/Data/Post2008.csv')

head(data)


library(ggplot2)
library(GGally)

##Detrending Data
plot.ts(data$oil) #Detereministic TREND????
plot.ts(data$sensex)   #Detereministic TREND????



