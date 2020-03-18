### ガンマ分布
set.seed(123) # 乱数の初期値を指定
rgamma(10, shape=3, rate=1) # ガンマ分布に従う乱数を10個発生
## 統計的性質の確認
nu <- 4
alpha <- 2
x <- rgamma(10000, shape=nu, rate=alpha)　# ガンマ乱数を10000個発生
mean(x) # nu/alpha=2 に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=50, col="gray", border="white", 
     main=bquote(paste("ガンマ分布 ", Gamma(.(nu), .(alpha))))) # ヒストグラム(密度表示)
curve(dgamma(x, shape=nu, rate=alpha), add=TRUE, 
      col="red", lwd=3) # 理論上の確率密度関数
legend(5, 0.4, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
