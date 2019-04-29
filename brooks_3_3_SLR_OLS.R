#Brooks

## Simple Linear Regression

data=read.csv(file='D:/RWork/rProjects/Econometrics/Data/efficient.csv')
data
head(data)

#Running Regression
plot(data$SP_500,data$GE_RET,ylab = 'General Electric Returns',xlab='S&P 500 Returns')+abline(lm(data$GE_RET~data$SP_500),col='blue')
r=lm(data$GE_RET~data$SP_500)
r
co=coefficients(r)
co
eq=paste0('GE_RET=',round(co[2],1),'*SP_500_RET',round(co[1],2))
eq
plot(data$SP_500,data$GE_RET,ylab = 'GE Returns',xlab='SP500 Returns',main=eq)+abline(lm(data$GE_RET~data$SP_500),col='blue')

library(ggplot2)
ggplot(data=data,aes(x=data$SP_500,y=data$GE_RET))+geom_point(col='dark blue')+geom_abline(col='blue')+xlab('S&P 500 Return')+ylab('GE Return')+ggtitle(eq)

#End of code