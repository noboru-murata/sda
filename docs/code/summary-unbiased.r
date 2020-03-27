### 標本分散が平均的には過小推定となることの確認
set.seed(123) # 乱数のシード値を指定
sample.var <- function(n){
    ## n個の標準正規乱数の標本分散を計算する関数
    x <- rnorm(n)
    return(mean((x-mean(x))^2))
}
## Monte-Carlo実験
n <- 10 # サンプル数
mc <- 10000 # 実験回数
v <- replicate(mc, sample.var(n))
## sample.var(n)をmc回実行して結果を記録
head(v) # 実験結果をいくつか見る
mean(v) # 標本分散の平均 (n-1)/n=0.9程度に過小推定
mean((n/(n-1))*v) # バイアス修正すると1に近づく(不偏)
