#계량적 MDS-구간척도 & 비율척도
library(MASS)
loc <- cmdscale(eurodist)
x <- loc[,1]
y <- loc[,2]
plot(x, y, type = "n", asp =1, main = "Metric MDS")
text(x, y, rownames(loc),cex = 0.7)
abline(v=0, h=0, lty =2, lwd =0.5)

str(loc)
x1 <- loc[,-1]
#비계량적 MDS - 순서척도
summary(swiss)
str(swiss)
dim(swiss)
swiss["Agriculture"]
colnames(swiss)

#Fertility  제거
swiss.x <- as.matrix(swiss[,-1])

colnames(swiss.x)
#dist 함수 모든 행사이 거리 계산 n(n-1)/2
swiss.dist <- dist(swiss.x)
swiss.mds <- isoMDS(swiss.dist)

#type 점을 찍지 않음
plot(swiss.mds$points, type ="n")
text(swiss.mds$points, labels= as.character(1:nrow(swiss.x)))
#h : 수평선 위치, v : 수직선 위치
#lty : line type. 선의 모양. lwd : 선의 굵기
abline(v=0, h =0, lty =4, lwd =0.5)


#sammon : Non-Linear Mapping
swiss.x <- as.matrix(swiss[,-1])
swiss.sammon <- sammon(dist(swiss.x))
plot(swiss.sammon$points, type = "n")
text(swiss.sammon$points, labels= as.character(1:nrow(swiss.x)))
abline(v=0, h =0, lty =2, lwd =0.5)
