### 気候データによる例
myDat1 <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8") 
myDat2 <- subset(myData,
                 select=c(気温,降水量,日射量,風速))
myDat3 <- subset(myData,
                 select=c(月,気温,降水量,日射量,風速))
## 月ごとの各変数の平均値を求める
aggregate(myDat2, 
          by=list(月=myDat1$月), # 条件に合う行を選択
          FUN=mean) # 各列に適用する関数
## 以下のコードも同じ結果を返す
aggregate( . ~ 月, data=myDat3, FUN=mean)
## 月および降水の有無でグループ分け 
aggregate(myDat2, FUN=mean,
          by=list(月=myDat3$月, 
                  降水の有無=(myDat3$降水量>0))) 
