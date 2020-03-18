### 二項分布の極限: Poisson近似が有効な場合
set.seed(890)
n <- 1000
p <- 0.001
mc <- 10000
y <- rbinom(mc, n, p)
## まず正規近似を試す
par(family="HiraginoSans-W4") # 日本語フォントの指定
hist((y-n*p)/sqrt(n*p*(1-p)), freq=FALSE,
     col="lightblue", main="二項分布の正規近似",
     xlab=expression((Y-n*p)/sqrt(n*p*(1-p))))
curve(dnorm, add=TRUE, col="red") # うまくいかない
## 次にPoisson近似を試す
(myData <- table(y))
plot(myData/mc, type="h", lwd=10, col="royalblue",
     main="二項分布のPoisson近似", xlab=expression(Y)) 
lines(min(y):max(y)+0.2, dpois(min(y):max(y),n*p), 
      type="h", col="red", lwd=10) # うまくいく
