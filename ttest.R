#Hypothesis Testing: two Samples

x=rnorm(1000,mean = 5,sd = 2)
hist(x)

y=rnorm(1000,mean=9, sd=6)
hist(y)

dxy=x-y
hist(dxy)
mean(dxy)
library(e1071)
skewness(dxy)

x2=rnorm(1000,mean = 5,sd = 2)
hist(x2)
mean(x2)

y2=rnorm(1000,mean=5.05, sd=2)
hist(y2)
mean(y2)

dxy2=x2-y2
hist(dxy2)
mean(dxy2)

library(e1071)
skewness(dxy2)
kurtosis(dxy2)

#STEP 1: Research Question: To check if there is a difference between the average call lengths in the two call centers.

#STEP 2: Establish Ho and Ha
##Ho: M1-M2=0
##Ha: M1-M2!=0

#STEP 3: Appropriate test
##Z distribution since Sigma is known and n>30

#Step 4: Choose Alpha
## a=0.05

#Step 5: Decision Rules
# if t stat < -1.96 AND t stat > +1.96 -> REJECT Ho

#Step 6: Gather Data
head(x2)
head(y2)
x2_avg=mean(x2)
sx2=sd(x2)

y2_avg=mean(y2)
sy2=sd(y2)

s=2

#Step 6: Calculate t stat
n=1000
nr=(x2_avg - y2_avg) - 0
nr
dr=(((sx2^2)/n)+((sy2^2)/n))^0.5
dr    
t_stat= nr/dr
t_stat

#Step 7: Stat Conclusion
## We fail to reject Ho (Since t_stat>-1.96)

#Step 8: Practical Inference
## The average call length is identical in both the call centers

##Code
?t.test
t.test(x2,y2)
t.test(x2,y2,alternative = 'two.sided',mu=0,paired=FALSE,var.equal = FALSE,conf.level = 0.95)

df=(((sx2^2)/n)+((sy2^2)/n))^2 / ((((sx2^2)/n)^2/n) + (((sy2^2)/n)^2/n))
df
