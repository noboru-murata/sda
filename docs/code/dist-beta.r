### ベータ分布
set.seed(5678) # 乱数の初期値を指定
rbeta(10,0.5,0.5) # パラメータ0.5,0.5のベータ分布(10個)
## 統計的性質の確認
a <- 3
b <- 2
x <- rbeta(10000, a, b)
mean(x) # a/(a+b)=0.6に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, breaks=50, freq=FALSE, # 密度表示
     col="gray", border="white", 
     main=bquote(paste("ベータ分布",B[E](.(a),.(b))))) 
curve(dbeta(x, a, b), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=3) 
legend("topleft", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
