
data=read.csv(file='D:/RWork/rProjects/FE/Data/Finaldata.csv')
head(data)
library(plm)

data(Grunfeld)
head(Grunfeld)
purtest(inv ~ 1, data = Grunfeld, index = "firm", pmax = 4, test = "madwu")

purtest(Ln_TI ~ 1, data = data, index = "id", pmax = 4, test='madwu')
