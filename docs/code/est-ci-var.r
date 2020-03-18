### 分散の区間推定
## 正規標本から不偏分散と分散の100(1-alpha)%信頼区間の
## 上端・下端を計算する関数の作成
myest <- function(x, alpha=0.05){
    n <- length(x)
    s2 <- var(x) # 不偏分散
    ui <- (n-1) * s2/qchisq(alpha/2, df=n - 1) # 上側信頼限界
    li <- (n-1) * s2/qchisq(1-alpha/2, df=n - 1) # 下側信頼限界
    return(c(s2=s2, ui=ui, li=li))
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
## (n-1)*s^2/sigma^2が自由度n-1のカイ二乗分布に従うことの確認
hist((n-1)*result$s2/sigma^2, freq=FALSE, col="lightblue", 
     breaks=20, xlab=expression((n-1)*s^2/sigma^2),
     main=expression(paste("Histogram of ", (n-1)*s^2/sigma^2)))
curve(dchisq(x, df=9), add=TRUE, col="red", lwd=2)
## 真の分散sigma^2が95%信頼区間に含まれている割合が約95%であることの確認
with(result,sum((sigma^2<=ui & sigma^2>=li)))/mc
## はじめの20個の信頼区間の可視化
library(plotrix)
with(result, # 信頼区間と不偏分散の図示
     plotCI(1:20, s2[1:20], ui=ui[1:20], li=li[1:20],
            pch=4, axes=FALSE, xlab="", ylab=expression(sigma^2), lwd=2)) 
axis(1, 1:20, 1:20) # x軸の追加
axis(2) # y軸の追加
abline(h=sigma^2, col="red", lty="dashed", lwd=2) # 真の分散の図示
