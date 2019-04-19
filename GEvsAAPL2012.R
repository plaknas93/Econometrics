
# General Electric Share Price

GE=read.csv(file='D:/RWork/rProjects/Econometrics/Data/GE2012.csv')
head(GE)
AAPL=read.csv(file='D:/RWork/rProjects/Econometrics/Data/AAPL2012.csv')
head(AAPL)

library(ggplot2)
t=1:249
plot(x=t,y=AAPL$Change,type='line',col='green')
lines(x=t,y=GE$Change,type='line',col='red')

ggplot(GE,aes(x=t))+geom_line(aes(y=AAPL$Change,col="Apple"))+geom_line(aes(y=GE$Change,col='General Electric'))+xlab('Year - 2012 (Frequency: Daily)')+ylab('% Change in Price from 1st Jan 2012')+ggtitle("APPLE vs GE, 2012")

sd(AAPL$Close)
sd(GE$Close)

#Downloading Monthly returns of GE and AAPL
library(quantmod)
library(PerformanceAnalytics)


AAPL_monthly2012=Ad(getSymbols('AAPL',auto.assign = F, from='2011-12-1',to='2012-12-31',periodicity='monthly'))
AAPL_monthly2012
AAPL_mon_ret=na.omit(dailyReturn(AAPL_monthly2012))
AAPL_mon_ret=round(AAPL_mon_ret*100,2)
AAPL_mon_ret
mean(AAPL_mon_ret)
sd(AAPL_mon_ret)

GE_monthly2012=Ad(getSymbols('GE',auto.assign = F, from='2011-12-1',to='2012-12-31',periodicity='monthly'))
GE_monthly2012
GE_mon_ret=na.omit(dailyReturn(GE_monthly2012))
GE_mon_ret=round(GE_mon_ret*100,2)
GE_mon_ret
mean(GE_mon_ret)
sd(GE_mon_ret)

data=data.frame(GE_mon_ret$daily.returns,AAPL_mon_ret$daily.returns)
data

