### 中心極限定理 (ggplot2での描画)
library(tidyverse) # パッケージの読み込み
set.seed(234)      # 乱数のシード値の指定
omega <- 1:6       # サイコロの出る目の集合
p <- rep(1:2, 3)   # 出現確率の比 (奇数1:偶数2)
(mu <- weighted.mean(omega, p)) # 理論平均と標準偏差
(sigma <- sqrt(weighted.mean(omega^2,p)-mu^2)) 
myMean <- function(n) # n回振って標本平均を計算する関数
    mean(sample(omega, size=n, prob=p, replace=TRUE))
mc <- 1000 # Monte-Carlo実験の繰り返し回数
for(n in c(10,100,1000)){ # サンプル数を変えて実験
    myData <- data.frame(
        xbar=replicate(mc, myMean(n))) # mc回繰り返し
    gg <- ggplot(myData,
                 aes(x=sqrt(n)*(xbar-mu)/sigma)) + 
        geom_histogram(aes(y=..density..),
                       colour="slateblue",
                       fill="orchid", alpha=.6) +
        geom_density(colour="slateblue", alpha=.3) + 
        stat_function(fun=dnorm, colour="orange") +
        xlim(-3, 3) + ylim(0,0.6) + # 描画範囲を指定
        labs(x=expression(sqrt(n)*(bar(X)[n]-mu)/sigma),
             title=paste("n =", n))
    print(gg) # 表示
}
