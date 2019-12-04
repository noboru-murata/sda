### 線形回帰分析の例
### - Ashenfelter's Wine Equation

## URL: http://www.liquidasset.com/winedata.html
## Bordeaux Wine Vintage Quality and the Weather
##   Data and Results for Wine Regressions 
##     as Reported in Chance Magazine
##                 by Ashenfelter, Ashmore and Lalonde
## LPRICE2 : Logarithm of Average Vintage Price Relative to 1961
## WRAIN   : Winter (Oct.-March) Rain 
## DEGREES : Average Temperature (April-Sept.)
## HRAIN   : Harvest (August and Sept.) Rain 
## TIME_SV : Time since Vintage (Years) 
## データの読み込み("wine.csv"を用いる)
wine <- read.csv(file="wine.csv",row.names=1)  # データの読み込み

## データの内容を確認
str(wine)   # データの構造を表示
head(wine) # データの表示(初)
tail(wine) # データの表示(終)
## print(wine) # データの表示(全体)

## データのプロット (LPRICE2の値で色分け)
pairs(~ ., data=wine,
      panel=panel.smooth,
      col=rainbow(7)[with(wine,cut(LPRICE2,breaks=7))],  # 赤:低-紫:高
##    col=3+with(wine,LPRICE2>mean(LPRICE2,na.rm=TRUE)), # 平均の上下
      main="Bordeaux Wine Data")

## ボルドーワインの価格(質)を冬の降雨量(WRAIN)，育成期平均気温(DEGREES)，
## 収穫期降雨量(HRAIN)，年数(TIME_SV)で回帰する
est <- lm(LPRICE2 ~ ., data=wine)
summary(est)
round(coef(est),digits=4) # 係数を確認する (4桁表示)

## 診断プロット (各グラフについては ?plot.lm 参照)
plot(est)
## plot(est,which=1:6) # 全て表示 
## plot(est,which=c(1,2,5)) # 一部表示

## 回帰による予測結果を比較
year <- rownames(wine) # 年代を取り出す
price <- wine$LPRICE2  # 価格(log値)を取り出す
fit <- predict(est,newdata=wine) # NAも含めあてはめ値を計算

## 年度による価格の違いを視覚化 (NAは表示されない)
plot(year,price,type="l",col="blue",ylab="Price (log ratio)")
plot(year,exp(price),type="l",col="blue",ylab="Price (ratio)")

## 実測値と予測値の比較
plot(price,fit,xlab="Price (log ratio)",ylab="fitted value",
      main="Bordeaux Wine Price",pch=21,col="gray50",bg="gray90")
text(price,fit+.05,labels=year,cex=.8)

## 棒グラフによる各年の比較
barplot(rbind(exp(price),exp(fit)),names.arg=rownames(wine),
        beside=TRUE,las=3,col=c("blue","red"),
        xlab="Year",ylab="Price (ratio)",main="Bordeaux Wine Price")
legend("topright",
       legend=c("observation","fitted value"),
       fill=c("blue","red"))

## 専門家の評価が高かったのは1986年だが，予測では凡庸
## その後1989/1990年の気温(かなり高い)を用いて予測した内容が話題となる
## この予測した結果が正しかったのかどうかは調べてみて下さい
