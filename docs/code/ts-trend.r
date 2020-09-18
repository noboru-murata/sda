### トレンドのあるホワイトノイズの生成
set.seed(123)
n <- 1000     # 時系列の長さ
mu <- 1       # トレンドの切片
alpha <- 0.01 # トレンドの傾き
x <- ts(mu + alpha*(1:n) + rnorm(n))
plot(x, col="orchid")
