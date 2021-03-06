### AR(2)モデルのシミュレーション
set.seed(123)
n <- 1000            # 時系列の長さ
a <- c(0.669, 0.263) # ARの係数
epsilon <- rnorm(n-2)
x0 <- rnorm(2)       # 初期値
## for文で生成する方法
x <- ts(double(n))
x[1:2] <- x0
for(i in 3:n) x[i] <- a%*%x[i-1:2] + epsilon[i-2]
plot(x, col="orange")
## 関数filterを使う方法 (こちらの方が速い)
y <- ts(c(x0, filter(epsilon, filter=a, method="r",
                     init=rev(x0))))
sum(abs(x - y)) # ほぼ0 (数値計算上の問題)
## 参考．関数filterは時系列に対する線形フィルタ
## methodで"c"(convolution)を選ぶとmoving average
## "r"(recursive)を選ぶとautoregressionの変換になる
## それぞれの変換を行うときの係数をfilterで指定する
a <- c(-2,1) # a_1, a_2
x.init <- c(0,1) # x_2, x_1 (時間順に注意)
ep <- c(5,6,7)
(x <- filter(ep, filter=a, method="r", init=x.init))
## filterの出力結果の確認
a[1]*x.init[1]+a[2]*x.init[2]+ep[1] # x_3
a[1]*x[1]+a[2]*x.init[1]+ep[2]      # x_4
a[1]*x[2]+a[2]*x[1]+ep[3]           # x_5
