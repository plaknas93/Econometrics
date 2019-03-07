#Panel Data regression in R
## CODE BY RJ NEEL

d=read.csv(file='D:/RWork/rProjects/Econometrics/Data/working data.csv')
#Fixed Effects (within) and Random Effects (random)

names(d)
head(d)
d
library(plm)
plmwithin <- plm(VaR~cd+roe+roi+Ln_TA+GDP+CPI+Ln_Exp+Ln_TI, data = d, model = "within")
plmrandom <- plm(VaR~cd+roe+roi+Ln_TA+GDP+unemployment+CPI+Ln_Exp+Ln_TI, data = d, model = "random")
summary(plmwithin)
summary(plmrandom)

#phtest(plmwithin, plmrandom)
#phtest(VaR~cd+id+int_tota+roa+roe+roi+car+npa_adv, data = d)
#phtest(VaR~cd+id+int_tota+roa+roe+roi+car+npa_adv, data = d, method = "aux")

# robust Hausman test (regression-based)
#phtest(form, data = Gasoline, method = "aux", vcov = vcovHC)

# robust Hausman test with vcov supplied as a
# function and additional parameters
#phtest(form, data = Gasoline, method = "aux",
 #      vcov = function(x) vcovHC(x, method="white2", type="HC3"))

#Effect of time on internet usage
fixef(plmwithin,type="dmean")
summary(fixef(plmwithin, type = "dmean"))

#Extracting fixed effects with fixef
twoway <-  plm(VaR~cd+id+int_tota+roa+roe+roi+car+npa_adv,data=d,model="within",effect="time")
fixef(twoway,effect="time")

banks <- subset(d, bank==i)

#Mean usage by provider
mean(sbi$VaR)
mean(boi$VaR)
mean(bob$VaR)

#Usage visualisations
plot(sbi$VaR,type='l',main='SBI VaR',ylab='Value at Risk')
plot(boi$VaR,type='l',main='BOI VaR',ylab='Value at Risk')
plot(bob$VaR,type='l',main='BOB VaR',ylab='Value at Risk')

