### F分布
set.seed(8901) # 乱数のシード値を指定
rf(10, df1=4, df2=7) # 自由度4,7のF分布(10個)
## 統計的性質の確認
nu1 <- 7
nu2 <- 12
x <- rf(10000, df1=nu1, df2=nu2)
mean(x) # nu2/(nu2-2)=1.2に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, breaks=50, freq=FALSE, # 密度表示
     col="gray", border="white", 
     main=paste0("F分布(自由度",nu1,",",nu2,")")) 
curve(df(x, df1=nu1, df2=nu2), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=2) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
