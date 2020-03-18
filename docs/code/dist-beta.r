### ベータ分布
set.seed(123) # 乱数の初期値を指定
rbeta(10, 0.5, 0.5) # パラメーター0.5,0.5のベータ分布に従う乱数を10個発生
## 統計的性質の確認
a <- 3
b <- 2
x <- rbeta(10000, a, b) # パラメーターa,bのベータ乱数を10000個発生
mean(x) # a/(a+b)=0.6に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=50, col="gray", border="white", 
     main=bquote(paste("ベータ分布 ", B[E](.(a), .(b))))) # ヒストグラム(密度表示)
curve(dbeta(x, a, b), add=TRUE, col="red", lwd=3) # 理論上の確率密度関数
legend(0.1, 2, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
