install.packages("reshape")
library(reshape)
air <- airquality
head(air)
aqm <- melt(air, id = c('Month','Day'),na.rm =T)
head(aqm)
#~ 차원으로 출력력
cs <- cast(aqm, Day~Month~variable)
head(cs)
# + 컬럼으로 출력
cs2 <- cast(aqm,Day+Month~variable)
head(cs2)
