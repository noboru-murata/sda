### 重複対数の法則 (ggplot2での描画)
library(tidyverse) # パッケージの読み込み
set.seed(345)      # 乱数のシード値の指定
omega <- 1:6       # サイコロの出る目の集合
p <- rep(1:2, 3)   # 出現確率の比
(mu <- weighted.mean(omega, p)) # 理論平均
(v <- weighted.mean(omega^2, p)-mu^2) # 理論分散
n <- 1000 # サンプル数
mc <- 100 # 実験回数
x <- matrix( # 複数のパスを同時に計算
    sample(omega, size=n*mc, prob=p, replace=TRUE),
    n, mc) # 各列が1つの実験に対応するように整理
n0 <- 3 # n>=n0からプロット
y <- sqrt(n0:n)*(apply(x,2,"cumsum")[n0:n,]/
                 (n0:n)-mu)/sqrt(2*v*log(log(n0:n)))
                                        # 列ごとに計算
myDat1 <- gather(data.frame(x=n0:n,y), path, value, -x)
ggplot(myDat1) +
    geom_line(aes(x=x, y=value,
                  colour=as.numeric(factor(path)))) +
    geom_hline(yintercept=c(-1,1), colour="red") + 
    labs(x=expression(n),
         y=expression(sqrt(n)*(bar(X)[n]-mu)/
                      sqrt(2*sigma^2*log(log(n)))),
         title="Law of the Iterated Logarithm") +
    theme(legend.position="none") 
## 別の描き方の例
myDat2 <- data.frame(obs=y[nrow(y),])
ggplot(myDat2, aes(x=obs)) + 
    geom_histogram(aes(y=..density..), bins=20,
                   colour="gray",
                   fill="gray", alpha=.6) +
    geom_density(colour="blue") +
    geom_vline(xintercept=with(myDat2,max(obs)),
               colour="red") +
    geom_vline(xintercept=with(myDat2,min(obs)),
               colour="red") +
    labs(x=expression(sqrt(n)*(bar(X)[n]-mu)/
                      sqrt(2*sigma^2*log(log(n)))),
         title="Law of the Iterated Logarithm")
