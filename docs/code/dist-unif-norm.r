### 一様乱数の標本平均に対する中心極限定理
set.seed(901)
myMean <- function(n) # n個の一様乱数の標本平均を計算
  mean(runif(n)) 
mc <- 100000 # シミュレーション回数
for(n in c(1,2,10,50)){
  xbar <- replicate(mc, myMean(n))
  x <- sqrt(n) * (xbar - 1/2)/sqrt(1/12)
  hist(x,breaks=c(-Inf,seq(-3,3,0.25),Inf),freq=FALSE, 
       xlim=c(-3,3),ylim=c(0,0.4),
       col="lightblue",border="white")
  curve(dnorm(x, mean=0, sd=1), # 確率密度関数(理論)
        add=TRUE, col="red", lwd=3) 
}
