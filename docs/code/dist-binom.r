### 二項分布
set.seed(123) # 乱数の初期値を指定
rbinom(10, size=1, prob=0.5) # Bernoulli分布のシミュレーション
rbinom(10, size=1, prob=0.2) # 成功確率を小さくしてみる
rbinom(20, size=5, prob=0.6) # 20個の二項分布のシミュレーション
## 統計的性質の確認
m <- 10
p <- 0.6
x <- rbinom(10000, size=m, prob=p)
mean(x) # 10 * 0.6 = 6に近い(大数の法則)
(A <- table(x)/10000) # 出現確率ごとの表(度数分布表)を作成
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(A, type="h", lwd=5, col="royalblue", ylab="確率",
     main=paste0("二項分布(試行回数", m, ", 成功確率", p, ")"))
lines(0:10 + 0.2, dbinom(0:10, size=m, prob=p), 
      type="h", col="red", lwd=5) # 理論上の出現確率
legend(1, 0.25, legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5) # 凡例を作成
