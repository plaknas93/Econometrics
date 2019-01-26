# Calculating VaR for all Banks
# Code by Neel

##Required libraries
library(quantmod)
library(PerformanceAnalytics)

## Choosing date range
maxDate=c("2003-03-31","2004-03-31","2005-03-31","2006-03-31","2007-03-31","2008-03-31","2009-03-31","2010-03-31","2011-03-31","2012-03-31","2013-03-31","2014-03-31","2015-03-31","2016-03-31","2017-03-31")
cbind(maxDate)
minDate=c("2004-04-01","2005-04-01","2006-04-01","2007-04-01","2008-04-01","2009-04-01","2010-04-01","2011-04-01","2012-04-01","2013-04-01","2014-04-01","2015-04-01","2016-04-01","2017-04-01","2018-04-01")
minDate
cbind(maxDate,minDate)

## Choosing banks
banks=c("SBIN.NS","BANKBARODA.NS","BANKINDIA.NS","ALBK.NS","ANDHRABANK.NS","CANBK.NS","CORPBANK.NS","DENABANK.NS","IDBI.NS","IOB.NS","ORIENTBANK.NS","PNB.NS","SYNDIBANK.NS","UCOBANK.NS","UNIONBANK.NS","VIJAYABANK.NS","AXISBANK.NS","CUB.NS","FEDERALBNK.NS","HDFCBANK.NS","ICICIBANK.NS","INDUSINDBK.NS","J&KBANK.BO","KTKBANK.BO","KARURVYSYA.NS","KOTAKBANK.BO","LAKSHVILAS.NS","SOUTHBANK.NS")

## Calculating VaR        
bankVaR=0
y=0

for(x in 1:28)
{    
    x
for(i in 1:15)
{
    prices=Ad(getSymbols(banks[x],auto.assign = F, from=maxDate[i], to=minDate[i]))
    head(prices)             
    ret=na.omit(dailyReturn(prices))
    ret
    
    head(ret)
    bankVaR[i]= VaR(ret,p=0.95,method='historical')
}
    y[x]=list(bankVaR)
    
}

names(y)=banks
year=seq(from=2004,to=2018,by=1)
data=data.frame(year,y)
data

write.csv(data,file='VaR_all_banks.csv')
