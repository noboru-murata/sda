### 大数の法則 (ggplot2での描画)
library(tidyverse) # パッケージの読み込み
set.seed(123)      # 乱数のシード値の指定
omega <- 1:6       # サイコロの出る目の集合
p <- rep(1:2, 3)   # 出現確率の比 (奇数1:偶数2)
(mu <- weighted.mean(omega, p)) # 理論平均
## 1回の実験
## サンプル数を大きくすると標本平均が理論上の平均に近づく
n <- 1000 # 実験回数の最大値
x <- sample(omega, size=n, prob=p, replace=TRUE)# 実験
myData <- data.frame(n=1:n, # サンプル数ごとの標本平均
                     xbar=cumsum(x)/(1:n)) 
ggplot(myData,aes(x=n, y=xbar)) +
    geom_line(aes(colour="obs")) +
    geom_hline(aes(yintercept=mu,colour="true")) +
    labs(x="sample size", y=expression(bar(X)[n]),
         title="Law of Large Numbers") +
    scale_color_manual(name=NULL,
          values=c("obs"="blue","true"="red")) +
    theme(legend.position=c(.95,.05),
          legend.justification=c(1, 0))
## 複数回の実験
## サンプル数が大きければ標本平均は理論平均に近い値を取る
myMean <- function(n) # n回振って標本平均を計算する関数
    mean(sample(omega, size=n, prob=p, replace=TRUE))
mc <- 1000 # Monte-Carlo実験の繰り返し回数
for(n in c(10,100,1000)){ # サンプル数を変えて実験
    myData <- data.frame(
        xbar=replicate(mc, myMean(n))) # mc回繰り返し
    gg <- ggplot(myData, aes(x=xbar)) + 
        geom_histogram(aes(y=..density..), # 密度表示
                       binwidth=0.1,
                       colour="azure",
                       fill="lightblue", alpha=.6) +
        geom_density(colour="blue", alpha=.3) + #概形
        geom_vline(xintercept=mu, colour="red") + 
        xlim(1,6) + # 描画範囲を指定
        labs(x=expression(bar(X)[n]),
             title=paste("n =", n))
    print(gg) # 表示
}
