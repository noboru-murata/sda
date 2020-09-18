### 寄与率

### 人工データによる例
### モデル: y = 1 - 2 * x1 + 3 * x2
set.seed(123)  # 乱数のシード値の設定
n <- 50        # データ数
x1 <- runif(n) # 説明変数x1の観測データ
x2 <- runif(n) # 説明変数x2の観測データ
x3 <- runif(n) # (不要な)説明変数x3の観測データ
eps <- rnorm(n, sd=0.3)        # 誤差項
y <- 1 - 2 * x1 + 3 * x2 + eps # 目的変数の観測データ
plot(data.frame(x1,x2,x3,y),col="blue") # 散布図
## いくつかのモデルによる推定結果を比較する
(est1 <- lm(y ~ x1))        # x1のみの不十分なモデル
summary(est1)$r.squared     # 決定係数
summary(est1)$adj.r.squared # 自由度調整済み決定係数
(est2 <- lm(y ~ x1 + x3))   # x1とx3の誤ったモデル
summary(est2)$r.squared     # 決定係数 (est1より上昇)
summary(est2)$adj.r.squared # 調整済み (est1より下降)
(est3 <- lm(y ~ x1 + x2))   # x1とx2の正しいモデル
summary(est3)$r.squared     # 決定係数 (est1より上昇)
summary(est3)$adj.r.squared # 調整済み (est1より上昇)
## 予測値と実測値の比較
with(est1, plot(y,fitted.values,
                col="orange",pch=17,   # 三角
                ylab="fitted values",ylim=range(y)))   
abline(0,1,col="red",lwd=2)
with(est2, points(y,fitted.values,
                  col="green",pch=15)) # 四角
with(est3, points(y,fitted.values,
                  col="blue",pch=16))  # 丸
legend("bottomright",inset=.05, # 凡例の作成
       col=c("orange","green","blue"), pch=c(17,15,16), 
       legend=c("モデル1","モデル2","モデル3"))

### 東京都の気候による例
### 3つのモデルを比較
mydata <- subset(subset = 月==8, # 8月のデータのみ取得
                 x=read.csv("data/tokyo_weather.csv",
                            fileEncoding="utf8"))
model1 <- 気温 ~ 日射量
model2 <- 気温 ~ 日射量 + 気圧
model3 <- 気温 ~ 日射量 + 気圧 + 雲量
est1 <- lm(model1, data=mydata, y=TRUE)
est2 <- lm(model2, data=mydata, y=TRUE)
est3 <- lm(model3, data=mydata, y=TRUE)
summary(est1)$adj.r.squared # 自由度調整済み決定係数
summary(est2)$adj.r.squared # 調整済み (est1より上昇)
summary(est3)$adj.r.squared # 調整済み (est2より上昇)
## 予測値と実測値の比較
if(Sys.info()["sysname"]=="Darwin") { # MacOSの場合
    par(family="HiraginoSans-W4")}    # 日本語フォント
with(est1, plot(y,fitted.values,
                col="orange",pch=17,   # 三角
                ylab="fitted values",ylim=range(y)))
abline(0,1,col="red",lwd=2)
with(est2, points(y,fitted.values,
                  col="green",pch=15)) # 四角
with(est3, points(y,fitted.values,
                  col="blue",pch=16))  # 丸
legend("bottomright",inset=.05, # 凡例の作成
       col=c("orange","green","blue"), pch=c(17,15,16), 
       legend=c("モデル1","モデル2","モデル3"))
