### 線形回帰分析 (単回帰)
## データセットsleepによる例
x <- subset(sleep, group == 1, extra, drop=TRUE)
y <- subset(sleep, group == 2, extra, drop=TRUE)
## 線形回帰分析の実行(モデルの作成)
(myModel <- lm(y ~ x)) 
coef(myModel) # 推定されたパラメータ値
## 最小二乗推定量の式にもとづく計算 (結果の比較)
(beta.hat <- cov(x, y)/var(x))
(alpha.hat <- mean(y) - beta.hat * mean(x))
## データの散布図と回帰直線の図示
plot(x, y, xlab="group 1", ylab="group 2", pch=4)
abline(reg=myModel, col="red")
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
(myModel <- lm(気温 ~ 日射量, data=kikou)) # 気温を日射量で説明
## データの散布図と回帰直線の図示
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(気温 ~ 日射量, data=kikou, pch=20, col="blue")
abline(reg=myModel, col="red", lwd=2)
confint(myModel)
