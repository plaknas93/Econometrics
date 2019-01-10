##Intro To Econometrics

#Simple Linear Regression

##CAPM Model for Stock: RIL & SENSEX
d=read.csv(file.choose())
head(d)

library(ggplot2)

plot(d$sensex_ret,d$ril_ret)
ggplot(data=d,aes(x=d$sensex_ret,y=d$ril_ret))+geom_point()+xlab('Sensex Return')+ylab('Reliance Return') + geom_smooth(method='lm')

## Regression
fit1=lm(ril_ret~sensex_ret,data=d)
summary(fit1)
## Model: ril_ret= 0.07+(1.14*sensex*ret)

range(d$sensex_ret)
fitted(fit1)
names(fit1)
predict(fit1, newdata = data.frame(d[1,],type="response")) #actual vs predicted vale in data set
d2=cbind(d,fitted(fit1),residuals(fit1))
head(d2)

ndata1=data.frame(sensex_ret=c(-2,-1.5,-1,0,1,1.5,2))
predict(fit1,newdata=ndata1)
cbind(ndata1,predict_ril_ret=predict(fit1,newdata=ndata1))
