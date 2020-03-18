### t分布の特徴付け: 正規分布とカイ二乗分布から生成
set.seed(7890)
k <- 7
y <- rchisq(10000, df=k) # 自由度7のカイ2乗分布
z <- rnorm(10000) # 標準正規乱数
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(z/sqrt(y/k), breaks=50, freq=FALSE, # 密度表示
     col="lightblue", border="white",  
     main=bquote(paste(Z/sqrt(Y/k)," (",k==.(k),")")))
curve(dt(x, df=k), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=2) 
legend("topleft", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3) 
