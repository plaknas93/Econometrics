
##Calculating  Value at Risk

library(quantmod)
library(PerformanceAnalytics)


maxDate="2018-01-01"
sbiprices=Ad(getSymbols("SBIN.NS",auto.assign = F, from=maxDate))
head(sbiprices)             
sbiret=dailyReturn(sbiprices)

hist(x=sbiret$daily.returns)

head(sbiret)
VaR(sbiret,p=0.95,method='historical')
CVaR(sbiret,p=0.95,method = 'historical')
?VaR
VaR(sbiret,p=0.95,method='')
CVaR(sbiret,p=0.95,method = 'historical')
