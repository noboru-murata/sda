### データの標準化 (気候データによる例)
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(気温,降水量,日射量,風速))
### 基本的な箱ひげ図
head(myData)
myData.std <- scale(myData) # 各変数ごとに標準化
head(myData.std)
colMeans(myData.std) # 各変数の平均が0か確認
apply(myData.std, 2, "sd") # 各変数の標準偏差が1か確認

