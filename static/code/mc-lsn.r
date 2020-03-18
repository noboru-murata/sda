### 少数の法則
##  大きさ1の2項分布を使う
set.seed(456) # 乱数のシード値の指定
n <- 5000     # 1日の総生産量
p <- 0.002    # 不良品の発生確率
mc <- 5*50*2  # 実験回数(週5日x50週間x2年操業に対応)
x <- replicate(mc, sum(rbinom(n,1,p))) # 不良品数
(myData <- table(x)) # 不良品数の度数分布表を作成
## それぞれの不良品数が生じた日数の割合のグラフを作成
par(family = "HiraginoSans-W4") # 日本語フォントの指定
plot(myData/mc, type="h", col="royalblue", lwd=6, 
     xlab="不良品数", ylab="発生割合")
lines(min(x):max(x)+0.4, dpois(min(x):max(x),n*p),
      type="h", col="red", lwd=6) # 理論上の割合
legend("topright", inset=1/20, # 右上に配置
       legend=c("観測値", "理論値"), 
       col=c("royalblue", "red"), lwd=4) # 凡例
