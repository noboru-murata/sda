### 関数arによる自己回帰モデルの推定
## 実行例１: 人工データ(前出のモデル)
set.seed(123)
n <- 1000            # 時系列の長さ
a <- c(0.669, 0.263) # ARの係数
x <- arima.sim(list(ar=a), n)
p.max <- 10 # あてはめの候補とするARモデルの最大次数
ar(x, aic=TRUE, order.max=p.max,
   method="yule-walker")
## 推定されたモデル: AR(2), a1=0.6420, a2=0.2812

## 実行例２：Monthly Lake Erie Levels 1921 – 1970
## Hyndman, R.J. “Time Series Data Library”
##   (https:://datamarket.com)
mydata <- ts(read.csv(
    file="data/monthly-lake-erie-levels-1921-1970.csv",
    row.names=1),
    start=c(1921,1),frequency=12)
colnames(mydata) <- "level"
plot(mydata, col="royalblue",
     main="Monthly Lake Erie Levels")
acf(mydata,na.action=na.pass)
## 12月のデータのみ集める
x <- window(mydata,
            start=c(1921,12),end=c(1970,12),frequency=1)
plot(x, col="navy")
acf(x)
## ARモデルをあてはめ
(arfit <- ar(x, aic=TRUE, order.max=10,
             method="yule-walker"))
## acf(resid(arfit),na.action=na.pass)
## 残差はホワイトノイズ的であてはまりは良さそう
(ar(x, aic=TRUE, order.max=10,
    method="burg")) # 推定法を変えると結果が少し異なる
## (ar(x, aic=TRUE, order.max=10,
##     method="ols")) 
## (ar(as.numeric(x), aic=TRUE, order.max=10,
##     method="mle")) 
