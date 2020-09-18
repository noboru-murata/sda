### 標準正規確率変数の二乗和の確率分布
set.seed(123) # 乱数の初期値を指定
n <- 10^5
k <- 4
y <- colSums(matrix(rnorm(n*k, 0,1)^2,k,n))
## 標準正規乱数をnk個発生し，k個の二乗和をn個作る．
if(Sys.info()["sysname"]=="Darwin") { # MacOSの場合
    par(family="HiraginoSans-W4")} # 日本語フォント
hist(y, freq=FALSE, # ヒストグラム(密度表示)
     breaks=50, xlim=c(0,20),
     col="lightblue", border="white", 
     main=paste0(k, "個の標準正規確率変数の二乗和")) 
curve(dchisq(x, df=k), add=TRUE, col="red", 
      lwd=3) # 理論上の確率密度関数
legend("topright", inset=.05, # 凡例を作成
       legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3) 
