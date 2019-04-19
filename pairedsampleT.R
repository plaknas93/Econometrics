
#PAIRED SAMPLE T TEST

##CODE BY RJ NEEEL

#Begin

#STEP 1: Formulate Research Problem
## Research Problem: Check success of a new weight loss program that claims to reduce significant weight

#STEP 2: Establish Ho and Ha
## Ho: Md>= 0 (The Program increases or unaffects weight)
## Ha: Md< 0 

#STEP 3: TEST AND DISTRIBUTION
## Paired Sample t test

#STEP 4: Choose a
## a=0.05

#STEP 5: Decision rule
## n=10
## df=10-1=9
## Test Stat < -1.833 REJECT Ho

#STEP 6: Gather Data
weight_before= c(220,260,253,241,230,295,224,305,235,250) 
weight_after=c(195,202,220,241,205,220,208,245,230,270)
d=weight_after - weight_before
mean_d=mean(d)
n=10
df=n-1
d_sd=sd(d)

#STEP 7: Calculate t stat
t_stat= (mean_d-0)/ (d_sd/(10^0.5))
t_stat
## t_stat< -1.833

#STEP 8: Statistical Conclusion
# Reject Ho and proceed to Ha

#STEP 9: CONCLUSION
# It appears that the weight loss program is a SUCCESS

#OR 

?t.test()
t.test(x=weight_after,y=weight_before,mu=0,paired=T,alternative = 'less')
pnorm(q = -2.9498)
0.008113*2*100
?pnorm()
pt(q = -2.9498,df = 9)
