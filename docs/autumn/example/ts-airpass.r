### SARIMAモデルによる datasets::AirPassengers の予測
require(tseries)
require(forecast)

## AirPassengersデータの読み込み
data(AirPassengers)
tsp(AirPassengers) # データの時間に関する情報を表示 (月ごとのデータ)
plot(AirPassengers,col="blue") # データの表示
plot(log(AirPassengers),col="blue") # 対数変換データの表示
## 対数変換により分散変動が安定化していることがわかる

## 以下では対数変換したデータを扱う
x.train <- window(log(AirPassengers),end=c(1957,12))  # 訓練データ
x.test  <- window(log(AirPassengers),start=c(1958,1)) # 試験データ

## まずトレンド(明らかな上昇傾向)について考察
## 階差を取ることにより定常化できるか検討
plot(diff(x.train),col="blue") 
acf(diff(x.train))  # 自己相関
pacf(diff(x.train)) # 偏自己相関
## lag=1(1年)に強い(偏)自己相関(季節成分)がある

## 季節成分について考察
## 12ヶ月で階差を取って同様に検討
plot(diff(diff(x.train),lag=12),col="blue")
acf(diff(diff(x.train),lag=12))  # 自己相関
pacf(diff(diff(x.train),lag=12)) # 偏自己相関
## lag=1/12,3/12,1 (1ヶ月，3ヶ月，1年)に偏自己相関が残っている

## SARIMAモデルの作成
## diff(diff(x.train),lag=12) =
##   MA(12(ただし係数は{1,3,12}が重要)), ARMA(1,12{1,3,12})
## あたりを考える必要がありそう
## 季節成分によるARMA項の指定はseasonalオプションを用いる
## 例えば seasonal=list(order=c(0,1,2),period=12) で
## 差分(1階)= e(t) + b(12)*e(t-12) + b(24)*e(t-24) のMA(2)モデルを指定
## orderとseasonal/orderでそれぞれ1ヶ月階差と12ヶ月階差を取ることに注意
## seasonalのperiodは既定値では時系列のfrequencyを用いるので通常は指定不要

## いくつかのモデルで推定を試みる
(est<-arima(x.train,order=c(0,1,1),seasonal=list(order=c(0,1,0))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(0,1,2),seasonal=list(order=c(0,1,0))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(0,1,3),seasonal=list(order=c(0,1,0))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(0,1,1),seasonal=list(order=c(0,1,1))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(0,1,2),seasonal=list(order=c(0,1,1))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(0,1,3),seasonal=list(order=c(0,1,1))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(1,1,0),seasonal=list(order=c(0,1,1))))
tsdiag(est) # 時系列モデルの診断図
(est<-arima(x.train,order=c(1,1,1),seasonal=list(order=c(0,1,1))))
tsdiag(est) # 時系列モデルの診断図

## 自動的にモデル選択を行う
sarimafit <- auto.arima(x.train,d=1,D=1)
tsdiag(sarimafit) # 時系列モデルの診断図
## 全データ(mydata)を用いた場合のAIC最小のモデルは以下となる
## arima(mydata,order=c(0,1,1),seasonal=list(order=c(0,1,1)))
## auto.arima(mydata) # 階差も自動的に選ぶことはできる

## 予測値と標準偏差の計算
sarimaprd <- predict(sarimafit,n.ahead=length(x.test))
pr <- sarimaprd$pred # 予測値
se <- sarimaprd$se   # 予測誤差の標準偏差

## 対数データにおける予測+/-標準偏差の表示
seqplot.ts(x.train,x.test,colx="blue",coly="darkgreen",
           ylab="passengers/month (log)")
lines(pr,col="red")
lines(pr+se,col="orange");lines(pr-se,col="orange")

## もとのデータの空間に戻してみる
seqplot.ts(exp(x.train),exp(x.test),colx="blue",coly="darkgreen",
           ylab="passengers/month")
lines(exp(pr),col="red")
lines(exp(pr+se),col="orange");lines(exp(pr-se),col="orange")

### tseriesパッケージの検定法の使用例
### 上記の例ではacf/pacfを用いて検討しているが，検定を用いて検討することもできる
## kpss.test(x.train) # 定常か？ 棄却される(当然定常でない)
## pp.test(x.train) # ランダムウォーク的な非定常性か？ 棄却される
## kpss.test(x.train,null="Trend") # トレンドを除けば定常か? 棄却されない
## 非定常性の大きな要素はトレンドらしいことが予想される
## 一回階差を取ることによりトレンドは除去されているように見える
## kpss.test(diff(x.train)) # 定常か? 棄却されない
## jarque.bera.test(diff(diff(x.train),lag=12)) # 正規か？ 棄却されない
## 1ヶ月と12ヶ月で階差を取った時系列は
## 1ヶ月と3ヶ月と12ヶ月に相関のある正規分布の系列と考えることができる
