### 関数pieによる円グラフの作図
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
z <- hist(kikou$日射量, breaks=5, plot=FALSE) # 5つ程度に分類
x <- z$count
y <- z$breaks
names(x) <- paste(y[-length(y)], y[-1], sep="-")
### 基本的な円グラフ
pie(x, col=gray(seq(0,1,length=length(x))))
### 向きと色を調整
pie(x, clockwise=TRUE, col=heat.colors(length(x)), main="2016年日射量")
