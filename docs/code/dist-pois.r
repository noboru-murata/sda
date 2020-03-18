### Poisson分布
set.seed(345) # 乱数のシード値を指定
rpois(10, lambda=1) # 強度1のPoisson分布(10個)
rpois(20, lambda=10) # 強度10のPoisson分布(20個)
## 統計的性質の確認
lambda <- 10
x <- rpois(10000, lambda=lambda)
mean(x) # lambda=10に近い(大数の法則)
(myData <- table(x)/10000) # 出現確率の表(度数分布表)
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(myData, type="h",
     lwd=8, col="royalblue", ylab="確率",
     main=paste0("Poisson分布(強度", lambda, ")"))
lines(min(x):max(x)+0.4, # 理論上の出現確率
      dpois(min(x):max(x), lambda=lambda), 
      type="h", col="red", lwd=8) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5)
