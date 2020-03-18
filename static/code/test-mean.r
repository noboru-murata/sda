### 平均値の検定 (Studentのt検定)
set.seed(123) # 乱数のシード値の設定
mu <- 10   # 平均
sigma <- 5 # 標準偏差
n <- 10    # データ数
x <- rnorm(n, mean=mu, sd=sigma) # 正規乱数の生成
t.test(x, mu=mu) # mu0=muとして検定を実行(帰無仮説は正しい)
t.test(x)        # mu0=0 として検定を実行(帰無仮説は誤り)
## 実験を繰り返した場合の検定の棄却率の確認
mytest <- function(x, mu0=0){ # 検定統計量の値とp値を計算する関数
  res <- t.test(x, mu=mu0) # t検定の実行
  t.val <- res$statistic   # 検定統計量の値
  p.val <- res$p.value     # p値
  return(c(t.val, p=p.val))
}
## Monte-Carlo実験
mc <- 10000 # 実験回数
## 帰無仮説が正しい場合 (mu0=muとして実験)
res1 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(n, mean=mu, sd=sigma),mu0=mu))
))
head(res1)
mean(res1$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res1$p < 0.01) # 有意水準1%で棄却された実験の割合
## 帰無仮説が誤りの場合 (mu0=0として実験)
res2 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(n, mean=mu, sd=sigma)))
))
mean(res2$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res2$p < 0.01) # 有意水準1%で棄却された実験の割合
## 検定統計量のヒストグラム
hist(res1$t, freq=FALSE, xlim=c(-5, 15), breaks=20, border="blue",
     main="distribution of t statistics", xlab="t")
hist(res2$t, freq=FALSE, add=TRUE, breaks=30, border="red")
## 帰無分布の理論曲線
curve(dt(x, df=9), add=TRUE)
## 棄却域の可視化(有意水準5%)
abline(v=c(-qt(0.975, df=9),qt(0.975, df=9)),
       lty=3, lwd=2, col="green") 
## 棄却域の可視化(有意水準1%)
abline(v=c(-qt(0.995, df=9),qt(0.995, df=9)),
       lty=3, lwd=2, col="darkgreen") 
