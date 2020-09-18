### 標準誤差

### 人工データによる例 (y = -1 + 2x) 
set.seed(123) # 乱数のシード値の設定
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数
eps <- rnorm(length(x))               # 誤差項
y <- -1 + 2 * x + eps                 # 目的変数
est <- lm(y ~ x)                      # モデルの推定
summary(est) # 推定結果の要約 (Coefficients: 係数)
coef(summary(est))     # 係数の推定値と標準誤差
plot(x,y,col="blue")        # 散布図
abline(est,col="red",lwd=3) # 回帰式
## summary(est)$coefficients
coef(summary(est))[,2] # 標準誤差のみ抽出
summary(est)$sigma # 誤差項の標準偏差の推定値
## 誤差項の標準偏差が標準誤差に与える影響を確認する
set.seed(123) # 乱数のシード値の再設定
eps <- rnorm(length(x), sd=2) # 誤差項 (標準偏差2倍)
y2 <- -1 + 2 * x + eps # 新しい目的変数の観測データ
est2 <- lm(y2 ~ x)
summary(est2)
coef(summary(est2))[,2] # 標準誤差
summary(est2)$sigma     # 誤差項の標準偏差
## 重ね描きして比較するため新しいグラフを作成
plot(x,y,col="blue")            # 散布図
abline(est,col="red",lwd=3)     # 回帰式
points(x,y2,col="green",pch=16) # 新しいデータを重ね描き
abline(est2,col="orange",lwd=3) # 回帰式を重ね描き

### 東京都の気候による例
mydata <- subset(subset = 月==8, # 8月のデータのみ取得
                 x=read.csv("data/tokyo_weather.csv",
                            fileEncoding="utf8"))
model <- 気温 ~ 日射量 + 気圧    # モデルの定義 
est <- lm(model, data=mydata) # 回帰係数の推定
coef(summary(est))[,2] # 標準誤差
summary(est)$sigma     # 誤差項の標準偏差
