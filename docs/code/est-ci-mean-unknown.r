### 分散未知における平均の区間推定
## 正規標本から標本平均・標準偏差と平均の100(1-alpha)%信頼区間の
## 上端・下端を計算する関数の作成
myest <- function(x, alpha=0.05){
    n <- length(x)  # データ数
    xbar <- mean(x) # 標本平均
    s <- sd(x)      # 標本標準偏差(不偏分散の平方根)
    ui <- xbar + qt(1-alpha/2, df=n-1)*s/sqrt(n) # 上側信頼限界
    li <- xbar - qt(1-alpha/2, df=n-1)*s/sqrt(n) # 下側信頼限界
    return(c(xbar=xbar, s=s, ui=ui, li=li))
}
## Monte-Carlo実験
set.seed(111) # 乱数のシード値の設定
mu <- 10    # 平均
sigma <- 5  # 標準偏差
n <- 10     # データ数
mc <- 10000 # シミュレーション回数
result <- as.data.frame(t(
    replicate(mc, myest(rnorm(n, mean=mu, sd=sigma)))
))
## sqrt(n)*(xbar-mu)/sが自由度n-1のt分布に従うことの確認
hist(sqrt(n)*(result$xbar-mu)/result$s, freq=FALSE, 
     col="lightblue", breaks=20, 
     xlab=expression(sqrt(n)*(bar(X)-mu)/s),
     main=expression(paste("Histogram of ", sqrt(n)*(bar(X)-mu)/s)))
curve(dt(x, df=9), add=TRUE, col="red", lwd=2)
## 真の平均muが95%信頼区間に含まれている割合が約95%であることの確認
with(result,sum((mu<=ui & mu>=li)))/mc
## はじめの20個の信頼区間の可視化
library(plotrix)
with(result, # 信頼区間と標本平均の図示
     plotCI(1:20, xbar[1:20], ui=ui[1:20], li=li[1:20],
            pch=4, axes=FALSE, xlab="", ylab=expression(mu), lwd=2)) 
axis(1, 1:20, 1:20) # x軸の追加
axis(2) # y軸の追加
abline(h=mu, col="red", lty="dashed", lwd=2) # 真の平均の図示
