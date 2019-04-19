#Code by RJ NEEL

## Brooks Chapter 2: Mathematical and Statistical Foundations

## Section 2.2 Matrices

### Operations on a Martrix

A=matrix(1:9,nrow=3,ncol=3)
A
B=matrix(1:9,nrow = 3,byrow = T) #Filling row wise
B

A+B #Matrix Addition
A-B #Matrix Subtraction

class(A)
A
A[1,3]

A[c(1,2),c(2,3)] #Selecting row 1 and row 2 and col 2 and col 3
A[c(1,2),] #Only row 1 and row 2
A[,c(2,3)] #Only col 2 and col 3
A[-1,]      #Onmitting row 1

A[1,2]=0 #modifying an element
A 
A[A<5]=0 #Modifying all elements less than 5
A

#Multiplication of Matrix

t(A) #transpose of a matrix
C=matrix(1:4,nrow = 2,byrow = T)
C
det(C)
inv(C)

##To find Inverse of a Matrix
library(matlib)
inv(C) #Inverse of C 
