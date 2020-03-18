### 中心極限定理
##  偶数が出る確率が奇数の出る確率の2倍となるサイコロを
##  振ったときに出る目の標本平均の分布を実験で確かめる 
set.seed(234)    # 乱数のシード値の指定
omega <- 1:6     # サイコロの出る目の集合
p <- rep(1:2, 3) # 出現確率の比(奇数1:偶数2)
(mu <- weighted.mean(omega, p)) # 理論上の平均
(sigma <- sqrt( # 理論上の標準偏差(分散の平方根)
     weighted.mean(omega^2,p)-mu^2)) 
myMean <- function(n) # n回振って標本平均を計算する関数
    mean(sample(omega, size=n, prob=p, replace=TRUE))
mc <- 1000 # Monte-Carlo実験の繰り返し回数
for(n in c(1,10,100,1000)){ # サンプル数を変えて実験
    xbars <- replicate(mc, myMean(n)) # mc回繰り返し
    hist(sqrt(n)*(xbars - mu)/sigma, breaks=25,
         freq=FALSE, # 密度で表示
         xlim=c(-3, 3), ylim=c(0,0.55),  
         col="orange", border="orchid",
         xlab=expression(sqrt(n)*(bar(X)[n]-mu)/sigma),
         main=paste0("n=",n))
    curve(dnorm, add=TRUE, col="red", lwd=2) # 理論曲線
}
