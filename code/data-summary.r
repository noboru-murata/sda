### データの集計
sum(1:100) # 1から100までの整数の総和

### 気候データによる例
myData <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8") 
temp <- myData$気温 # 気温を取り出す
mean(temp) # 平均気温の計算
max(temp)  # 最大値
min(temp)  # 最小値
