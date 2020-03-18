### 分散の比の検定 (F検定)
set.seed(123) # 乱数のシード値の設定
mu1 <- 5    # X/Yの平均
mu2 <- 8    # Yの平均
sigma1 <- 4 # X/Yの分散
sigma2 <- 2 # Yの分散
m <- 15     # Xのデータ数
n <- 20     # Yのデータ数
## 帰無仮説が正しい場合 (分散が等しい)
x <- rnorm(m, mean=mu1, sd=sigma1) 
y <- rnorm(n, mean=mu2, sd=sigma1) 
var.test(x, y)
## 帰無仮説が誤りの場合
x <- rnorm(m, mean=mu1, sd=sigma1) 
y <- rnorm(n, mean=mu2, sd=sigma2) 
var.test(x, y) 
## 実験を繰り返した場合の検定の棄却率の確認
mytest <- function(x, y){ 
  res <- var.test(x, y) 
  f.val <- res$statistic # 検定統計量の値
  p.val <- res$p.value # p値
  return(c(f.val, p=p.val))
}
## Monte-Carlo実験
mc <- 10000 # 実験回数
## 帰無仮説が正しい場合 (XとYの分散は等しい)
res1 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(m, mean=mu1, sd=sigma1),
                         rnorm(n, mean=mu2, sd=sigma1)))
))
mean(res1$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res1$p < 0.01) # 有意水準1%で棄却された実験の割合
## 帰無仮説が誤りの場合 (XとYの分散は異なる)
res2 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(m, mean=mu1, sd=sigma1),
                         rnorm(n, mean=mu2, sd=sigma2)))
))
mean(res2$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res2$p < 0.01) # 有意水準1%で棄却された実験の割合
## 検定統計量のヒストグラム
hist(res1$F, freq=FALSE, xlim=c(0, 15), breaks=20, border="blue",
     main="distribution of F statistics", xlab="F")
hist(res2$F, freq=FALSE, add=TRUE, border="red", breaks=40)
## 帰無分布の理論曲線
curve(df(x, df1=m-1, df2=n-1), add=TRUE)
## 棄却域の可視化(有意水準5%)
abline(v=c(qf(0.025, df1=m-1, df2=n-1), qf(0.975, df1=m-1, df2=n-1)),
       lty=3, lwd=2, col="green") 
## 棄却域の可視化(有意水準1%)
abline(v=c(qf(0.005, df1=m-1, df2=n-1), qf(0.995, df1=m-1, df2=n-1)),
       lty=3, lwd=2, col="darkgreen") 
### 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
x <- subset(kikou, 月==7, select=気温, drop=TRUE)
y <- subset(kikou, 月==8, select=気温, drop=TRUE)
z <- subset(kikou, 月==3, select=気温, drop=TRUE)
var.test(x, y) # 7月と8月の気温のばらつき具合は異なるか?
var.test(z, y, alternative="greater") # 8月より3月の気温のばらつきは大きいか?
