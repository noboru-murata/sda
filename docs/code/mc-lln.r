### 大数の法則
##  偶数が出る確率が奇数の出る確率の2倍となるサイコロを
##  振ったときに出る目の平均値を実験で確かめる 
set.seed(123)    # 乱数のシード値の指定
omega <- 1:6     # サイコロの出る目の集合
p <- rep(1:2, 3) # 出現確率の比(奇数1:偶数2)
(mu <- weighted.mean(omega, p)) # 理論上の平均
## 1回の実験
## サンプル数を大きくすると
## 標本平均が理論上の平均に近づくことを確認する
n <- 1000 # 実験回数の最大値
x <- sample(omega, size=n, prob=p, replace=TRUE)# 実験
xbar <- cumsum(x)/(1:n) # サンプル数ごとの標本平均の計算
## help(cumsum)参照
plot(xbar, type="l", col="blue", lwd=2,
     xlab="sample size", ylab=expression(bar(X)[n]), 
     main="Law of Large Numbers") # 標本平均の推移
abline(h=mu, col="red", lty="dotted", lwd=2) # 理論値
legend("bottomright", inset=1/20, # 右下に配置
       legend=c(expression(bar(X)[n]),expression(mu)), 
       col=c("blue","red"),
       lty=c("solid","dotted"), lwd=2) # 凡例の追加
## 複数回の実験
## サンプル数が大きければ
## 標本平均は理論平均に近い値を取ることの確認
myMean <- function(n) # n回振って標本平均を計算する関数
    mean(sample(omega, size=n, prob=p, replace=TRUE))
mc <- 1000 # Monte-Carlo実験の繰り返し回数
for(n in c(10,100,1000)){ # サンプル数を変えて実験
    xbars <- replicate(mc, myMean(n)) # mc回繰り返し
    hist(xbars, breaks=20,
         col="azure", border="lightblue",
         xlim=c(1,6), ylim=c(0,150), # 描画範囲を指定
         xlab=expression(bar(X)[n]), 
         main=paste0("n=",n)) # 回数をタイトルに表示
    abline(v=mu, col="red", lwd=2, lty="dotted")
    abline(h=0, col="grey", lwd=2, lty="solid")
}
