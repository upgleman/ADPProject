#영국 왕들의 사망시 나이

install.packages("TTR")
install.packages("forecast")
install.packages("tseries")
library(TTR)
library(forecast)
library(tseries)

king <-  scan("https://robjhyndman.com/tsdldata/misc/kings.dat",skip = 3)
king.ts <- ts(king)
plot.ts(king.ts)

#정상성 확인 : 평균이 시간에 따라 일정치 않음

#ARIMA 차분을 통해 정상 시계열 만듦
king.diff <- diff(king.ts, differences = 1)
plot(king.diff)

#ACF 와 PACF를 통해서 모델 결정


#ACF - 20 시점
acf(king.diff,lag.max = 20)
# lag2에서 절단점 => MA(1) 모형

#PACF 
pacf(king.diff, lag.max = 20)
# lag4에서 절단점 => AR(3) 모형

#Auto Arima
auto.arima(king)

king.arima <-  arima(king, order = c(0,1,1))
king.forecasts <- forecast(king.arima,h=5)
king.forecasts
