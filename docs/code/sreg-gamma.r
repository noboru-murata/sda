### ガンマ分布に従う乱数の生成
set.seed(123) # 乱数の初期値を指定
rgamma(10, # ガンマ分布に従う乱数を10個発生
       shape=3, rate=1) 
## 統計的性質
nu <- 4
alpha <- 2
x <- rgamma(10^5, # ガンマ乱数を10000個発生
            shape=nu, rate=alpha)　
mean(x) # nu/alpha=2 に近い(大数の法則)
## データのヒストグラム(密度表示)
if(Sys.info()["sysname"]=="Darwin") { # MacOSの場合
    par(family="HiraginoSans-W4")}    # 日本語フォント
hist(x, freq=FALSE, breaks=50,
     border="white", col="lightblue", 
     main=bquote(paste("ガンマ分布 ",
                       Gamma(.(nu),.(alpha))))) 
curve(dgamma(x, shape=nu, rate=alpha), add=TRUE, 
      col="red", lwd=3) # 理論上の確率密度関数
legend("topright", inset=.05, # 凡例を作成
       legend=c("観測値", "理論値"), 
       col=c("lightblue", "red"), lwd=3) 
