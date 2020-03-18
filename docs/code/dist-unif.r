### 一様分布
set.seed(567) # 乱数のシード値を指定
runif(10) # 区間(0,1)上の一様乱数(10個)
## 統計的性質の確認
a <- -1
b <- 2
x <- runif(10000, min=a, max=b)
mean(x) # (a+b)/2=0.5に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, ylim=c(0,0.5), freq=FALSE, # 密度表示
     breaks=25, col="gray", border="white", 
     main=paste0("区間(",a,",",b,")上の一様分布")) 
curve(dunif(x, min=a, max=b), # 確率密度関数(理論)
      add=TRUE, col="red", lwd=3) 
legend("topright", inset=0.05,
       legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3)
