library(foreign)
Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")
Panel
head(Panel)
coplot(y ~ year|country, type="l", data=Panel) # Lines
coplot(y ~ year|country, type="b", data=Panel) # Points and lines
# Bars at top indicates corresponding graph (i.e. countries)


d=read.csv(file='D:/RWork/rProjects/Econometrics/Data/panel_banks.csv')
d
head(d)
library(ggplot2)
coplot(VaR ~ year|Bank, type="l", data=d)
coplot(VaR ~ year|Bank, type="b", data=d,number=c(3,3),overlap=.5,col=as.numeric(d$Bank))# Points and lines

legend("topright",legend = unique(d$Bank))

coplot(Sepal.Width~Sepal.Length|Petal.Width*Petal.Length, data = iris,
       number=c(3,3),overlap=.5,col=as.numeric(iris$Species),
       pch=as.numeric(iris$Species)+1)

legend("topright", pch = unique(as.numeric(iris$Species)+1), 
       col = unique(as.numeric(iris$Species)), 
       legend = unique(iris$Species))

library(car)
scatterplot(d$VaR ~ d$year|d$Bank, boxplots=FALSE, smooth=TRUE, reg.line=FALSE, data=d)

Panel <- read.dta("http://dss.princeton.edu/training/Panel101.dta")
library(gplots)
plotmeans(y ~ country, main="Heterogeineity across countries", data=Panel)

plotmeans(VaR ~ Bank, main="Heterogeineity across Banks", data=d)
plotmeans(VaR ~ year, main="Heterogeineity across years", data=d)
