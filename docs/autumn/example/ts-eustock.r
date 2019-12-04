### datasets::EuStockMarkets による例
## ヨーロッパ各国の株価指数の日次時系列データを集めたデータ
y <- ts(EuStockMarkets[,3]) # France CACを分析する
plot(y) # 時系列の図示
acf(y)  # 自己相関
## 指数的に増えているようなので対数をとってみる
ly <- log(y)
plot(ly) # 対数時系列
acf(ly)  # 自己相関
## 階差をとってみる
x <- diff(ly)
plot(x) # 階差時系列
acf(x)  # 自己相関
## ラグ1以上の自己相関はほぼない
## ランダムウォーク的な動きの時系列データであると予想される
acf(x,plot=FALSE)$acf[,,1] # 自己相関の計算値の出力
