#CODE BY RJ NEEL

#Brooks 1.4 pg 7

##Return in Financial Modelling

#Libraries
libray(ggplot2)

data=read.csv(file='D:/RWork/rProjects/Econometrics/Data/Sensex_monthly_2005.csv')
head(data)
summary(data)
nrow(data)
t=1:172
plot(t,data$Adj.Close,main='Sensex since 2005, Data: Monthly',xlab='Time, 
monthly',ylab='Price Level',type='line',col='blue')
ggplot(data=data, aes(x=t,y=data$Adj.Close))+geom_line(col='blue')+xlab("Time (Frequency- Monthly")+ylab("Price Level")+ggtitle("Sensex Performance since 2005")

## Calculating Monthly Returns DISCRETE
ret=0
for( i in 1:171)
{
    ret[i+1]= round(((data$Adj.Close[i+1]-data$Adj.Close[i]) / data$Adj.Close[i])*100,2)
}    

head(ret)

ret_data=data.frame(t, ret)

plot(ret, type='line',col='blue')
hist(ret,col='light blue')

ggplot(ret_data,aes(ret_data$ret))+geom_histogram(col='magenta')+xlab("Returns")+ylab("Frequency")+ggtitle('Sensex Monthly Return Distribution, 2005-2019')

## Calculating Monthly Returns CONTINUOUS
lret=0
for( i in 1:171)
{
    lret[i+1]= round((log(data$Adj.Close[i+1]/data$Adj.Close[i]))*100,2)
}    

head(lret)

lret_data=data.frame(t, lret)
head(cbind(lret,ret))

plot(lret, type='line',col='blue')
hist(lret,col='light blue')

ggplot(lret_data,aes(lret_data$lret))+geom_histogram(col='magenta')+xlab("Returns")+ylab("Frequency")+ggtitle('Sensex Monthly Return Distribution (Continuous), 2005-2019')


