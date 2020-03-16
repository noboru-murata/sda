### 行・列ごとの計算
x <- matrix(1:100, 4, 25)
sum(x)           # xの成分の和を計算する(mean等も同様)
rowSums(x)       # 行ごとの総和
apply(x, 1, sum) # 上と同じ

### 気候データによる例
myDat1 <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8") 
myDat2 <- subset(myData, # 必要な列だけ選択
                 select=c(気温,降水量,日射量,風速))
colMeans(myDat2)      # 列ごとの平均
apply(myDat2, 2, max) # 列ごとの最大値
sapply(myDat2, max)   # 上と同じ
apply(myDat2, 2, min) # 列ごとの最小値
## 自作関数の適用
## 列ごとに平均より大きいデータ数(TRUE=1/FALSE=0)を計算
apply(myDat2, 2, function(x){sum(x>mean(x))}) 
