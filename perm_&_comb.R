#Combinations Distribution
#Code by RJ Neel

#Load "combinat" for Combinations and Permutations
library(combinat)

n=20
r=0:20
i=0

for( i in 1:21)
{
    c[i]=choose(n,r[i])
}

c
d=data.frame(r,c)
head(d)
d
plot(c,main="Distribution of C(20,r) where 0<=r<=20",type = 'line',ylab = 'Combination',xlab = 'r')

library(ggplot2)
ggplot(data=d,aes(x=r,y=c))+geom_bar(stat='identity',position = 'dodge',aes(fill='red'))+xlab("r")+ylab("Combination")+ggtitle("Distribution of C(20,r) where 0<=r<=20")+theme_bw()+geom_line()



