### 二項分布の極限: 離散分布から連続分布へ
set.seed(789)
p <- 1/(7*pi)
for(i in 1:4){
  n <- 3*10^i
  x <- (rbinom(10^6,n,prob=p)-n*p)/sqrt(n*p*(1-p))
  hist(x,breaks=c(-Inf,seq(-3,3,0.25),Inf),freq=FALSE, 
       xlim=c(-3,3),col="lightblue",border="white")
  curve(dnorm(x, mean=0, sd=1), # 確率密度関数(理論)
        add=TRUE, col="red", lwd=3) 
}
