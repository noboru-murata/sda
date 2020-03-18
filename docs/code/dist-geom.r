### 幾何分布
set.seed(456) # 乱数のシード値を指定
rgeom(20, prob=0.1) # 成功確率0.1の幾何分布(20個)
## 統計的性質の確認
p <- 0.4
x <- rgeom(10000, prob=p)
mean(x) # (1-p)/p=1.5に近い(大数の法則)
(myData <- table(x)/10000) # 出現確率の表(度数分布表)
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(myData, type="h", ylim=c(0,0.45),
     lwd=10, col="royalblue", ylab="確率",
     main=paste0("幾何分布(成功確率", p, ")"))
lines(min(x):max(x)+0.4, # 理論上の出現確率 
      dgeom(min(x):max(x), prob=p), 
      type="h", col="red", lwd=10) 
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5) 
