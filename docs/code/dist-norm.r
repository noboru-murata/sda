### 正規分布
set.seed(678) # 乱数のシード値を指定
rnorm(10) # 標準正規乱数(10個)
## 統計的性質の確認
mu <- 10
sigma <- 2
x <- rnorm(10000, mean=mu, sd=sigma)
mean(x) # mu=10に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, # 密度表示
     breaks=25, col="gray", border="white", 
     main=paste0("正規分布(平均",mu,
                 ", 分散",sigma^2,")")) 
curve(dnorm(x, mean=mu, sd=sigma), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=3) 
legend("topleft", inset=0.05,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) 
