### ARMA(2,1)モデルのシミュレーション
set.seed(123)
n <- 1000          # 時系列の長さ
a <- c(0.8, -0.64) # ARの係数
b <- -0.5          # MAの係数
epsilon <- rnorm(n)
x0 <- rnorm(2)     # 初期値
## for文で生成する方法
x <- ts(double(n))
x[1:2] <- x0
for(i in 3:n) x[i] <- a%*%x[i-1:2] + b*epsilon[i-1] + epsilon[i]
plot(x, col="navyblue")
## arima.simで生成する方法 (初期値の指定はできない)
## 関数arima.simのノイズの既定値は標準正規列
y <- arima.sim(list(ar=a, ma=b), n)
lines(y, col = "deeppink")
