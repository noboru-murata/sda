### Poisson分布
set.seed(12345) # 乱数の初期値を指定
rpois(10, lambda=1) # 強度1のPoisson分布に従う乱数を10個発生
rpois(20, lambda=10) # 強度10のPoisson分布に従う乱数を20個発生
## 統計的性質の確認
lambda <- 10
x <- rpois(10000, lambda=lambda)
mean(x) # lambda=10に近い(大数の法則)
(A <- table(x)/10000) # 出現確率ごとの表(度数分布表)を作成
par(family="HiraginoSans-W4") # 日本語フォントの指定
plot(A, type="h", lwd=5, col="royalblue", ylab="確率",
     main=paste0("Poisson分布(強度", lambda, ")"))
lines(min(x):max(x) + 0.3, dpois(min(x):max(x), lambda=lambda), 
      type="h", col="red", lwd=5) # 理論上の出現確率
legend(18, 0.12, legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=5) # 凡例を作成
