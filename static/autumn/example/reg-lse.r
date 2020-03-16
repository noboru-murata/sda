### 回帰式の推定の例

### 人工データによる単回帰分析
### モデル: y = -1 + 2x
## 人工データの生成
set.seed(123) # 乱数のシード値の設定 (同じ乱数系列を用いて再現する)
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数の観測データ
eps <- rnorm(length(x))               # 誤差項
y <- -1 + 2 * x + eps                 # 目的変数の観測データ
plot(x, y, col="blue")                # 散布図
## 単回帰分析
(est <- lm(y ~ x)) # 回帰式の推定
(b <- coef(est))   # 推定された回帰係数
## 最小二乗推定量の計算公式と一致することを確認
X <- model.matrix(est) # デザイン行列
G <- crossprod(X)      # Gram行列 (t(X)%*%X と同じ)
solve(G) %*% crossprod(X, y)    # (X^TX)^{-1}X^TY
## あてはめ値と残差が直交することの確認
(yhat <- fitted(est))  # あてはめ値
(epshat <- resid(est)) # 残差
yhat %*% epshat        # 直交すれば内積はO
## 回帰直線が標本平均を通ることの確認
colMeans(X) %*% b 
## c(1,mean(x)) %*% b # 上と同じ結果
mean(y)
## 散布図と回帰直線の描画
plot(x, y, pch=4, col="blue")  # 散布図
abline(est, col="red", lwd=2)  # 回帰式 (y=b[1]+b[2]*x) の描画 
## abline(b, col="red", lwd=2) # 係数を渡してもよい

### 東京都の気候による重回帰分析
### モデル: 8月の"気温"を目的変数，"日射量・気圧"を説明変数とする
rawdata <- read.csv("data/tokyo-weather.csv",fileEncoding="utf8")
model <- 気温 ~ 日射量 + 気圧        # モデルの定義 
## class(model) # モデルは formula class
(est <- lm(model, data=subset(rawdata,月==8))) # 回帰係数の推定
## (est <- lm(formula = 気温 ~ 風速 + 日射量, data=rawdata))
(b <- coef(est))                    # 推定された回帰係数
## 最小二乗推定量の計算公式と一致することを確認
mydata <- model.frame(est) # modelに必要な変数の抽出
par(family="HiraginoSans-W4") # 日本語フォントの指定 (MacOSXの例)
plot(mydata, col="blue")   # 散布図
## mydata <- model.frame(model, data=mydata) # 上と同じ結果
## mydata <- na.omit(subset(mydata,select=c(Ozone,Wind,Temp)))
X <- model.matrix(est) # デザイン行列
## X <- model.matrix(model, data=mydata) # 上と同じ結果
## X <- cbind(rep(1,nrow(mydata)), mydata$Wind, mydata$Temp)
G <- crossprod(X) # Gram行列 (t(X)%*%X と同じ)
solve(G) %*% crossprod(X, mydata[,1]) # 目的変数は1列目
## あてはめ値と残差が直交することの確認
yhat <- fitted(est)  # あてはめ値
epshat <- resid(est) # 残差
yhat %*% epshat      # 直交すれば内積はO
## 回帰式が標本平均を通ることの確認
colMeans(X) %*% b 
mean(mydata[,1])
## 散布図と回帰式の定める平面の描画
require(scatterplot3d) # パッケージの読み込み
s3d <- scatterplot3d( 
    mydata[c("日射量","気圧","気温")], # x,y,z の順
    type="p", # plotの種類: "p"点，"l"線，"h"足付き
    pch=16,# 点の種類 (?points 参照)
    angle=30, # xy平面の見る方向 (適宜調整せよ)
    highlight.3d=TRUE # 高さ(z)ごとに色を変える
)
s3d$plane3d(est, col="blue", # 回帰式の定める平面の追加
            draw_polygon=TRUE, # 平面の塗り潰しの設定
            polygon_args=list(col=rgb(0,0,1,0.1))) 
