
library(quantmod)
library(PerformanceAnalytics)

##SBI
maxDate=c("2003-03-31","2004-03-31","2005-03-31","2006-03-31","2007-03-31","2008-03-31","2009-03-31","2010-03-31","2011-03-31","2012-03-31","2013-03-31","2014-03-31","2015-03-31","2016-03-31","2017-03-31")
cbind(maxDate)
minDate=c("2004-04-01","2005-04-01","2006-04-01","2007-04-01","2008-04-01","2009-04-01","2010-04-01","2011-04-01","2012-04-01","2013-04-01","2014-04-01","2015-04-01","2016-04-01","2017-04-01","2018-04-01")
minDate
cbind(maxDate,minDate)
sbiVaR=0
for(i in 1:15)
{
sbiprices=Ad(getSymbols("SBIN.NS",auto.assign = F, from=maxDate[i], to=minDate[i]))
head(sbiprices)             
sbiret=na.omit(dailyReturn(sbiprices))
sbiret

head(sbiret)
sbiVaR[i]= VaR(sbiret,p=0.95,method='historical')
}

sbiVaR
year=seq(from=2004,to=2018,by=1)
data=data.frame(year,sbiVaR)
data

write.csv(data,file='Sbi_VaR.csv')

##BankofBaroda
maxDate=c("2003-03-31","2004-03-31","2005-03-31","2006-03-31","2007-03-31","2008-03-31","2009-03-31","2010-03-31","2011-03-31","2012-03-31","2013-03-31","2014-03-31","2015-03-31","2016-03-31","2017-03-31")
cbind(maxDate)
minDate=c("2004-04-01","2005-04-01","2006-04-01","2007-04-01","2008-04-01","2009-04-01","2010-04-01","2011-04-01","2012-04-01","2013-04-01","2014-04-01","2015-04-01","2016-04-01","2017-04-01","2018-04-01")
minDate
cbind(maxDate,minDate)
bobVaR=0
for(i in 1:15)
{
    bobprices=Ad(getSymbols("BANKBARODA.NS",auto.assign = F, from=maxDate[i], to=minDate[i]))
    head(bobprices)             
    bobret=na.omit(dailyReturn(bobprices))
    bobret
    
    head(bobret)
    bobVaR[i]= VaR(bobret,p=0.95,method='historical')
}

bobVaR
year=seq(from=2004,to=2018,by=1)
data=data.frame(year,bobVaR)
data

write.csv(data,file='bob_VaR.csv')

##CANARA BANK
maxDate=c("2003-03-31","2004-03-31","2005-03-31","2006-03-31","2007-03-31","2008-03-31","2009-03-31","2010-03-31","2011-03-31","2012-03-31","2013-03-31","2014-03-31","2015-03-31","2016-03-31","2017-03-31")
cbind(maxDate)
minDate=c("2004-04-01","2005-04-01","2006-04-01","2007-04-01","2008-04-01","2009-04-01","2010-04-01","2011-04-01","2012-04-01","2013-04-01","2014-04-01","2015-04-01","2016-04-01","2017-04-01","2018-04-01")
minDate
cbind(maxDate,minDate)
canVaR=0
for(i in 1:15)
{
    canprices=Ad(getSymbols("CANBK.NS",auto.assign = F, from=maxDate[i], to=minDate[i]))
    head(canprices)             
    canret=na.omit(dailyReturn(canprices))
    canret
    
    head(canret)
    canVaR[i]= VaR(canret,p=0.95,method='historical')
}

canVaR
year=seq(from=2004,to=2018,by=1)
data=data.frame(year,canVaR)
data

write.csv(data,file='can_VaR.csv')

##Bank of India
cbind(maxDate,minDate)
boiVaR=0
for(i in 1:15)
{
    boiprices=Ad(getSymbols("BANKINDIA.NS",auto.assign = F, from=maxDate[i], to=minDate[i]))
    head(boiprices)             
    boiret=na.omit(dailyReturn(boiprices))
    boiret
    
    head(boiret)
    boiVaR[i]= VaR(boiret,p=0.95,method='historical')
}

boiVaR
year=seq(from=2004,to=2018,by=1)
data=data.frame(year,boiVaR)
data

write.csv(data,file='boi_VaR.csv')

####PRIVATE BANKS

##Bank of India
cbind(maxDate,minDate)
boiVaR=0
for(i in 1:15)
{
    boiprices=Ad(getSymbols("BANKINDIA.NS",auto.assign = F, from=maxDate[i], to=minDate[i]))
    head(boiprices)             
    boiret=na.omit(dailyReturn(boiprices))
    boiret
    
    head(boiret)
    boiVaR[i]= VaR(boiret,p=0.95,method='historical')
}

boiVaR
year=seq(from=2004,to=2018,by=1)
data=data.frame(year,boiVaR)
data

write.csv(data,file='boi_VaR.csv')