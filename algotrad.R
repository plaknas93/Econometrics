#Group Assignment 3
#Algorithmic Trading
#Code by RJ Neel

library(quantmod)
library(PerformanceAnalytics)
sbiprices=Ad(getSymbols("SBIN.NS",auto.assign = F, from='2018-03-31', to='2019-03-31'))
head(sbiprices)             
sbiret=na.omit(dailyReturn(sbiprices))
sbiret

INFYprices=Ad(getSymbols("INFYBANK.NS",auto.assign = F, from='2018-03-31', to='2019-03-31'))
head(INFYprices)             
INFYret=na.omit(dailyReturn(INFYprices))
INFYret

cor(INFYret$daily.returns,sbiret$daily.returns)

HINDPETROprices=Ad(getSymbols("HINDPETRO.NS",auto.assign = F, from='2014-03-31', to='2019-03-31'))
head(HINDPETROprices)             
HINDPETROret=na.omit(dailyReturn(HINDPETROprices))
HINDPETROret

BPCLprices=Ad(getSymbols("BPCL.NS",auto.assign = F, from='2014-03-31', to='2019-03-31'))
head(BPCLprices)             
BPCLret=na.omit(dailyReturn(BPCLprices))
BPCLret

cor(BPCLret$daily.returns,HINDPETROret$daily.returns)

#Stock
a='.NS'
b='ULTRACEMCO.NS'
a_prices=Ad(getSymbols(a,auto.assign = F, from='2013-03-31', to='2019-03-31'))
head(a_prices)             
tail(a_prices)
a_ret=na.omit(dailyReturn(a_prices))
head(a_ret)

b_prices=Ad(getSymbols(b,auto.assign = F, from='2013-03-31', to='2019-03-31'))
head(b_prices)             
b_ret=na.omit(dailyReturn(b_prices))
b_ret

cor(b_ret$daily.returns,a_ret$daily.returns)
