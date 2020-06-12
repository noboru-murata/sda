### 
### 例: Yahoo! finance から株価のデータを取得して整理
###
install.packages("quantmod")
library(quantmod)

## Google(Alphabet), Microsoft, Amazon, Facebook, IBM, Apple
companies <- c("Google","Microsoft","Amazon","Facebook","IBM","Apple")
symbols <- c("GOOG","MSFT","AMZN","FB","IBM","AAPL")
getSymbols(symbols)
myData <- data.frame( # FB が 2012-05-18 からしかないので，2012-06 以降であわせる
    GOOG['2012-06/',1],
    MSFT['2012-06/',1],
    AMZN['2012-06/',1],
    FB['2012-06/',1],
    IBM['2012-06/',1],
    AAPL['2012-06/',1])
names(myData) <- companies

## グラフを書いてみる
plot.ts(myData) # 時系列として表示
matplot(myData, type="l", col=rainbow(6))
legend("topleft", inset=0.01,
       legend=companies, col=rainbow(6), lty=1, lwd=3)

## 月曜日だけ取り出す
## 行名に日付(文字列)が入っているので
## 時刻表現 (as.POSIXlt) に直して
## weekday 情報 (wday) が月曜 (1) に対応する行番号を抽出
mondays <- which(as.POSIXlt(rownames(myData))$wday==1)
myDataMon <- myData[mondays,]
## 同様に図示してみる
plot.ts(myDataMon) # 時系列として表示
matplot(myDataMon, type="l", col=rainbow(6))
legend("topleft", inset=0.01,
       legend=companies, col=rainbow(6), lty=1, lwd=3)

## たとえば平均値の比較をしてみる
colMeans(myData) # apply(myData,2,mean) も可
colMeans(myDataMon)
## 変動の平均を比較してみる
## 関数 diff(x) はベクトル x の階差を計算
colMeans(apply(myData,2,diff)) # 毎日どのくらい増加(減少)しているか
colMeans(apply(myDataMon,2,diff)) # 5日ごとの変動
colMeans(apply(myData,2,diff))*5 # だいたい合っている(平均なので当然)
## 変動の様子を図示
boxplot(apply(myData,2,diff)) 
boxplot(apply(myDataMon,2,diff)) 
## 変動幅(変動の絶対値)の平均を比較
colMeans(apply(myData,2,function(x)abs(diff(x)))) # 毎日の変動幅
colMeans(apply(myDataMon,2,function(x)abs(diff(x)))) # 週頭ごとの変動幅
colMeans(apply(myData,2,function(x)abs(diff(x))))*5 # 週の中で結構増減している
