### 人工データに対する単回帰分析の例
### モデル: y = -1 + 2x
set.seed(123) # 乱数の初期値の固定
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数
epsilon <- rnorm(length(x)) # 誤差項
y <- -1 + 2 * x + epsilon # 目的変数の観測データ
(out <- lm(y ~ x)) # 回帰係数の推定
(b <- coef(out)) # 推定された回帰係数の出力
## 最小二乗推定量の計算公式との確認
(beta.hat <- cov(x, y)/var(x))
(alpha.hat <- mean(y) - beta.hat * mean(x))
## データの散布図と回帰直線の図示
plot(x, y, pch=19)
abline(reg=out, col="red", lwd=2)
grid(col="darkgray") # グリッド線の追加
### 気候データによる例
mydata <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8")
jul <- subset(mydata, 月 == 7) # 7月のデータのみ抽出
(out <- lm(気温 ~ 日射量, data=jul)) # 気温を日射量で説明
## データの散布図と回帰直線の図示
if(Sys.info()["sysname"]=="Darwin") { # MacOSの場合
    par(family="HiraginoSans-W4")} # 日本語フォント指定
plot(気温 ~ 日射量, data=jul, pch="+", 
       main="2018年7月の気温と日射量の関係")
abline(reg=out, col="red", lwd=2, lty="dashed")
grid(col="darkgray") # グリッド線の追加
