### ランダムウォークのシミュレーション
set.seed(123)
n <- 1000 # 時系列の長さ
x0 <- 1   # 初期値
epsilon <- rnorm(n-1)
## for文によって生成する方法
x <- ts(double(n))
x[1] <- x0
for(i in 2:n) x[i] <- x[i-1] + epsilon[i-1]
plot(x, col="brown")
## 関数diffinvを使う方法 (こちらの方が速い)
y <- ts(diffinv(epsilon, xi=x0))
sum(abs(x - y)) # xとyは全く同じ系列
## 参考．diffは階差(差分)，diffinvはその逆関数(和分)
(0:10)^2
diff((0:10)^2)
diffinv(diff((0:10)^2))
