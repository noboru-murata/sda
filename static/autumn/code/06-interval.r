## 回帰式を用いた予測の例

### 人工データによる例
### モデル: y = 1 - 2 * x1
## 人工データの生成
set.seed(123)  # 乱数のシード値の設定 (同じ乱数系列を用いて再現する)
n <- 50        # データ数の設定
x1 <- runif(n) # 説明変数x1の観測データ
x2 <- runif(n) # (不要な)説明変数x2の観測データ
e <- rnorm(n, sd=0.5) # 誤差項
y <- 1 - 2 * x1 + e   # 目的変数の観測データ
mydat1 <- data.frame(x1=x1, x2=x2, y=y) # 観測データからなるデータフレーム
est1 <- lm(y ~ x1, data=mydat1) # x1による回帰分析の実行(正しいモデル)
summary(est1)
est2 <- lm(y ~ x1 + x2, data=mydat1) # x1とx2による回帰分析の実行(冗長なモデル)
summary(est2)
est3 <- lm(y ~ x2, data=mydat1) # x2による回帰分析の実行(誤ったモデル)
summary(est3)

## 新規データに対する予測
mydat2 <- data.frame(x1=runif(n), x2=runif(n,-10,10)) # 説明変数の新規データ
ynew <- 1 - 2 * mydat2$x1 # 新規データに対する目的変数の真値 (誤差なし)
yhat1 <- predict(est1, newdata=mydat2) # est1による予測値
yhat2 <- predict(est2, newdata=mydat2) # est2による予測値
yhat3 <- predict(est3, newdata=mydat2) # est3による予測値

## 決定係数による評価
cor(ynew, yhat1)^2
cor(ynew, yhat2)^2
cor(ynew, yhat3)^2

## 散布図による可視化
plot(ynew ~ yhat1, pch=4, xlab="fitted value", ylab="true value") # 黒
points(ynew ~ yhat2, pch=4, col="red")  # 赤
points(ynew ~ yhat3, pch=4, col="blue") # 青

### 東京都の気候による例
### 気温を目的変数とする回帰分析
### 9,10月のデータでモデルを構築し，8,11月のデータを予測
par(family="HiraginoSans-W4") # 日本語フォントの指定 (MacOSXの例)
rawdata <- read.csv("tokyo-weather.csv",fileEncoding="utf8")
model <- 気温 ~ 日射量 + 気圧                # モデルの定義 
mydat1 <- subset(rawdata, 月 %in% 9:10)    # モデル推定用データ
mydat2 <- subset(rawdata, 月 %in% c(8,11)) # 予測用データ
est <- lm(model, data=mydat1)              # モデルの推定
summary(est)                               # モデルの評価

## 予測値の計算
mypr1 <- predict(est) # データの予測値(あてはめ値)
mypr2 <- predict(est, newdata=mydat2) # 新規データの予測値

## 予測結果を図示
mycol <- rep("black",12) 
mycol[8:11] <- c("red","orange","violet","blue")
plot(mydat1$気温 ~ mypr1, pch=1, col=mycol[mydat1$月],
     xlab="予測値", ylab="実測値") # データ1に関する散布図
legend("bottomright",inset=.05, pch=15, # 凡例の作成
       legend=c("8月","9月","10月","11月"), col=mycol[8:11])
points(mydat2$気温 ~ mypr2, pch=4, col=mycol[mydat2$月]) # データ2
abline(0,1,col="gray") # 予測が完全に正しい場合のガイド線

## 信頼区間と予測区間の計算
require(plotrix) # 区間付きのグラフを利用するため
model <- 気温 ~ 日射量 + 気圧 + 雲量     # モデルの定義 
mydat3 <- subset(rawdata, 月 %in% 8) # モデル推定用データ
mydat4 <- subset(rawdata, 月 %in% 9) # 予測用データ
est <- lm(model, data=mydat3)        # モデルの推定
## 信頼区間
myfit <- predict(est, interval="confidence") 
mycnf <- predict(est, newdata=mydat4, interval="confidence")
## 予測区間
myprd <- predict(est, newdata=mydat4, interval="prediction")
## 8月のデータで8月をあてはめた信頼区間
plotCI(mydat3$日, myfit[,"fit"], ui=myfit[,"upr"], li=myfit[,"lwr"],
       col="blue", scol="lightblue", xlab="8月", ylab="気温")
with(mydat3,points(日, 気温, col="red", pch=16))
## 8月のデータで9月をあてはめた信頼区間
plotCI(mydat4$日, mycnf[,"fit"], ui=mycnf[,"upr"], li=mycnf[,"lwr"],
       col="blue", scol="lightblue", xlab="9月", ylab="気温", ylim=c(18,34))
with(mydat4,points(日, 気温, col="red", pch=16))
## 8月のデータで9月をあてはめた予測区間
plotCI(mydat4$日, myprd[,"fit"], ui=myprd[,"upr"], li=myprd[,"lwr"],
       col="blue", scol="lightblue", xlab="9月", ylab="気温", ylim=c(18,34))
with(mydat4,points(日, 気温, col="red", pch=16))