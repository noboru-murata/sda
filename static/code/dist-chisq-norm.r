### χ2分布の特徴付け: 標準正規確率変数の二乗和
set.seed(123) # 乱数の初期値を指定
n <- 30000
k <- 4
y <- colSums(matrix(rnorm(n*k, 0,1)^2,k,n))
# 標準正規分布に従う乱数をnk個発生し，k個の２乗和をn個作る．
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(y, freq=FALSE, breaks=40, col="lightblue", xlim=c(0,20),
     border="white", 
     main=paste0(k, "個の標準正規確率変数の二乗和")) # ヒストグラム(密度表示)
curve(dchisq(x, df=k), add=TRUE, xlim=c(0,20),
      col="red", lwd=3) # 理論上の確率密度関数
legend(15, 0.16, legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3) # 凡例を作成
