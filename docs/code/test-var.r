### 分散の検定
set.seed(123) # 乱数のシード値の設定
mu <- 5    # 真の平均
sigma <- 3 # 真の分散
n <- 10    # データ数
x <- rnorm(n, mean=mu, sd=sigma) # 正規乱数の生成
## 帰無仮説が正しい場合(両側検定)
sigma0 <- sigma
chi2 <- (n-1)*var(x)/sigma0^2 # 検定統計量
p0 <- pchisq(chi2, df=n-1)
2*min(p0, 1-p0) # p値
## 帰無仮説が誤っている場合(両側検定)
sigma0 <- 2
chi2 <- (n-1)*var(x)/sigma0^2 # 検定統計量
p0 <- pchisq(chi2, df=n-1)
2*min(p0, 1-p0) # p値
## 実験を繰り返した場合の検定の棄却率の確認
mytest <- function(x, sigma0){ # 検定統計量の値とp値を計算する関数
  chi2.val <- (n-1)*var(x)/sigma0^2 # 検定統計量
  p0 <- pchisq(chi2.val, df=n-1)
  p.val <- 2*min(p0, 1-p0) # p値
  return(c(chisq=chi2.val, p=p.val))
}
## Monte-Carlo実験
mc <- 10000 # 実験回数
## 帰無仮説が正しい場合 (sigma0=sigmaとして実験)
res1 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(n, mean=mu, sd=sigma),sigma0=sigma))
))
mean(res1$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res1$p < 0.01) # 有意水準1%で棄却された実験の割合
## 帰無仮説が誤りの場合 (sigma0=2として実験)
res2 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(n, mean=mu, sd=sigma),sigma0=2))
))
mean(res2$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res2$p < 0.01) # 有意水準1%で棄却された実験の割合
## 検定統計量のヒストグラム
hist(res1$chisq, freq=FALSE, xlim=c(0, 50), breaks=20, border="blue", 
     main=expression(paste("distribution of ", chi^2, " statistics")), 
     xlab=expression(chi^2))
hist(res2$chisq, freq=FALSE, add=TRUE, breaks=30, border="red")
## 帰無分布の理論曲線
curve(dchisq(x, df=9), add=TRUE)
## 棄却域の可視化(有意水準5%)
abline(v=c(qchisq(0.025, df=9),qchisq(0.975, df=9)),
       lty=3, lwd=2, col="green") 
## 棄却域の可視化(有意水準1%)
abline(v=c(qchisq(0.005, df=9),qchisq(0.995, df=9)),
       lty=3, lwd=2, col="darkgreen") 
