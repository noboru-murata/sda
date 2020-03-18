### 離散一様分布
a <- 1:6 # サンプリング対象の集合をベクトルとして定義
set.seed(123) # 乱数の初期値を指定
sample(a, size=20, replace=TRUE) # 20個の離散一様分布のシミュレーション
## 統計的性質の確認
x <- sample(a, size=10000, replace=TRUE)
mean(x) # mean(a) = 3.5に近い(大数の法則)
(A <- table(x)/10000) # 出現確率ごとの表(度数分布表)を作成
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(A, type="h", lwd=5, col="royalblue", ylab="確率",
     main="離散一様分布", ylim=c(0, 0.3))
lines(a+0.1, rep(1/length(a),length(a)), type="h", col="red", lwd=5)
legend(4, 0.3, legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5) # 凡例を作成
