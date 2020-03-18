### χ2分布の特徴付け: 標準正規確率変数の二乗和
set.seed(4567) # 乱数のシード値を指定
n <- 30000
k <- 4
y <- colSums(matrix(rnorm(n*k, 0,1)^2,k,n))
## 標準正規乱数をnk個発生し，k個の２乗和をn個作る
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(y, breaks=40, xlim=c(0,20), freq=FALSE, # 密度表示
     col="lightblue", border="white", 
     main=paste0(k, "個の標準正規確率変数の二乗和")) 
curve(dchisq(x, df=k), # 確率密度関数(理論)
      xlim=c(0,20), add=TRUE, col="red", lwd=3) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3)
