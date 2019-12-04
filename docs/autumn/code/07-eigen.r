### 主成分分析の計算

### 人工データ(2次元)による例
set.seed(789)
n <- 50 # データ数
a <- rnorm(2)
(a <- a/sqrt(sum(a^2))) # 主成分方向(単位ベクトル)を生成
mydata <- data.frame(runif(n,-1,1) %o% a + rnorm(2*n, sd=0.3))
names(mydata) <- paste0("x",1:2) # 観測データ
plot(mydata, asp=1, # 縦横比を1とした散布図
     pch=4, col="blue") # 点(×)と色(青)を指定
abline(0, a[2]/a[1], col="red", lwd=2) # 主成分方向の図示

## 主成分方向の推定を固有値分解と比較
(est <- prcomp(mydata)) 
(eig <- eigen(crossprod(scale(mydata,scale=FALSE)))) # 固有値分解
est$rotation # 主成分負荷量
eig$vectors  # 固有ベクトル (符号を除いて主成分負荷量と一致)
est$sdev               # 主成分の標準偏差
sqrt(eig$values/(n-1)) # 固有値と主成分の標準偏差の関係
