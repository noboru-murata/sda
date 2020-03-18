### 決定係数の計算
## データセットsleepによる例
x <- subset(sleep, group == 1, extra, drop=TRUE)
y <- subset(sleep, group == 2, extra, drop=TRUE)
## 線形回帰モデルの作成
myModel <- lm(y ~ x) 
(mySum <- summary(myModel)) # 決定係数と自由度調整済み決定係数は下から二行目
coef(mySum) # パラメータの推定値・標準誤差・t値・p値
mySum$r.squared     # 決定係数
mySum$adj.r.squared # 自由度調整済み決定係数
## 決定係数の様々な計算方法の確認
ybar <- mean(y) # 目的変数の標本平均
yhat <- fitted(myModel) # あてはめ値
ehat <- resid(myModel) # 残差
n <- length(y) # データ数
sum((yhat-ybar)^2)/sum((y-ybar)^2) # もともとの定義式
cor(yhat, y)^2 # あてはめ値と目的変数の相関の二乗
1-mean(ehat^2)/mean((y-ybar)^2) # 残差による計算
1-(sum(ehat^2)/(n-2))/(sum((y-ybar)^2)/(n-1)) # 自由度調整済み決定係数
