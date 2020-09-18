### 正規分布とカイ二乗分布を利用してt分布を生成
set.seed(11111) # 乱数の初期値の設定
n <- 10^5
k <- 7
y <- rchisq(n, df=k) # 自由度7のカイ2乗分布に従う乱数
z <- rnorm(n) # 標準正規乱数
if(Sys.info()["sysname"]=="Darwin") { # MacOSの場合
    par(family="HiraginoSans-W4")}    # 日本語フォント
hist(z/sqrt(y/k), freq=FALSE, # ヒストグラム(密度表示)
     xlim=c(-5,5), breaks=100, # ビンの数を指定
     border="white", col="lightblue", 
     main=bquote(paste(Z/sqrt(Y/k)," (" ,k==.(k),")"))) 
## bquoteは文字列・数式・Rオブジェクトを組み合わせた
## 文字列の作成が可能．".()" で数式とRオブジェクトを区別
curve(dt(x, df=k), # 理論上の確率密度関数
      add=TRUE, col="red", lwd=2) 
curve(dnorm, # 標準正規分布の密度(比較)
      add=TRUE, lwd=2, lty="dotted")    
legend("topleft", inset=.05, # 凡例を作成
       legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3) 
