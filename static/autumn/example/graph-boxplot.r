### 関数boxplotによる箱ひげ図の作図
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
### 基本的な箱ひげ図
boxplot(kikou[ ,-c(1,2)]) # 月日は除く
### 月ごとに気温を分類
boxplot(気温 ~ 月, data=kikou, col="orange", main="月ごとの気温")
### 図を回転
boxplot(気温 ~ 月, data=kikou,
        col="purple", main="月ごとの気温", horizontal=TRUE)
