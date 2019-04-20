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

#Multiplication of Matrix #Example from the Book
E=matrix(c(1,2,7,3,1,6),nrow=3,byrow = T)
E
F=matrix(c(0,2,4,9,6,3,0,2),nrow=2,byrow = T)
F
E%*%F #Note for Matrix Multiplication use %*%
F%*%E #Note the error cause col(F) != row(E)


####Rank of a Matrix
C
d=qr(C) #Note Rank is 2
d

D=matrix(c(2,6,3,9),nrow=2) #Not filled by Row
D
qr(D) #Note Rank is 1 Linear in row

G=matrix(c(2,3,6,9),nrow=2) #Not filled by Row
G
det(G)
qr(G) #Note Rank is 1 Linear in column

H=matrix(c(2,6,3,8,24,2),nrow=3) #Not filled by Row
H
qr(H) #Note Rank is 1

h=c(1,4,3,2,1,2,3,4,2,6,7,5)
J=matrix(h,nrow=3,ncol=4,byrow=T)
J
det(J) #Not a Square Matrix
qr(J)


t(A) #transpose of a matrix
C=matrix(1:4,nrow = 2,byrow = T)
C
det(C)
inv(C)

##To find Inverse of a Matrix
library(matlib)
inv(C) #Inverse of C 
solve(C) #Also works for Square Matrix

K=matrix(c(2,1,4,6),nrow=2,byrow = T)
K
det(K)
solve(K)

#For a 3*3 Matrix
l=c(0,1,2,1,2,3,3,1,1)
L=matrix(l,nrow=3,byrow = T)
L
det(L)
solve(L)
i=c(1,0,0,0,1,0,0,0,1)
I=matrix(i,nrow=3,byrow=3)
I
I[1,]=I[1,]+I[2,]
I[2,]=I[2,]-I[1,]
I[3,]=I[3,]-3*I[1,]
I[1,]=I[1,]+3*I[2,]
I[2,]=I[3,]-9*I[2,]
I[3,]=I[3,]+8*I[2,]
I[1,]=I[1,]+(1/18)*I[3,]
I[2,]=I[2,]-(1/9)*I[3,]
I[3,]=I[3,]/18
I[2,]=I[2,]-2*I[3,]
I

L
L[1,]=L[1,]+L[2,]
L[2,]=L[2,]-L[1,]
L[3,]=L[3,]-3*L[1,]
L[1,]=L[1,]+3*L[2,]
L[2,]=L[3,]-9*L[2,]
L[3,]=L[3,]+8*L[2,]
L[1,]=L[1,]+(1/18)*L[3,]
L[2,]=L[2,]-(1/9)*L[3,]
L[3,]=L[3,]/18
L[2,]=L[2,]-2*L[3,]
L

#Eigen Values
D
eigen(D) #Eigen Values
