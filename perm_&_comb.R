#Combinations Distribution
#Code by RJ Neel

#Load "combinat" for Combinations and Permutations
library(combinat)

n=20
r=0:20
c=choose(n,r)
c
sum(c)
p=c/sum(c)
cf=cumsum(p)
d=data.frame(r,c,p,cf)
d
head(d)

plot(x = r,y=c,main="Distribution of C(20,r) where 0<=r<=20",type = 'line',ylab = 'Combination',xlab = 'r')
plot(x=r,y=p,main="Distribution of C(20,r) where 0<=r<=20",type = 'line',ylab = 'Proportion',xlab = 'r')


library(ggplot2)
ggplot(data=d,aes(x=r,y=c))+geom_bar(stat='identity',position = 'dodge',aes(fill='red'))+xlab("r")+ylab("Combination")+ggtitle("Distribution of C(20,r) where 0<=r<=20")+theme_bw()+geom_line()

ggplot(data=d,aes(x=r,y=p))+geom_bar(stat='identity',position = 'dodge',aes(fill='red'))+xlab("r")+ylab("Proportion")+ggtitle("Distribution of C(20,r) where 0<=r<=20")+theme_bw()+geom_line()
#+geom_line(aes(y=cf))


# Mean=150, sd=30

# 1 Find P(x>90 and x<190)
x=rnorm(100,mean = 150,sd = 30)
plot(x)
hist(x)
p=ecdf(x)
p
p(190)-p(90)
