### ホワイトノイズの生成
set.seed(123)
n <- 1000            # 時系列の長さ
x <- ts(rnorm(n))    # 正規分布の場合
plot(x, col="blue")  # 時系列として図示される
y <- ts(rt(n, df=4)) # 自由度4のt分布の場合
plot(y, col="red")   # 図示
## lines(x, col="blue") # 前のplotに重ね描き
