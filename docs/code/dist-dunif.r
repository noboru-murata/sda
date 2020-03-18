### 離散一様分布
a <- 1:6 # サンプリング対象の集合をベクトルとして定義
set.seed(123) # 乱数のシード値を指定
sample(a, size=20, replace=TRUE) # 離散一様分布(10個)
## 統計的性質の確認
x <- sample(a, size=10000, replace=TRUE)
mean(x) # mean(a) = 3.5に近い(大数の法則)
(myData <- table(x)/10000) # 出現確率の表(度数分布表)
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(myData, type="h", xlim=c(1,6.5), ylim=c(0,0.3),
     lwd=10, col="royalblue",
     ylab="確率", main="離散一様分布")
lines(a+0.2, # 理論上の出現確率
      rep(1/length(a),length(a)), 
      type="h", col="red", lwd=10)
legend("topright", inset=0.1,
       legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5)
