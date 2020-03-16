### 標本平均の分布

## 観測データの設定
set.seed(123)    # 乱数のシード値の設定
myrand <- function(n) { # n個の乱数を生成
    runif(n,min=0,max=1)+runif(n,min=-1,max=0)
}
x <- myrand(10000)      # 大量のデータを生成
hist(x,col="royalblue") # データの分布を図示
(mu <- mean(x))  # 平均値を観測データから計算 (理論値を計算せよ)
(sigma <- sd(x)) # 標準偏差 (理論値を計算せよ)

mymean <- function(n) { # n個のデータによる標本平均の計算
    mean(myrand(n))
}
mc <- 5000 # Monte-Carlo実験の繰り返し回数
for(n in c(1,2,4,8,16)){
    xbars <- replicate(mc, mymean(n)) # 実験をmc回繰り返し標本平均を記録
    hist(xbars, breaks=25, freq=FALSE,
         col="orchid", border="slateblue",
         xlab=expression(bar(X)), main=paste0("n=",n))
    thdist <- function(x){dnorm(x,mean=mu,sd=sigma/sqrt(n))}
    curve(thdist, add=TRUE, col="orange", lwd=2) # 理論曲線を重ねる
}
