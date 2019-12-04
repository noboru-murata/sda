### 主成分分析

### 人工データ(2次元)による例
set.seed(123)
n <- 100 # データ数
(a <- c(1, 2)/sqrt(5)) # 主成分方向(単位ベクトル)の設定
mydata <- data.frame(runif(n,-1,1) %o% a + rnorm(2*n, sd=0.2))
names(mydata) <- paste0("x",1:2) # 観測データ
## aのスカラー倍に正規乱数がのった形となっており
## a方向に本質的な情報が集約されていることがわかる
head(mydata) # データの一部を表示
plot(mydata, asp=1, # 縦横比を1とした散布図
     pch=4, col="blue") # 点(×)と色(青)を指定
abline(0, a[2]/a[1], col="red", lwd=2) # 主成分方向の図示
## 主成分方向の推定
(est <- prcomp(mydata)) 
## 第１主成分方向がaに非常に近い (符号は反対)
abline(0, est$rotation[2,1]/est$rotation[1,1], # 図示
       col="orange", lty="dotted", lwd=2)

## 主成分得点の計算
head(predict(est))      # 主成分得点の一部を表示
pc1 <- predict(est)[,1] # 第１主成分得点の取得
points(pc1 %o% est$rotation[,1], # 元の散布図上で図示
       pch=18, col="purple") 
plot(predict(est), asp=1, # 主成分得点による散布図
     pch=4, col="blue") 
