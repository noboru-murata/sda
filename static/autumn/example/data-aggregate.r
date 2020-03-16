### 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
## 月ごとの各変数の平均値を求める
aggregate(kikou[ ,-(1:2)], by = list(月=kikou$月), FUN = mean) 
## 以下のコードも同じ結果を返す
aggregate( . ~ 月, data = subset(kikou, select = -日), FUN = mean)
## 月および降水の有無でグループ分け
aggregate(kikou[ ,-(1:2)], FUN = mean,
          by = list(月 = kikou$月, 降水の有無 = (kikou$降水量 > 0))) 
