### 二項分布
set.seed(234) # 乱数のシード値を指定
rbinom(10, size=1, prob=0.5) # Bernoulli分布(10個)
rbinom(10, size=1, prob=0.2) # 成功確率を小さくしてみる
rbinom(20, size=5, prob=0.6) # 二項分布(20個)
## 統計的性質の確認
m <- 10
p <- 0.6
x <- rbinom(10000, size=m, prob=p)
mean(x) # 10 * 0.6 = 6に近い(大数の法則)
(myData <- table(x)/10000) # 出現確率の表(度数分布表)
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(myData, type="h",
     lwd=10, col="royalblue", ylab="確率",
     main=paste0("二項分布 (試行回数",m,
                 ", 成功確率",p,")"))
lines(0:10+0.2, # 理論上の出現確率
      dbinom(0:10, size=m, prob=p), 
      type="h", col="red", lwd=10) 
legend("topleft", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5)
