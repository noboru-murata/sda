### 回帰式の推定の例 (関数lm()の使い方)

### 人工データによる単回帰分析
### モデル: y = -1 + 2x
## 人工データの生成
set.seed(123) # 乱数のシード値の設定 (同じ乱数系列を用いて再現する)
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数の観測データ
e <- rnorm(length(x))                 # 誤差項
y <- -1 + 2 * x + e                   # 目的変数の観測データ
plot(x, y, col="blue")                # 散布図
## 単回帰分析
(est <- lm(y ~ x)) # 回帰式の推定
## 散布図と回帰直線の描画
abline(est, col="red", lwd=2)  # 回帰式 (y=b[1]+b[2]*x) の描画 
abline(c(-1,2), col="orange", lwd=1) # 真の回帰式の描画 

### 東京都の気候による重回帰分析
### モデル: 8月の"気温"を目的変数，"日射量・気圧"を説明変数とする
rawdata <- read.csv("tokyo-weather.csv",fileEncoding="utf8")
model <- 気温 ~ 日射量 + 気圧        # モデルの定義 
## class(model) # モデルは formula class
(est <- lm(model, data=subset(rawdata,月==8))) # 回帰係数の推定
## (est <- lm(formula = 気温 ~ 風速 + 日射量, data=rawdata))
mydata <- model.frame(est) # 推定に用いたデータフレームの抽出
par(family="HiraginoSans-W4") # 日本語フォントの指定 (MacOSXの例)
plot(mydata, col="blue")   # 散布図
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
