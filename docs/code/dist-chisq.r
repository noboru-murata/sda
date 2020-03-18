### χ2分布
set.seed(3456) # 乱数のシード値を指定
rchisq(10, df=1) # 自由度1のカイ二乗分布(10個)
## 統計的性質の確認
k <- 4 # 自由度
x <- rchisq(10000, df=k) 
mean(x) # k=4に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, breaks=50, freq=FALSE, # 密度表示
     col="gray", border="white", 
     main=bquote(paste(chi^2,"分布(自由度",.(k),")"))) 
curve(dchisq(x, k), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=3) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
