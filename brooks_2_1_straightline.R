#Code by RJ Neel

##Chapter 2: Mathematical and Statistical Foundations

###Section 2.1

#### Subsection 2.1.1 Straight lines

#### plotting a straight line

#### Student grade example

y= function(x){25+0.05*x}
plot(y(0:10),type='line',col='blue',xaxs='i',yaxs='i',xlab='x',ylab='y',main='Plot of y=f(x) -> y= 25+0.05*x')

#### Subsection 2.1.2 Quadratic functions

#### plotting a Parabolas
y= function(x){9+6*x+x^2}
plot(y(-10:10),type='line',col='blue',xaxs='i',yaxs='i',xlab='x',ylab='y',main='Plot of y=f(x) -> y= 9+6*x+x^2')

#### Example 2.1 Solving Quadratic functions

####(1) y=x2+x-6
y=function(x){x^2+x-6}
polyroot(c(-6,1,1))
plot(y(-10:10),type='line',col='blue',xaxs='i',yaxs='i',xlab='x',ylab='y',main='Plot of y=f(x) -> y= x^2+x-6')
library(ggplot2)
ggplot(data.frame(x=c(-5,+5)),aes(x))+stat_function(fun=y,geom='line',col='red')

####(2) y=9x2+6x+1
y=function(x){9*x^2+6*x+1}
polyroot(c(1,6,9))
ggplot(data.frame(x=c(-1,+1)),aes(x))+stat_function(fun=y,geom='line')

####(3) y=x2-3*x+1
y=function(x){x^2-3*x+1}
polyroot(c(+1,-3,1))
ggplot(data.frame(x=c(-3,3)),aes(x))+stat_function(fun=y,geom='line')

####(4) y=x2-4*x
y=function(x){x^2-4*x}
z=polyroot(c(0,-4,1))
z
ggplot(data.frame(x=c(-6,6)),aes(x))+stat_function(fun=y,geom='line')

y=function(x){3*x^2-2*x+4}
r=polyroot(c(4,-2,+3))
r
ggplot(data.frame(x=c(-10,10)),aes(x))+stat_function(fun=y,geom='line')

####Subsection 2.1.4 The Exponential function

y=function(x){2.71^x}
####Never touches the x-axis hence no roots
ggplot(data.frame(x=c(-2,2)),aes(x))+stat_function(fun=y,col='magenta')

####Subsection 2.1.5 The logarithmic function
y=function(x){log(x,base = exp(1))}
ggplot(data.frame(x=c(0.5,5)),aes(x))+stat_function(fun=y,col='red',geom='line')
