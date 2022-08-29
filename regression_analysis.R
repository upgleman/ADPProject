install.packages("ISLR")
library(ISLR)
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

# lm(formula = Sales ~ CompPrice + Income + Advertising + Price +  Age, data = car)
