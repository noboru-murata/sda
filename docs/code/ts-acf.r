### 人工データによるacfの実行例
set.seed(123)
n <- 1000 # 時系列の長さ
## ホワイトノイズ
wn <- ts(rnorm(n))
acf(wn)
## ランダムウォーク
rw <- diffinv(rnorm(n-1)) # 初期値0．diffの逆関数．
acf(rw)
## AR(2)モデル
a <- c(0.669, 0.263) # ARの係数
x <- arima.sim(list(ar=a), n)
acf(x)
a2 <- c(0.8, -0.64) # 別のARの係数
x2 <- arima.sim(list(ar=a2), n)
acf(x2)
## MA(2)モデル
b <- c(0.438, 0.078) # MAの係数
y <- arima.sim(list(ma=b), n)
acf(y)
b2 <- c(-0.6, 0.3)   # 別のMAの係数
y2 <- arima.sim(list(ma=b2), n)
acf(y2) 
## ARMA(2,2)モデル
z <- arima.sim(list(ar=a, ma=b), n)
acf(z)
z2 <- arima.sim(list(ar=a2, ma=b2), n) # 別の係数
acf(z2)
