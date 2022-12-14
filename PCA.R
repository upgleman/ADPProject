#dataset 로드
library(datasets)
data("USArrests")
summary(USArrests)

#주성분 분석 (PCA) fitting
#cor 공분산 행렬이 아닌 상관계수 행렬 사용
# 상관계수행렬 또는 공분산행렬에 대한 Eigenvalue Decomposition(고유근분해)을 이용하여 계산
fit <- princomp(USArrests, cor = TRUE)
summary(fit)

#prcomp 함수 center 가운데로 0, scale 표준화 T
#원 데이터에 대해 SVD(Singular Value Decomposition : 특이값분해)를 수행하여 계산
fit2 <- prcomp(USArrests, scale=TRUE)

#주성분 PC들의 로딩벡터
loadings(fit)

#첫번째 성분에 대한 식
#y = 0.536*Murder + 0.583*Assault + 0.278*UrbanPop+ 0.543*Rape

#scree plot - 주성분의 분산 plot
plot(fit, type = "lines")
plot(fit2, type = "lines")
#모든 관측치 /변수를 주성분으로 표현
fit$scores

#첫 번쨰와 두번쨰 주성분의 좌표에 관측치들을 그린 plot
biplot(fit)
biplot(fit2)

#결과 첫 번째 주성분이 Assault, Murder, Rape와 비슷한 방향을 가짐
#두 번째 주성분은 urban pop과 상대적으로 평행하기에 urban pop에 큰 영향을 받았음