### 少数の法則 (ggplot2での描画)
library(tidyverse) # パッケージの読み込み
set.seed(456)
n <- 5000 # 1日の総生産量
p <- 0.002 # 不良品の発生確率
mc <- 5*50*2 # 実験回数(週5日x50週間x2年操業に対応)
x <- replicate(mc, sum(rbinom(n,1,p))) # 不良品数
num <- min(x):max(x)
## それぞれの不良品数が生じた日数の割合のグラフを作成
myDat1 <- gather(
    data.frame(num=num,
               観測値=sapply(num, # nとなる割合を計算
                             function(n)sum(x==n))/mc,
               理論値=dpois(num, n*p)),
    type, value, -num)
ggplot(myDat1, aes(x=num, y=value, fill=type)) +
    geom_bar(stat="identity", position="dodge") +
    scale_fill_manual(name=NULL,
      values=c("観測値"="royalblue","理論値"="red")) +
    labs(x="不良品数", y="発生割合") +
    theme(legend.position=c(.95,.75),
          legend.justification=c(1, 0),
          text=element_text(family="HiraginoSans-W4"))
## 別の描き方の例
myDat2 <- data.frame(obs=x) 
myTheory <- data.frame(x=num, y=dpois(num, n*p)) 
ggplot() + 
    geom_histogram(data=myDat2,
                   aes(x=obs,y=..density..),
                   binwidth=1,
                   colour="royalblue",
                   fill="royalblue", alpha=.6) +
    geom_bar(data=myTheory, aes(x=num,y=y),
             stat="identity", colour="red", alpha=0) +
    labs(x="不良品数", y="発生割合") +
    theme(text=element_text(family="HiraginoSans-W4"))
