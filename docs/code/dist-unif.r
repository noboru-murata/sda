### 一様分布
set.seed(1) # 乱数の初期値を指定
runif(10) # 区間(0,1)上の一様乱数を10個発生
## 統計的性質の確認
a <- -1
b <- 2
x <- runif(10000, min=a, max=b)
mean(x) # (a+b)/2=0.5に近い(大数の法則)
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist(x, freq=FALSE, breaks=25, col="gray", 
     border="white", ylim=c(0, 0.5), 
     main=paste0("区間(", a, ",", b, ")上の一様分布")) # ヒストグラム(密度表示)
curve(dunif(x, min=a, max=b), add=TRUE, 
      col="red", lwd=3) # 理論上の確率密度関数
legend(1, 0.5, legend=c("観測値", "理論値"), 
       col=c("gray", "red"), lwd=3) # 凡例を作成
