### 関数arimaによる自己回帰移動平均モデルの推定
## 実行例１: 人工データ(前出のモデル)
set.seed(123)
n <- 1000          # 時系列の長さ
a <- c(0.8, -0.64) # ARの係数
b <- -0.5          # MAの係数
y <- arima.sim(list(ar=a, ma=b), n)
(mod1 <- arima(y, order=c(2, 0, 1))) # ARMA(2,1)モデルのあてはめ 
## モデルのあてはまり具合を確認するため残差の自己相関をみる
## あてはまりがよければ残差はほぼホワイトノイズになるはず
acf(resid(mod1)) # あてはまりは悪くない

(mod2 <- arima(y, order=c(0, 0, 2))) # MA(2)モデルのあてはめ
acf(resid(mod2)) # あてはまりは良くない

## AIC最小化によって次数選択をする方法 (forecast::auto.arima)
## install.packages("forecast") 
require(forecast) # パッケージの読み込み
(mod3 <- auto.arima(y, d=0, D=0)) 
## dは原系列の差分を何回とるか決めるパラメーター
## Dは原系列の周期性(季節性)を取り除くためにとる差分の回数
## ARMA(3,1)モデルが選ばれる
acf(resid(mod3)) # あてはまりは悪くない
## ARMA(3,1)は真のモデルARMA(2,1)を含むモデルなので
## 過剰なモデルではあるがおかしくはない

## 実行例２：気候データ
## データの読み込み
require(zoo) # ts と同様だが機能の高い zoo クラスを利用
mydata <- read.csv("data/tokyo-weather.csv", fileEncoding="utf8") 
x <- zoo(mydata$気温, seq(from=as.Date("2018-01-01"),
                          to=as.Date("2018-12-31"), by=1))
plot(x,col="red",xlab="month",ylab="degree",
     main="Temperature in Tokyo (2018)")
plot(window(x,start=as.Date("2018-04-01"),end=as.Date("2018-05-31")),
     col="red",xlab="date",ylab="degree",
     main="Temperature in Tokyo (2018 April-May)")
acf(x)       # 減衰が遅いので差分をとった方が良さそう
acf(diff(x)) # 定常に見える
## 差分系列にARMAモデルをあてはめる(ARMA(1,2)が選ばれる)
(armafit <- auto.arima(x, d=1, D=0)) 
acf(resid(armafit)) # そこそこあてはまりは良さそう
