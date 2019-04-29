#Code by RJ Neel

## Mathematical & Stat foundations (Brooks)
### Portfolio theory and Matrix Algebra

### Building an Optimal Portfoli

library(quantmod)
library(PerformanceAnalytics)

### Consider the following Stocks: TATA STEEL, SAIL and JSW
a='TATASTEEL.NS'
b='JSWSTEEL.NS'
c='SAIL.NS'

### Getting daily returns for these stocks
a_prices=Ad(getSymbols(a,auto.assign = F, from='2013-03-31', to='2019-03-31'))
head(a_prices)             
tail(a_prices)
a_ret=na.omit(dailyReturn(a_prices))
head(a_ret)

b_prices=Ad(getSymbols(b,auto.assign = F, from='2013-03-31', to='2019-03-31'))
head(b_prices)             
b_ret=na.omit(dailyReturn(b_prices))
b_ret

c_prices=Ad(getSymbols(c,auto.assign = F, from='2013-03-31', to='2019-03-31'))
head(c_prices)             
c_ret=na.omit(dailyReturn(c_prices))
c_ret
### end of feteching daily return code

### Building a Covariance Matrix

t=a_ret$daily.returns
j=b_ret$daily.returns
s=c_ret$daily.returns

data=data.frame(t,j,s)
head(data)

colnames(data)
names(data)[names(data)=='daily.returns']='Tata_ret'
names(data)[names(data)=='daily.returns.1']='JSW_ret'
names(data)[names(data)=='daily.returns.2']='SAIL_ret'
head(data)
tail(data)
x=round(cor(data),2) #Correlation Correlogram
x
library('corrplot') 
corrplot(x,method='number')
corrplot(x,type='lower')

y=round(cov(data)*100,3)
y
var(data$Tata_ret)
cov(data$Tata_ret,data$JSW_ret) #Note the values and compare with y
corrplot(y,type = 'lower',method='number') #Covariance Correlogram

m=matrix(y,nrow=3,byrow = T) #Arranging in Matrix form
m
w=matrix(c(1/3,1/3,1/3),nrow=3,byrow = T)
w
w_T=t(w)
w_T

PF_var= w_T %*% m %*% w
PF_var #Calculated value

#Shortcut
library('PortfolioAnalytics')
z=var.portfolio(R = data,weights = c(1/3,1/3,1/3))
round(z*100,2)

#The mean variance efficient frontier
w
pf_ret= round(((w[1,1]*t) + (w[2,1]*j) + (w[3,1]*s))*100,2)
pf_ret
head(pf_ret)
tail(pf_ret)
C=matrix(round(cov(data)*100,2),nrow=3,byrow = T)
C
avg_t=round(mean(t)*100,2)
avg_t
avg_s=round(mean(s)*100,2)
avg_s
avg_j=round(mean(j)*100,2)
avg_j
prm=matrix(c(avg_t,avg_s,avg_t),nrow = 3)
prm
