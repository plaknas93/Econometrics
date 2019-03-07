#Panel Data regression in R
## CODE BY RJ NEEL

d=read.csv(file.choose())
#Fixed Effects (within) and Random Effects (random)

names(d)
head(d)
d

library(ggplot2)
library(plm)
p <- ggplot(data = d, aes(x = Year, y = VaR, group = Bank,colour=Bank))
p
p + geom_line()+facet_grid(. ~ type) #%+% subset(d, type %in% c("Private"))

ggplot(subset(surveys_complete, !is.na(weight)), aes(x = species_id, y = weight)) +
    geom_point(alpha=0.3, color="tomato", position = "jitter") +
    geom_boxplot(alpha=0) + coord_flip()
