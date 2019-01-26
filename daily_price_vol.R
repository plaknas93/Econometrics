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
sbi='SBIN.NS'

## Calculating daily returns

### NIFTY vs BANKNIFTY

#### SENSEX calculation
sensex_prices=Ad(getSymbols(sensex,auto.assign = F, from=maxDate, to=minDate))
head(sensex_prices)             
sensex_ret=na.omit(dailyReturn(sensex_prices))
head(sensex_ret)

#### SBI calculation
sbi_prices=Ad(getSymbols(sbi,auto.assign = F, from=maxDate, to=minDate))
head(sbi_prices)             
sbi_ret=na.omit(dailyReturn(sbi_prices))
head(sbi_ret)
class(sbi_ret)


#### Plotting timse series chart
ts.plot(sbi_ret$daily.returns,xlab="Time",ylab="Returns", gpars = list(main="SBI daily returns from 03/01/01 to 31/12/2018"))

ts.plot(sensex_ret$daily.returns,ylab="Returns",gpars = list(main="Sensex daily returns from 03/01/01 to 31/12/2018"))
