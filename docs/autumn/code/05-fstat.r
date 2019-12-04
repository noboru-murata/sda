### F統計量

### 人工データによる例
## モデル: y = 1 - 2 * x1
set.seed(123)  # 乱数のシード値の設定
n <- 50        # データ数
x1 <- runif(n) # 説明変数x1の観測データ
x2 <- runif(n) # (不要な)説明変数x2の観測データ
x3 <- runif(n) # (不要な)説明変数x3の観測データ
e <- rnorm(n, sd=0.3) # 誤差項
y <- 1 - 2 * x1 + e   # 目的変数の観測データ
plot(data.frame(x1,x2,x3,y),col="blue") # 散布図
## 不要な変数を含むいくつかのモデルの推定結果を比較する
est1 <- lm(y ~ x2 + x3) # x2とx3のモデル (不要な変数のみ)
summary(est1)
(fstat <- summary(est1)$fstatistic) # F統計量と自由度
1 - pf(q=fstat[1], df1=fstat[2], df2=fstat[3]) # p値
est2 <- lm(y ~ x1 + x2) # x1とx2のモデル (必要な変数を含む)
summary(est2)
(fstat <- summary(est2)$fstatistic) # F統計量と自由度
1 - pf(q=fstat[1], df1=fstat[2], df2=fstat[3]) # p値

### 東京都の気候による例
mydata <- subset(subset = 月==8, # 8月のデータのみ取得
                 x=read.csv("tokyo-weather.csv",fileEncoding="utf8"))
### 2つのモデルを比較
model1 <- 気温 ~ 日 # おそらく無関係の説明変数
model2 <- 気温 ~ 日射量 + 気圧
summary(lm(model1, data=mydata))
summary(lm(model2, data=mydata))
