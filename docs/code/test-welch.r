### 平均の差の検定 (一般の場合; Welthのt検定) 
set.seed(123) # 乱数のシード値の設定
mu1 <- 5    # X/Yの平均
mu2 <- 7.5  # Yの平均
sigma1 <- 1 # Xの分散
sigma2 <- 2 # Yの分散
m <- 8      # Xのデータ数
n <- 12     # Yのデータ数
## 帰無仮説が正しい場合 (平均が等しい)
x <- rnorm(m, mean=mu1, sd=sigma1) 
y <- rnorm(n, mean=mu1, sd=sigma2) 
t.test(x, y) # Welchのt検定を実行
## 帰無仮説が誤りの場合 (平均が異なる)
x <- rnorm(m, mean=mu1, sd=sigma1) 
y <- rnorm(n, mean=mu2, sd=sigma2) 
t.test(x, y) # Welchのt検定を実行
## 実験を繰り返した場合の検定の棄却率の確認
mytest <- function(x, y){ 
  res <- t.test(x, y)    # Welchのt検定を実行
  t.val <- res$statistic # 検定統計量の値
  p.val <- res$p.value   # p値
  return(c(t.val, p=p.val))
}
## Monte-Carlo実験
mc <- 10000 # 実験回数
## 帰無仮説が正しい場合 (XとYの平均は等しい)
res1 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(m, mean=mu1, sd=sigma1),
                         rnorm(n, mean=mu1, sd=sigma2)))
))
mean(res1$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res1$p < 0.01) # 有意水準1%で棄却された実験の割合
## 帰無仮説が誤りの場合 (XとYの平均は異なる)
res2 <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(m, mean=mu1, sd=sigma1),
                         rnorm(n, mean=mu2, sd=sigma2)))
))
mean(res2$p < 0.05) # 有意水準5%で棄却された実験の割合
mean(res2$p < 0.01) # 有意水準1%で棄却された実験の割合
## 検定統計量のヒストグラム
hist(res1$t, freq=FALSE, xlim=c(-12, 5), breaks=20, border="blue",
     main="distribution of t statistics", xlab="t")
hist(res2$t, freq=FALSE, add=TRUE, breaks=20, border="red")
## 帰無分布の理論曲線(自由度は理論値を使う)
a <- sigma1^2/m
b <- sigma2^2/n
nu <- (a+b)^2/(a^2/(m-1)+b^2/(n-1)) # 自由度の理論値
curve(dt(x, df=nu), add=TRUE)
## 棄却域の可視化(有意水準5%, 自由度は理論値を使う)
abline(v=c(-qt(0.975, df=nu),qt(0.975, df=nu)),
       lty=3, lwd=2, col="green") 
## 棄却域の可視化(有意水準1%, 自由度は理論値を使う)
abline(v=c(-qt(0.995, df=nu),qt(0.995, df=nu)),
       lty=3, lwd=2, col="darkgreen") 
### 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
x <- subset(kikou, 月==1, select=気温, drop=TRUE)
y <- subset(kikou, 月==2, select=気温, drop=TRUE)
z <- subset(kikou, 月==8, select=気温, drop=TRUE)
t.test(x, y, alternative="less") # 2月より1月の方が平均気温は低いか?
t.test(x, z, alternative="less") # 8月より1月の方が平均気温は低いか?
