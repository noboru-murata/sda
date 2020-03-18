### 標本平均が一様最小分散不偏推定量であることの確認
set.seed(123) # 乱数のシード値を指定
mu <- 10
sigma <- 5
## 平均値の推定を行う関数(標本平均，x1，メディアン)
mean.est <- function(n, mu, sigma){
  x <- rnorm(n, mean=mu, sd=sigma)
  return(c(xbar=mean(x), x1=x[1], med=median(x)))
}
## Monte-Carlo実験
n <- 10 # サンプル数
mc <- 30000 # 実験回数
mu.hats <- as.data.frame(t( # mc行 x 3種の推定量
    replicate(mc, mean.est(n, mu, sigma))
))
head(mu.hats) # 実験結果の表示
apply(mu.hats,2,mean) # 推定値の平均 (colMeans(mu.hats)も可)
apply(mu.hats,2,var)  # 推定値の分散
sigma^2/n             # Cramer-Rao下界
