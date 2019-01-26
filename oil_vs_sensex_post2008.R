#Covariance Matrix


data=read.csv(file='D:/RWork/rProjects/Econometrics/Data/Post2008.csv')

head(data)


library(ggplot2)
library(GGally)

##Detrending Data
library(tseries)
plot.ts(data$oil) #Detereministic TREND????
adf.test(data$oil)
y=na.omit(data$sensex)
plot.ts(y)   #Detereministic TREND????
adf.test(y)


