### t値とp値

### 人工データによる例 (y = -1 + 2x) 
set.seed(123) # 乱数のシード値の設定
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数の観測データ
eps <- rnorm(length(x))               # 誤差項
y <- -1 + 2 * x + eps                 # 目的変数の観測データ
est <- lm(y ~ x)                      # モデルの推定
summary(est) # 推定結果の要約 (Coefficients: 係数)
coef(summary(est))[,3:4] # t値とp値のみ抽出

### 東京都の気候による例
mydata <- subset(subset = 月==8, # 8月のデータのみ取得
                 x=read.csv("data/tokyo-weather.csv",fileEncoding="utf8"))
model <- 気温 ~ 日射量 + 気圧    # モデルの定義 
est <- lm(model, data=mydata) # モデルの推定
coef(summary(est))[,3:4]      # t値とp値
