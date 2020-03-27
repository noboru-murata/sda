### 歪度と尖度の計算
library(e1071) # パッケージの読み込み

set.seed(1234) # 乱数のシード値を指定
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
curve(dt(x, df = 8), # 自由度8のt分布の密度
      add=TRUE, lwd=2, col="red") 
legend("topright", inset=1/20,
       legend=c("N(0,1)","t(8)"),
       lwd=2, col=c("black", "red")) 
z <- rchisq(10000, df=4) # 自由度4のカイ二乗乱数
mean(z)     # 平均： 4(自由度)に近い
skewness(z) # 歪度：sqrt(8/4)=1.414...に近い
kurtosis(z) # (超過)尖度：12/4=3に近い
## グラフで確認してみる
curve(dchisq(x,df=4), # 自由度4のカイ二乗分布の密度
      0, 15, lwd=2, ylab="") 
## 気候データによる例
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(気温,降水量,日射量,風速))
apply(myData, 2, "skewness") # 歪度
apply(myData, 2, "kurtosis") # (超過)尖度
# ヒストグラムによる確認
par(family = "HiraginoSans-W4") # 日本語フォントの指定
myColor <- c("green", "blue", "orange", "lightblue") 
for(i in 1:4){
    hist(myData[ ,i], col=myColor[i], breaks=20, xlab="", 
         main=paste0(names(myData)[i], "のヒストグラム"))
}
