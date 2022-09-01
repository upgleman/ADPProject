print('a')
cat('a','b','c')
?rm
 
a <- 'hello'
a <- 'hi'
a
ls()
ls.str()
rm(a)
a <- c('a','b','c')
a
#function(x, y){ 조건 }

a <- 1
a
a = 2 
print(a)
x <- c('1','2','3','4')
print(x)
x <- c(6.25,3.14,5.18)
print(x)
x <- c('fee','fie','fun',1)
x <- c(x,a)
x
1:5
9:-2

seq(0,20,by=4)
seq(0,20,length.out=5)
rep(1,time = 5)
rep(1:4,each=2)
rep(1:4,time = 2)

A <- paste('a','b','c', sep=',')
A
paste(A,c('e','f'))
paste(A,10,sep='')
substr('Bigdataanlysis',5,8)
b = c(1,2,3,4,5)
TRUE T FALSE F
b[2]
b[-2]
10 / 3
10 %/% 3
10 %% 3
pi
print(pi, digits = 10)
cat(format(pi,digits = 10), '\n')

y = a1*x1 + c
lm(y ~ x1) 

function(a,){조건식}

# 벡터
V <-c(10,20,30)
V
names(V) <-c('Moe', "Larry", "Curly")
V[['Larry']]
V[c(1,3)]

# 리스트
L <- list('Moe', 'Larry', 'Curly', 1)
L
L[1]
L[c(2,4)]

#자료형
a = 3.123
mode(a)
a <- c(1,2,3,4)
mode(a)
a<-c('A','B','C')
mode(a)
a<-factor(c('A','B','C','A','B')) 
a
mode(a)
a <- list('A','B','C')
mode(a)
a<-data.frame(x = 1:3,  y= c('A','B','C'))
a$x
a$y
mode(a)  
mode(print)

# 그 밖의 구조들
y = c(1,2,3,NA)
mean(y)
3*y

pi
length(pi)

a <- 1:9
a
dim(a) <- c(9,1)
dim(a)
matrix(1:9, c(3,3))

b <- 1:12
dim(b) <- c(2,3,2)
b

# 벡터, 리스트, 행렬 다루기
a <- 1:6
a
b <- 7:10
b
a+b
cbind(a,b)

c(2,4,6,8) + c(1,3,5,7,9)

v <- c(1,2,3,4,5,6)
v
v<-c(v,7)
v[8]
v[8] <- 8
v
append(v, 100, 2)
v1 <- c(1,2,3)
v2 <- c(4,5,6)
v3 <- c(7,8,9)
comb <- stack(list(a=v1,b=v2,c=v3))
comb
v1[c(1,3)]
L<-list(x = v1,y = v2,z = v3)
L
L[[1]]
L[c(1,2)]
L[["x"]]
L["x"]
L$y
L$z <- NULL
L

m <- matrix(1:9,c(3,3))
m

dim(m)
diag(m)
t(m)
n = solve(m)
n <- matrix(11:19,3,3)
m %*% n
m %*% t(m)
rownames(m) <- c('x1','x2','x3')
m
colnames(m)<-c('y1','y2','y3')
m + n
m - 1
z <- m[1,]
m[2,1]

# 데이터 프레임
df <- data.frame(v1,v2,v3)
df
df1 <- data.frame(v4,v5,v6)
v4 <- c(1,2,3)
v5 <- c(4,5,6)
v6 <- c(7,8,9)
df1
cbind(df,df1)
df$v1
df1[df1$v4 == 1]

data <- data.frame(iris)
head(data)

dfrm[dfrm$gender == 'm',]
data[data$Species == 'setosa',]
data[data$Sepal.Length > 4.0 & data$Sepal.Width >4.0, c(1,2)]
subset(data, select = Species, subset = Sepal.Length > 7.0)

merge(df1, df2, by='sss')

#데이터 구조 변경
unlist(L)
L
# 5절
v <- c(24,23,52,46,75,25)
w <- c(87,86,92,84,77,68)
f <- factor(c('A','A','B','B','C','A'))
f
groups <- split(v,f)
groups
groups <- split(w,f)
groups <- unstack(data.frame(v,f))

cors <- sapply(data,cor, y= 'Sepal.Length')
summary(air)

m <- tapply(mat,2,func)

Sys.Date()
format(Sys.Date(),'%m-%d-%y')
format(Sys.Date(),'%a')
format(Sys.Date(),'%b')
format(Sys.Date(),'%B')
format(Sys.Date(),'%d')
format(Sys.Date(),'%m')
format(Sys.Date(),'%y')
format(Sys.Date(),'%Y')
d <- as.Date('2014-12-25')
mode(d)

calculate <- function(a){
  y = 1
  for(i in 1:a){
    y = y*i
  }
  print(y)
}
calculate(4)

x <- c(1:5)
x
y = seq(10,50,10)
y
xy <- rbind(x,y)
xy[1,]
xy[,1]
xy[2,]

f <- function(x,a) return((x-a)^2) 
f(1:2, 3)

is.na(c(1:3,NA))
z = c(1:3,NA)
z == NA
c(1,1,1,2) == 2

"+"(2,3)
"*"(3,3)
(3,3)"*"

library(MASS)
car <- Cars93
apply(car$MPG.city, car$Origin, mean)
lapply(car, car$Origin, mean)

x <- 1:100
sum(x>50)

install.packages("reshape")
library(reshape)
air <- airquality
head(air)
head(melt(air, id = c('Month', 'Day')))
aqm <-melt(air, id = c('Month', 'Day'), na.rm=T)
cast(aqm, Day~Month~variable)

install.packages("sqldf")
library(sqldf)
sqldf('select * from iris')

install.packages("plyr")
library(plyr)

install.packages('KlaR')
library(KlaR)
summary(air)

install.packages('ggplot2')
library(ggplot2)
summary(diamonds)

ddply(iris, .(Species), 
      function(sub){data.frame(a = mean(sub$Sepal.Width))})
