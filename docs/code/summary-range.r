### 範囲に関する統計量
## 気候データによる例
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(気温,降水量,日射量,風速))
range(myData$気温) # 最小値と最大値を計算
diff(range(myData$気温)) # 範囲を計算
apply(myData,2,function(x)diff(range(x))) # 範囲
apply(myData,2,"IQR") # 四分位範囲
apply(myData,2,"mad", constant=1) # メディアン絶対偏差
apply(myData,2,"sd") # 標準偏差
