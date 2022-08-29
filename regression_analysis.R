install.packages("ISLR")
install.packages("car")
library(ISLR)
library(car)
data("Carseats")
car <- Carseats
str(car)
head(car)
sum(is.na(car)) #결측시(NA) 확인

#피어슨 상관계수 산출
cor(car$Sales, car$CompPrice) 
#피어슨 상관계수 검정
cor.test(car$Sales, car$CompPrice)

#-> 상관 계수 0.064로 상관성 없는 것으로 판단
#p-value > 0.05 크기 때문에 상관관계 통계적으로 유의하다고 볼 수 없음

#피어슨 상관계수 산출
cor(car$Sales, car$Income) 
#피어슨 상관계수 검정
cor.test(car$Sales, car$Income)
cor(car[,-c(7,10,11)])

plot(car[,-c(7,10,11)])


#-> 통계적 유의성 Income, Advertine,Price, Age

#변수 선택법을 활용한 회귀모형 생성성(단계적 선택법 사용)
lm_form <- lm(Sales~CompPrice+Income+Advertising+Population+
                Price+Age+Education,data=car)
step(lm_form, direction = "both")

#결과 : lm(formula = Sales ~ CompPrice + Income + Advertising + Price +  Age, data = car)

car.lm <- lm(Sales ~ CompPrice + Income + Advertising + Price +  Age, data = car)
summary(car.lm)
vif(car.lm) # VIF 다중 공산성 4이상인지 확인 필요
# 결정계수 : 0.5345 추정된 다변량 회귀식은 전체 데이터의 변동을 53%설명 하고 있어 낮은 설명력을 가진다고 보임
# F 통계량에 p-value값은 유의수준이하 이므로 모형은 통계적으로 유의함.
# 자유도 df = n(sample size) - k(number of regression coeffient)-1
# n : 394+5+1
# 잔차표준오차 1.927
#y = 7.109190+0.093904*CompPrice+0.013092*Income
#+0.130611*Advertising -0.092543*Price -0.044971*Age

#SST 전체제곱합 구하기
SST <- sum((car$Sales-mean(car$Sales))^2)
#SSR 회귀제곱합 구하기 / fitted.values : 예측치
SSR <-sum((car.lm$fitted.values-mean(car$Sales))^2)
#SSE 오차제곱합 구하기 / residuals: 실제값 - 예측치를 뺀 값 /car$Sales-car.lm$fitted.values
SSE <- sum((car.lm$residuals)^2)
# SSE2 <- sum((car$Sales-car.lm$fitted.values)^2)

#결정계수 SSR/SST
R_2 <- SSR/SST

#수정된 결정계수 1 - (n-1)*(SSE/SST)/(n-k-1)
A <- (400 -1)*(SSE/SST)
B <- 400-5-1
Adj_R2 <- 1-(A/B)
