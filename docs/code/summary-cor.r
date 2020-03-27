### 相関の計算
## sleepデータによる例
## 2種類の睡眠薬の効果の個人差に相関はあるか?
x <- subset(sleep, group==1, extra)
y <- subset(sleep, group==2, extra)
cor(x, y) # 相関係数
## 気候データによる例
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(気温,降水量,日射量,風速))
cor(myData) # 多変量の場合は相関行列
