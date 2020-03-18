### 相関の計算
## sleepデータによる例
## 2種類の睡眠薬の効果の個人差に相関はあるか?
x <- subset(sleep, group==1, extra)
y <- subset(sleep, group==2, extra)
cor(x, y)
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
cor(kikou[ ,-c(1:2)]) # 相関行列
