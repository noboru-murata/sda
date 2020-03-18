### 指数分布
set.seed(2345) # 乱数のシード値を指定
rexp(10) # レート1の指数分布(10個)
## 統計的性質の確認
lambda <- 0.5
x <- rexp(10000, rate=lambda) 
mean(x) # 1/lambda=2に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, breaks=50, freq=FALSE, 
     col="gray", border="white", # 密度表示
     main=paste0("指数分布(パラメータ",lambda,")")) 
curve(dexp(x, lambda), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=3) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
