#Graphs 

library(quantmod)
library(PerformanceAnalytics)


maxDate="2012-01-01"
minDate="2003-01-01"
sp500=Ad(getSymbols("^GSPC",auto.assign = F, from=minDate, to=maxDate))
head(sp500)             
plot(sp500,main = "GFC: S&P500 Daily Prices (Source: Yahoo Finance)")

mxDate="2009-12-31"
mnDate='2007-01-01'
sp500_1=Ad(getSymbols("^GSPC",auto.assign = F, from=mnDate, to=mxDate))
head(sp500_1)             
sp_ret=dailyReturn(sp500_1)

hist(x=sp_ret$daily.returns)


