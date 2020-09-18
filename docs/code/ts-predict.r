### 気候データによる例
## 11月までの気温から12月の気温を予測する
mydata <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8") 
x <- zoo(mydata$気温,
         seq(from=as.Date("2018-01-01"),
             to=as.Date("2018-12-31"), by=1))

x.train <- window(x,end=as.Date("2018-11-30"))  # 訓練
x.test <- window(x,start=as.Date("2018-12-01")) # 試験
(armafit <- auto.arima(x.train, d=1, D=0)) # ARIMA
(armaprd <- predict(armafit,
                    n.ahead=length(x.test))) # 11月の予測
## signif(armaprd$pred, digits=2) # 予測値(小数第2位まで)
## x.test # 実績値
plot(x, col="darkgray", xlab="date", ylab="temperature")
with(armaprd,lines(pred, col="red", lwd=3)) # 予測
with(armaprd,lines(pred+se, # +1 sigma
                   col="orange", lwd=3)) 
with(armaprd,lines(pred-se, # -1 sigma
                   col="orange", lwd=3)) 

### Lake Erie データによる例
mydata <- ts(read.csv(
    file="data/monthly-lake-erie-levels-1921-1970.csv",
    row.names=1),
    start=c(1921,1),frequency=12)
colnames(mydata) <- "level"
x.train <- window(mydata,start=c(1921,1),
                  end=c(1967,12)) # 訓練
x.test <- window(mydata,start=c(1968,1),
                 end=c(1970,12))  # 試験
(armafit <- auto.arima(x.train, d=1, D=1)) # SARIMA
(armaprd <- predict(armafit, n.ahead=length(x.test))) 
plot(mydata, col="royalblue",
     main="Monthly Lake Erie Levels")
with(armaprd,lines(pred, col="red", lwd=3)) # 予測
with(armaprd,lines(pred+se, # +1 sigma
                   col="orange", lwd=3)) 
with(armaprd,lines(pred-se, # -1 sigma
                   col="orange", lwd=3)) 
