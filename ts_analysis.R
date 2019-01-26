#Code by RJ Neel

#Time Series Analysis : BASICS

#What is Time Series?
data("AirPassengers")
ap=AirPassengers
ap

head(ap)
plot(ap,ylab="Passengers in '000", type='o',pch=20,main="Airpassgenger traffic from 1949-60")
##Data presented over a period of time forms a Time Series

#Why TS is used?
## Predict/forecast future
## Understand the past trend
## Understand the present trend

#When not to use TS?
## 1. When data points are CONSTANT ex. y=10 next in series = 10
## 2. When data can be represented by a function ex. y=sin(x) next y=sin(0)=0
## Data predictible without any analysis in both the series

#GOAL: PREDICT PASSENGER FLOW OF NEXT 10 YEARS
##First find the mean of the series
mean(ap) #RED: This is the average number of passengers flying per month throughout 1949-60
##This does not work as clearly it is not constant in time (See the plot)
##Hence find a moving mean
abline(reg=lm(ap~time(ap)),col='red')
##RED: Now the mean is changing in time and the variance too is fluctuating 

## Thus we need to transform data so that variance becomes equal.
## if variance, mean and covariance become equal we can apply TS


# COMPONENTS OF TIMESERIES

#1. Trend (Secular Trend)
## An upward or a downward pattern observed over a time period
plot(aggregate(ap,FUN=mean),ylab='Mean',main='Trend')

#2. Periodic variations
## Long term or short-term fluctuation patterns observed in the data
## Long term is called a CYCLE (CYCLICAL VARIATION) ex. decline in sale every two years
## Short term is called SEASONAL VARIATION ex. Dec peak sales (Festive season)
## It is the peak and dip in the series occuring as a pattern
cycle(ap)

#3. Irregular Fluctuation
## Unpredictible/unforeseen changes. Does not repeat in time

#Dataset
ap
#It's class
class(ap)
#Start
start(ap)
#end
end(ap)
#frequency ##Total intervals that are there in the data
frequency(ap)
#Summary
summary(ap)

#Analysis with boxplot
boxplot(ap~cycle(ap))
#Implies July and August were popularmonths for travel

#Converting to stationary
plot(ap) #Not stationary mean and variance is increasing
plot(log(ap)) #Makes the variance equal. RED:Mean still not equal
abline(reg=lm(log(ap)~time(log(ap)),col='red'))
plot(diff(log(ap))) #Mean is now CONSTANT
##SERIES IS NOW STATIONARY. Data now suitable for modelling

#We start with AR I MA : Auto Regressive Integration Moving Average. 
##Auto Regression: Past data to regressively model future
##Moving Average: average series calculated over fixed period
## AR : p
## I  : d    
## MA : q

### ARIMA to find p d q
acf(ap) # Values exceed the blue line since data is not stationary. Our aim to get it below the blue line
acf(diff(log(ap))) ## Determines the value of 'q'. Line just before the first inverted line => q=1
pacf(diff(log(ap))) ## Determines the value of 'p'. Line just before the first inverted line => p=0
# d is the number of time the series has been differentiatiated

#Using ARIMA to predict the future

fit=arima(log(ap),c(0,1,1),seasonal = list(order=c(0,1,1),period=12)) #ARIMA Model
pred=predict(fit,n.ahead = 10*12) #Predict the future value 10*12 period
pred
pred1=2.718^pred$pred # RED: Values were in log. Hence use e 
pred1
ts.plot(ap,2.718^pred$pred,log='y',lty=c(1,3))

#####TESTING THE MODEL
#For nap dataset
nap=ts(ap,frequency=12,start=c(1949,1),end=c(1959,12))
nap
fit2=arima(log(nap),c(0,1,1),seasonal = list(order=c(0,1,1),period=12)) #ARIMA Model
pred2=predict(fit2,n.ahead = 1*12) #Predict the future value 10*12 period
pred2
pred12=2.718^pred2$pred # RED: Values were in log. Hence use e 
pred12
nap_1960=round(pred12,0)
nap_1960
ap_1960=tail(ap,12)
ap_1960
ap
nap_1960

ts.plot(nap,2.718^pred2$pred,log='y',lty=c(1,3))




#Decomposing the time series
d_ap=decompose(ap,type='additive')
plot(d_ap)

