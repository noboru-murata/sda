### 関数pairsによる散布図の作図
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
### 基本的な散布図
pairs(kikou[,-c(1,2)], col="blue")
## plot(kikou[,-c(1,2)], col="blue")でも同じ図が描ける
### 表示する項目を指定
pairs(~ 気温 + 日射量 + 風速, data = kikou,
      col=rainbow(12)[kikou$月]) # 月毎に異なる色で表示
