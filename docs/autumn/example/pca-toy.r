### 主成分分析

### 人工データ(2次元)による例
set.seed(123)
n <- 100 # データ数
(a <- c(1, 2)/sqrt(5)) # 主成分方向(単位ベクトル)の設定
x <- runif(n,-1,1) %o% a + rnorm(2*n, sd=0.5) # 観測データ
## aのスカラー倍に正規乱数がのった形となっており
## a方向に本質的な情報が集約されていることがわかる
head(x) # データの一部を表示
plot(x, pch=4, col="blue", asp=1, # 散布図
	xlab=expression(x[1]), ylab=expression(x[2])) 
abline(0, a[2]/a[1], col="red", lwd=2) # 主成分方向の図示
## 主成分方向の推定
(est <- prcomp(x)) 
## 第１主成分方向がaに非常に近い (符号は反対)
abline(0, est$rotation[2,1]/est$rotation[1,1], # 図示
	  col="orange", lty="dotted", lwd=2)
## 主成分得点の計算
head(predict(est))      # 主成分得点の一部を表示
pc1 <- predict(est)[,1] # 第１主成分得点の取得
points(pc1 %o% est$rotation[,1], pch=18, col="purple") # 図示
## 固有値分解との比較
(eig <- eigen(crossprod(scale(x,scale=FALSE)))) # 固有値分解
est$rotation # 主成分負荷量
eig$vectors  # 固有ベクトル (符号を除いて主成分負荷量と一致)
est$sdev               # 主成分の標準偏差
sqrt(eig$values/(n-1)) # 固有値と主成分の標準偏差の関係

