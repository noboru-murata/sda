### 関数pairsによる散布図の作図
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(月,気温,降水量,日射量,風速))
### 基本的な散布図
pairs(myData[,-1], col="blue")
## plot(myData[,-1], col="blue") でも同じ図が描ける
### 表示する項目を指定
myColor <- rainbow(12)[c(8:1,12:9)] # 月別の色を用意
pairs(~ 気温 + 日射量 + 風速, data=myData,
      col=myColor[myData$月]) # 月毎に異なる色で表示
