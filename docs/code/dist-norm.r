### 正規分布
set.seed(20) # 乱数の初期値を指定
rnorm(10) # 標準正規乱数を10個発生
## 統計的性質の確認
mu <- 10
sigma <- 2
x <- rnorm(10000, mean=mu, sd=sigma)
mean(x) # mu=10に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=25, col="gray", border="white", 
     main=paste0("正規分布(平均", mu, ", 分散", sigma^2, ")")) # ヒストグラム(密度表示)
curve(dnorm(x, mean=mu, sd=sigma), add=TRUE, 
      col="red", lwd=3) # 理論上の確率密度関数
legend(3, 0.2, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
