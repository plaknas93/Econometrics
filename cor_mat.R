#Covariance Matrix


data=read.csv(file='D:/RWork/rProjects/Econometrics/Data/Sen_Fts_sp_oil.csv')

head(data)
data=data[-1]
head(data)

library(corrplot)
M=cor(data)
head(round(M,2))
corrplot(M, method="number")
corrplot(M, method="circle")
corrplot.mixed(M, lower.col = "black", number.cex = .7)

pairs(data)
library(ggplot2)
library(GGally)
ggpairs(data)
mean(data$Sensex)

stem(data$Ftse)

##Detrending Data
plot.ts(data$Sensex) #NO Detereministic TREND
plot.ts(data$Ftse)   #NO Detereministic TREND
plot.ts(data$S.P500) #NO Detereministic TREND
plot.ts(data$Oil)    #NO Detereministic TREND



