### 順序に基づく統計量の計算
## 気候データによる例
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(気温,降水量,日射量,風速))
x <- myData$気温 
mean(x) # 平均
median(x) # メディアン
quantile(x) # 最小・最大値および四分位点 
quantile(x, 0.5) # メディアンと同じ
quantile(x, c(0.25, 0.75)) # 第1四および第3四分位点
fivenum(x) # 五数要約 (quantile(x)と同様，表示が異なる)
summary(x) # 五数要約に平均を加えて集約
## 注意: 分位点の計算方式の違いのため値が多少異なる場合がある
y <- c(x, 1000) # データに外れ値を加えてる
mean(y) # mean(x)と大きく異なる(外れ値に鋭敏)
median(y) # median(x)とあまり変わらない(外れ値に頑健)
## データフレームに対しても同様の計算が可能
summary(myData) # 全ての五数要約と平均を計算
