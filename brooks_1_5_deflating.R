#Code by Rj Neel

year= 2001:2013
nom_pr=c(83450,93231,117905,134806,151757,158478,173225,180473,150501,163481,161211,162228,162245)
cpi=c(97.6,98.0,98.7,100.0,101.3,102.1,106.6,109.4,112.3,116.7,119.2,121.1,123.6)

plot(y=nom_pr,x=year,type = 'line',col='blue')

##Calculating Price at 2004 level
### Formula is rt= ( nom price / deflator * 100)
real_pr_2004= round((nom_pr/cpi * 100),2)

##Calculating Price at 2013 level when only 2004 deflator is known
### Formula is rt= ( nom price / Known deflator * Desired year index). Here, Desired year index is 2013 and known deflator is 2004
cbind(year,cpi)
real_pr_2013= cpi[13]*round((nom_pr/cpi),2)

data=data.frame(year, nom_pr, cpi, real_pr_2004, real_pr_2013)
data

## Plotting graphs
library(ggplot2)

ggplot(data=data, aes(x=data$year))+geom_line(aes(y=data$nom_pr,col='Nominal Price Level'))+geom_line(aes(y=data$real_pr_2004,col='2004 Price Level'))+geom_line(aes(y=data$real_pr_2013,col='2013 Price Level'))+xlab('Year')+ylab('Prices')+ggtitle("UK Housing Price Levels, 2001 to 2013")



                                                            