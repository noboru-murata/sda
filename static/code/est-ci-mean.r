### 分散既知における平均の区間推定
## 正規標本から標本平均と平均の100(1-alpha)%信頼区間の上端・下端を
## 計算する関数の作成
myest <- function(x, sigma, alpha=0.05){
    n <- length(x)  # データ数
    xbar <- mean(x) # 標本平均
    ui <- xbar + qnorm(1-alpha/2)*sigma/sqrt(n) # 上側信頼限界
    li <- xbar - qnorm(1-alpha/2)*sigma/sqrt(n) # 下側信頼限界
    return(c(xbar=xbar, ui=ui, li=li))
}
## Monte-Carlo実験
set.seed(111) # 乱数のシード値の指定
mu <- 10    # 平均
sigma <- 5  # 標準偏差
n <- 10     # データ数
mc <- 10000 # シミュレーション回数
result <- as.data.frame(t(
    replicate(mc, myest(rnorm(n, mean=mu, sd=sigma),sigma))
))
## sqrt(n)*(xbar-mu)/sigmaが標準正規分布に従うことの確認
hist(sqrt(n)*(result$xbar-mu)/sigma, freq=FALSE, 
     col="lightblue", xlab=expression(sqrt(n)*(bar(X)-mu)/sigma),
     main=expression(paste("Histogram of ", sqrt(n)*(bar(X)-mu)/sigma)))
curve(dnorm, add=TRUE, col="red", lwd=2)
## 真の平均muが95%信頼区間に含まれている割合が約95%であることの確認
with(result,sum((mu<=ui & mu>=li)))/mc
## はじめの20個の信頼区間の可視化 (plotrixパッケージを利用)
if(!require(plotrix)) { # パッケージの読み込み
    install.packages("plotrix") 
    library(plotrix)
}
with(result, # 信頼区間と標本平均の図示
     plotCI(1:20, xbar[1:20], ui=ui[1:20], li=li[1:20],
            pch=4, axes=FALSE, xlab="", ylab=expression(mu), lwd=2)) 
axis(1, 1:20, 1:20) # x軸の追加
axis(2) # y軸の追加
abline(h=mu, col="red", lty="dashed", lwd=2) # 真の平均の図示
