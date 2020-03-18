### t分布
set.seed(6789) # 乱数のシード値を指定
rt(10, df=1) # 自由度1のt分布(10個)
## 0から大きく離れた値が現れている(裾が重い)
mean(rt(10000, df=1))
## 自由度1のt分布は平均が"ない"ため大数の法則が成立しない
## 統計的性質の確認
nu <- 4
x <- rt(10000, df=nu)
mean(x) # 0に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, breaks=50, freq=FALSE, # 密度表示
     col="gray", border="white", 
     main=paste0("t分布(自由度",nu,")")) 
curve(dt(x, df=nu), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=2) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
## 0から大きく離れた値が現れている(裾が重い)
