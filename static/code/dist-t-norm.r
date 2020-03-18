### t分布の特徴付け: 正規分布とカイ二乗分布から生成
set.seed(11111)
k <- 7
y <- rchisq(10000, df=k) # 自由度7のカイ2乗分布に従う乱数
z <- rnorm(10000) # 標準正規乱数
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(z/sqrt(y/k), freq=FALSE, breaks=50, col="lightblue", 
     border="white", 
     main=bquote(paste(Z/sqrt(Y/k)," (" , k==.(k), ")"))) # ヒストグラム(密度表示)
curve(dt(x, df=k), add=TRUE, col="red", lwd=2) # 理論上の確率密度関数
legend(-6, 0.3, legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3) # 凡例を作成
