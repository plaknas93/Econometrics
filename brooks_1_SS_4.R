#Code by RJ Neel

## Chapter 1
## Self-study questions
## Solution to Question 4 

### The foll table (refer variable data) gives, end of year prices of a bond and of CPI

year=2006:2013
bond_val= c(36.9,39.8,42.4,38.1,36.4,39.2,44.6,45.1)
cpi=c(108,110.3,113.6,116.1,118.4,120.9,123.2,125.4)
data=data.frame(year,bond_val,cpi)

data

#### (a) Calc Simple Returns

sim_ret=0 #Initializing the value

for(i in 1:7) #Looping to calc values
{
    sim_ret[i+1]= round(((data$bond_val[i+1]-data$bond_val[i]) / data$bond_val[i])*100,2)
}

sim_ret

data=data.frame(data,sim_ret)
data #solution

#### (b) Calc Cont Comp Returns

cont_ret=0 #Initializing the value

for(i in 1:7) #Looping to calc values
{
    cont_ret[i+1]= round((log(data$bond_val[i+1]/data$bond_val[i]))*100,2)
}

cont_ret

data=data.frame(data,cont_ret)
data #solution

#### (c) Calc prices of bond each year in 2013 terms

bond_price_2013= round((bond_val/cpi)*cpi[8],2)
bond_price_2013
data=data.frame(data,bond_price_2013)
data #solution

#### (d) Calc the real returns
bond_real_price=round((bond_val/cpi)*100,2)
bond_real_price
data=data.frame(data,bond_real_price)
data #solution

#Plots
library(ggplot2)

##### Returns
ggplot(data=data,aes(x=year))+geom_line(aes(y=data$sim_ret,col='Simple Returns'))+geom_line(aes(y=data$cont_ret,col='Continuous Returns'))+ggtitle('Simple vs Continuous Returns')+xlab('Year')+ylab('Returns')

###### Prices
ggplot(data=data,aes(x=year))+geom_line(aes(y=data$bond_val,col='Nominal Value'))+geom_line(aes(y=data$bond_price_2013,col='2013 Level Prices'))+geom_line(aes(y=data$bond_real_price,col='Real Prices'))+ggtitle('Inflation Adjusted Prices')+xlab('Year')+ylab('Price')
