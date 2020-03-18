### 平均の差の検定 (等分散の場合)
set.seed(123) # 乱数のシード値の設定
mu1 <- 5   # X/Yの平均
mu2 <- 7.5 # Yの平均
sigma <- 1 # 分散
m <- 8     # Xのデータ数
n <- 12    # Yのデータ数
## 帰無仮説が正しい場合 (平均が等しい)
x <- rnorm(m, mean=mu1, sd=sigma) 
y <- rnorm(n, mean=mu1, sd=sigma) 
t.test(x, y, var.equal=TRUE) # 等分散を仮定してt検定を実行
## 帰無仮説が誤りの場合 (平均が異なる)
x <- rnorm(m, mean=mu1, sd=sigma) 
y <- rnorm(n, mean=mu2, sd=sigma) 
t.test(x, y, var.equal=TRUE) # 等分散を仮定してt検定を実行
## 実験を繰り返した場合の検定の棄却率の確認
mytest <- function(x, y){ 
  res <- t.test(x, y, var.equal=TRUE) # 等分散を仮定してt検定を実行
  t.val <- res$statistic # 検定統計量の値
  p.val <- res$p.value   # p値
  return(c(t.val, p=p.val))
}
## Monte-Carlo実験
mc <- 10000 # 実験回数
## 帰無仮説が正しい場合 (XとYの平均は等しい)
res1 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(m, mean=mu1, sd=sigma),
                         rnorm(n, mean=mu1, sd=sigma)))
))
mean(res1$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res1$p < 0.01) # 有意水準1%で棄却された実験の割合
## 帰無仮説が誤りの場合 (XとYの平均は異なる)
res2 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(m, mean=mu1, sd=sigma),
                         rnorm(n, mean=mu2, sd=sigma)))
))
mean(res2$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res2$p < 0.01) # 有意水準1%で棄却された実験の割合
## 検定統計量のヒストグラム
hist(res1$t, freq=FALSE, xlim=c(-12, 5), breaks=20, border="blue",
     main="distribution of t statistics", xlab="t")
hist(res2$t, freq=FALSE, add=TRUE, breaks=20, border="red")
## 帰無分布の理論曲線
curve(dt(x, df=m+n-2), add=TRUE)
## 棄却域の可視化(有意水準5%)
abline(v=c(-qt(0.975, df=m+n-2),qt(0.975, df=m+n-2)),
       lty=3, lwd=2, col="green") 
## 棄却域の可視化(有意水準1%)
abline(v=c(-qt(0.995, df=m+n-2),qt(0.995, df=m+n-2)),
       lty=3, lwd=2, col="darkgreen") 
