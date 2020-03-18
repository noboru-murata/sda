### 二項分布の極限: 離散分布から連続分布へ
set.seed(123)
p <- 1/(7*pi)
for(i in 1:4){
  n <- 3*10^i
  x <- (rbinom(1000000,n,prob=p)-n*p)/sqrt(n*p*(1-p))
  hist(x,breaks=c(-Inf,seq(-3,3,0.25),Inf),freq=FALSE, 
       xlim=c(-3,3),xlab=n,col="lightblue",border="white")
  curve(dnorm(x, mean=0, sd=1), add=TRUE, 
        col="red", lwd=3) # 理論上の確率密度関数
}
