### MA(2)モデルのシミュレーション
set.seed(123)
n <- 1000            # 時系列の長さ
b <- c(0.438, 0.078) # MAの係数
epsilon <- rnorm(n)
x0 <- epsilon[1:2]   # 初期値は(epsilon1, epsilon2)
## for文で生成する方法
x <- ts(double(n))
x[1:2] <- x0
for(i in 3:n) x[i] <- b %*% epsilon[i - 1:2] + epsilon[i]
plot(x, col="seagreen")
## 関数filterを使う方法 (sides=1は moving averageを過去の方向にのみ行う)
y <- ts(filter(epsilon, filter=c(1,b), method="c", sides=1))
y[1:2] <- x0 # 初期値の書き換え (計算できないのでNAになっている)
sum(abs(x - y)) # ほぼ0 (数値計算上の問題からちょうど0とはならない)
