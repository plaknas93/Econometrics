###CODE BY RJ Neel

## Time Series plot
## Banknifty vs Nifty
## Banks vs Nifty

### OBJECTIVE: To check for price volatility across banking sector and the market

### Time period: 2000 to 2018

##Required libraries
library(quantmod)
library(PerformanceAnalytics)
library(timeSeries)

## Choosing date range
maxDate="2000-01-01"
minDate="2018-12-31"

## Choosing varriables
nifty50="^NSEI"
banknifty="^NSEBANK"
sensex="^BSESN"
bankex="BSE-BANK.BO"


## Calculating daily returns

### NIFTY vs BANKNIFTY

#### Nifty calculation
nifty50_prices=Ad(getSymbols(nifty50,auto.assign = F, from=maxDate, to=minDate))
head(nifty50_prices)             
nifty_ret=na.omit(dailyReturn(nifty50_prices))
head(nifty_ret)

#### Bank Nifty calculation
banknifty_prices=Ad(getSymbols(banknifty,auto.assign = F, from=maxDate, to=minDate))
head(banknifty_prices)             
banknifty_ret=na.omit(dailyReturn(banknifty_prices))
head(banknifty_ret)
class(banknifty_ret)

#### Verifying data with investing.com
max(banknifty_ret$daily.returns)
max(nifty_ret)
min(nifty_ret)
frequency(nifty_ret)
summary(nifty_ret)
cycle(nifty_ret)

#### Plotting timse series chart
ts.plot(banknifty_ret$daily.returns,xlab="Time",ylab="Returns", gpars = list(main="Banknifty daily returns from 17/09/07 to 31/12/2018"))

ts.plot(nifty_ret$daily.returns,ylab="Returns",gpars = list(main="Nifty daily returns from 17/09/07 to 31/12/2018"))


#### Plotting two plots in timeseries
ts.plot(ts(banknifty_ret$daily.returns),ts(nifty_ret$daily.returns),col=1:2)

library(ggplot2)
library(reshape2)
df=data.frame(nifty_ret$daily.returns,banknifty_ret$daily.returns)
meltdf <- melt(df,id="Year")
Year=seq(from=2009,to=2018)
ggplot(meltdf,aes(x=Year,y=value,colour=variable,group=variable)) + geom_line()


sensex_prices=Ad(getSymbols(sensex,auto.assign = F, from=maxDate, to=minDate))
head(sensex_prices)             
sensex_ret=na.omit(dailyReturn(sensex_prices))
head(sensex_ret)


write.csv(data,file='VaR_all_banks.csv')
