### 残差の分布とばらつきの分解

### 人工データによる例 (y = -1 + 2x) 
set.seed(123) # 乱数のシード値の設定
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数の観測データ
e <- rnorm(length(x))                 # 誤差項
y <- -1 + 2 * x + e                   # 目的変数の観測データ
est <- lm(y ~ x)                      # モデルの推定
summary(est) # 推定結果の要約 (Residuals: 残差)
quantile(resid(est)) # 残差の五数要約の直接計算
## ばらつきの分解を確認
(Sy <- sum((y-mean(y))^2)) # 目的変数のばらつき
(S <- sum(resid(est)^2))   # 残差のばらつき
## (S <- sum((y-fitted(est))^2)) # 同じ計算
(Sr <- sum((fitted(est)-mean(y))^2)) # 回帰のばらつき
S+Sr # Sy と同じになっている

### 東京都の気候による例
mydata <- subset(subset = 月==8, # 8月のデータのみ取得
                 x=read.csv("tokyo-weather.csv",fileEncoding="utf8"))
model <- 気温 ~ 日射量 + 気圧    # モデルの定義 
est <- lm(model, data=mydata) # 回帰係数の推定
summary(est)
y <- mydata$気温 # 目的変数の取得
(Sy <- sum((y-mean(y))^2)) # 目的変数のばらつき
(S <- sum(resid(est)^2))   # 残差のばらつき
(Sr <- sum((fitted(est)-mean(y))^2)) # 回帰のばらつき
S+Sr # Sy と同じになっている
