### 指数分布
set.seed(20) # 乱数の初期値を指定
rexp(10) # レート1の指数分布に従う乱数を10個発生
## 統計的性質の確認
lambda <- 0.5
x <- rexp(10000, rate=lambda) # レート0.5の指数乱数を10000個発生
mean(x) # 1/lambda=2に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=50, col="gray", border="white", 
     main=paste0("指数分布(パラメーター", lambda, ")")) # ヒストグラム(密度表示)
curve(dexp(x, lambda), add=TRUE, col="red", lwd=3) # 理論上の確率密度関数
legend(5, 0.4, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
