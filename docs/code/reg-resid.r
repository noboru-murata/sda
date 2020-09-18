### 残差の分布

### 人工データによる例 (y = -1 + 2x) 
set.seed(123) # 乱数のシード値の設定
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数
eps <- rnorm(length(x))               # 誤差項
y <- -1 + 2 * x + eps                 # 目的変数
est <- lm(y ~ x)                      # モデルの推定
summary(est) # 推定結果の要約 (Residuals: 残差)
quantile(resid(est)) # 残差の五数要約の直接計算

### 東京都の気候による例
mydata <- subset(subset = 月==8, # 8月のデータのみ取得
                 x=read.csv("data/tokyo_weather.csv",
                            fileEncoding="utf8"))
model <- 気温 ~ 日射量 + 気圧    # モデルの定義 
est <- lm(model, data=mydata) # 回帰係数の推定
summary(est)
quantile(resid(est)) 
