### 歪度と尖度の計算
if(!require(e1071)) { # パッケージの読み込み
    install.packages("e1071") 
    library(e1071)
}
set.seed(123) 
## 正規分布による例
x <- rnorm(10000) # 標準正規乱数を10000個発生
skewness(x) # 歪度：0に近い
kurtosis(x) # (超過)尖度：0に近い
## t分布による例
y <- rt(10000, df=8) # 自由度8のt乱数を10000個発生
skewness(y) # 歪度：0に近い
kurtosis(y) # (超過)尖度：6/(8-4)=1.5に近い
## グラフで確認してみる
plot(dnorm, -4 ,4 , lwd=2, ylab="") # 標準正規密度
curve(dt(x, df = 8), add=TRUE, lwd=2, col="red") # 自由度8のt分布の密度
legend("topright", inset=1/20, legend=c("N(0,1)","t(8)"),
       lwd=2, col=c("black", "red")) # 凡例の追加
z <- rchisq(10000, df=4) # 自由度4のカイ二乗乱数を10000個発生
mean(z)     # 平均： 4(自由度)に近い
skewness(z) # 歪度：sqrt(8/4)=1.414...に近い
kurtosis(z) # (超過)尖度：12/4=3に近い
## グラフで確認してみる
curve(dchisq(x,df=4), 0, 15, lwd=2, ylab="") # 自由度4のカイ二乗分布の密度
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis") # データの読み込み
dat <- subset(kikou, select=-c(月, 日)) # 月日は計算対象から削除
apply(dat, 2, "skewness") # 歪度
apply(dat, 2, "kurtosis") # (超過)尖度
# ヒストグラムによる確認
par(family = "HiraginoSans-W4") # 日本語フォントの指定
myCol <- c("green", "blue", "orange", "lightblue") # 色を用意
for(i in 1:4){
  hist(dat[ ,i], col=myCol[i], breaks=20, xlab="", 
       main=paste0(names(dat)[i], "のヒストグラム"))
}
