### さまざまなグラフ
## 例として東京都の気候データを使う
mydata <- read.csv("tokyo-weather.csv",fileEncoding="utf8")
par(family="HiraginoSans-W4") # 日本語フォントの指定 (MacOSXの例)

### 関数histによるヒストグラムの作図
hist(mydata$気温)
## ビンの数を指定
hist(mydata$気温, 
     breaks=25,   # ビンの数を約25に設定
     labels=TRUE, # 各ビンの度数を表示
     col="green", # ヒストグラムの中の色
     main="東京都の気温",xlab="気温", ylab="頻度") 
## 密度での表示
hist(mydata$風速,
     freq=FALSE, # 全体に対する割合(密度)で表示
     breaks=25, 
     col="lightblue", border="cyan", # 長方形の境界の色
     main="東京都の風速",xlab="風速", ylab="密度") 

### 関数boxplotによる箱ひげ図の作図
boxplot(mydata[ ,-(1:3)]) # 月日は除く
## 月ごとに気温を分類
boxplot(気温 ~ 月, data=mydata,
        col="orange", main="月ごとの気温")
## 図を回転
boxplot(気温 ~ 月, data=mydata, horizontal=TRUE,
        col="purple", main="月ごとの気温")
## histとboxplotの関係
idx <- 4 # 気温
qnt <- quantile(mydata[,idx]) # 四分位点
iqr <- IQR(mydata[,idx]) # 四分位範囲
rng <- c(qnt[2]-1.5*iqr,qnt[4]+1.5*iqr) # 外れ値の範囲
hist(mydata[,idx],breaks=20,main=names(mydata)[idx])
abline(v=qnt,col="red",lwd=2) # 四分位点
abline(v=rng,col="blue",lwd=2)
boxplot(mydata[,idx],horizontal=TRUE)
abline(v=qnt,col="red",lwd=2)
abline(v=rng,col="blue",lwd=2)
idx <- 8 # 気圧
qnt <- quantile(mydata[,idx]) # 四分位点
iqr <- IQR(mydata[,idx]) # 四分位範囲
rng <- c(qnt[2]-1.5*iqr,qnt[4]+1.5*iqr) # 外れ値の範囲
hist(mydata[,idx],breaks=20,main=names(mydata)[idx])
abline(v=qnt,col="red",lwd=2) # 四分位点
abline(v=rng,col="blue",lwd=2)
boxplot(mydata[,idx],horizontal=TRUE)
abline(v=qnt,col="red",lwd=2)
abline(v=rng,col="blue",lwd=2)

### 関数barplotによる棒グラフの作図
## 月ごとに各変数の平均を計算
(x <- aggregate(. ~ 月,
                data=subset(mydata,select=-c(年,日)),
                FUN=mean))
## 基本的な棒グラフ
barplot(x[,3],            # 棒の高さのベクトル
        col="slateblue",  # 棒の色の指定
        names.arg=x[,1],  # x軸のラベル
        main=names(x)[3]) # タイトル
## 色の異なる棒グラフ
mycol <- rainbow(12)[c(8:1,12:9)] # 寒暖に合わせて12色作成
barplot(1:12, # 1-12に対応するmycolの色を表示
        col=mycol) 
## 複数の棒グラフ
barplot(as.matrix(x[ ,3:5]),           # 行列 (縦横に注意) 
        col=mycol,                     # 作成した月ごとの色を利用
        beside=TRUE,                   # 棒グラフを横に並べる
        space=c(.3,3),                 # 棒グラフ・変数間のスペースを指定
        legend.text=paste0(x[,1],"月"), # 凡例の指定
        args.legend=list(ncol=2))      # 凡例を2列にして表示

### 関数pieによる円グラフの作図
z <- hist(mydata$日射量, breaks=5, plot=FALSE) # 5つ程度に分類
x <- z$count  # 各ビンの値
y <- z$breaks # ビンの区画
names(x) <- paste(y[-length(y)], y[-1], sep="-") # 区画の名称
print(x) # データをどのように整理したのか表示
## 基本的な円グラフ
pie(x,
    col=gray(seq(0,1,length=length(x))))
## 向きと色を調整
pie(x, clockwise=TRUE,
    col=heat.colors(length(x)),
    main="東京都の日射量")

### 関数pairsによる散布図の作図
pairs(mydata[,-(1:3)], col="blue")
## plot(mydata[,-(1:3)], col="blue") # plotでも同じ
## 表示する項目を指定
pairs(~ 気温 + 日射量 + 風速, data=mydata,
      col=mycol[mydata$月]) # 作成した色を利用して月毎に異なる色で表示
with(mydata, # 上と同じ
     pairs(~ 気温 + 日射量 + 風速, col=mycol[月])) 

### 関数perspによる2変数関数の俯瞰図
f <- function(x,y) x^2 - y^2 # 表示する関数の定義
x <- seq(-3, 3, length=51)   # x座標の定義域の分割
y <- seq(-3, 3, length=51)   # y座標の定義域の分割
z <- outer(x, y, f)          # z座標の計算
## 基本的な俯瞰図
persp(x, y, z, col="lightblue")
## 俯瞰する向きを指定
persp(x, y, z, theta=30, phi=30, expand=0.5, col="royalblue",
      main = expression(z==x^2-y^2))
## 3次元散布図(パッケージscatterplot3dを利用)
## install.packages("scatterplot3d") # 初めて使う時に必要
require(scatterplot3d) # パッケージのロード
xyz <- subset(mydata, select=c("風速", "日射量", "気温"))
scatterplot3d(xyz, pch=4, color="orchid")
