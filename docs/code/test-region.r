### 平均値の検定における両側・片側検定の検出力の比較
set.seed(123) # 乱数のシード値の設定
mytest <- function(x, mu0=0){ # 各種p値を計算する関数
  p1 <- t.test(x, mu=mu0)$p.value # 両側検定のp値
  p2 <- t.test(x, mu=mu0, alternative="greater")$p.value # 右側検定のp値
  p3 <- t.test(x, mu=mu0, alternative="less")$p.value # 左側検定のp値
  return(c(two=p1, right=p2, left=p3))
}
## Monte-Carlo実験
mu <- 0.5  # 平均
sigma <- 1 # 標準偏差
n <- 5     # データ数
mc <- 1000 # 実験回数
## 帰無仮説をmu0=0 として実験 (帰無仮説が誤りで棄却して欲しい場合)
result <- as.data.frame(t( 
    replicate(mc, mytest(rnorm(n, mean=mu, sd=sigma)))
))
alpha <- 0.05 # 有意水準
colMeans(result<alpha) # 各検定(両側，右側，左側)の棄却率=検出力
### データセットsleepによる例 (睡眠薬の効果)
plot(extra ~ group, data = sleep)
(x <- subset(sleep, group==1, extra, drop=TRUE)) # group 1の睡眠時間の伸び
(y <- subset(sleep, group==2, extra, drop=TRUE)) # group 2の睡眠時間の伸び
t.test(x, mu=0, alternative="greater")
t.test(y, mu=0, alternative="greater")
