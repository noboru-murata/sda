### 関数boxplotによる箱ひげ図の作図
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(月,気温,降水量,日射量,風速))
### 基本的な箱ひげ図
boxplot(myData[ ,-1]) # 月は除く
### 月ごとに気温を分類
boxplot(気温 ~ 月, data=myData,
        col="orange", main="月ごとの気温")
boxplot(気温 ~ 月, data=myData,
        horizontal=TRUE, # 図を回転
        col="purple", main="月ごとの気温")
