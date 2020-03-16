### 行・列ごとの計算
x <- matrix(1:100, 4, 25)
sum(x)           # xの成分全ての和を計算する(mean等も同様)
rowSums(x)       # 行ごとの総和
apply(x, 1, sum) # 上と同じ

### 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
x <- subset(kikou, select=-c(月, 日)) # 月日は除いておく
colMeans(x)      # 列ごとの平均
apply(x, 2, max) # 列ごとの最大値
sapply(x, max)   # 上と同じ
apply(x, 2, min) # 列ごとの最小値
## 自作関数の適用
apply(x, 2, function(x){sum(x>mean(x))}) # 列ごとに平均より大きいデータ数を計算
