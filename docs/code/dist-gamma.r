### ガンマ分布
set.seed(1234) # 乱数のシード値を指定
rgamma(10, shape=3, rate=1) # ガンマ分布(10個)
## 統計的性質の確認
nu <- 4
alpha <- 2
x <- rgamma(10000, shape=nu, rate=alpha)
mean(x) # nu/alpha=2 に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, breaks=50, freq=FALSE, # 密度表示
     col="gray", border="white",  
     main=bquote(paste("ガンマ分布 ",
                       Gamma(.(nu), .(alpha))))) 
curve(dgamma(x,shape=nu,rate=alpha), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=3) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
