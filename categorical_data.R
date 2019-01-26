
##Understanding Categorical Data

##Loading data set

dset=iris
dset
names(dset)
summary(dset)
nrow(dset)
head(dset)

library(ggplot2)

###Frequency Distribution for 'Species'
ggplot(data=dset,aes(x=dset$Species))+geom_bar()

dset2=read.csv(file.choose())
dset2
names(dset2)
summary(dset2)
nrow(dset2)
head(dset2)

###Frequency Distribution for 'Race'
ggplot(data=dset2,aes(x=dset2$race,fill=dset2$income))+geom_bar()

