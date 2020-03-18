### 重複対数の法則
##  偶数が出る確率が奇数の出る確率の2倍となるサイコロを
##  振ったときに出る目の標本平均の重複対数の法則の確認
set.seed(345)    # 乱数のシード値の指定
omega <- 1:6     # サイコロの出る目の集合
p <- rep(1:2, 3) # 出現確率の比(奇数1:偶数2)
(mu <- weighted.mean(omega, p)) # 理論上の平均
(v <- weighted.mean(omega^2, p)-mu^2) # 理論上の分散
n <- 1000  # サンプル数
mc <- 1000 # Monte-Carlo実験の繰り返し回数
x <- matrix( # 複数のパスを同時に計算
    sample(omega, size=n*mc, prob=p, replace=TRUE),
    n, mc) # 各列が1つの実験に対応するように整理
n0 <- 3 # n>=n0からプロット
y <- sqrt(n0:n)*(apply(x,2,"cumsum")[n0:n,]/
                 (n0:n)-mu)/sqrt(2*v*log(log(n0:n)))
                                        # 列ごとに計算
matplot(n0:n, y, type="l", lty=1, col="lightblue",
        xlab=expression(n),
        ylab=expression(sqrt(n)*(bar(X)[n]-mu)/
                        sqrt(2*sigma^2*log(log(n)))),
        main="Law of the Iterated Logarithm") 
abline(h=c(-1,1), lty="dotted", # y=+/-1のプロット
       col="red", lwd=2) 
