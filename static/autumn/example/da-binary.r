### 人工データによる判別（２群の場合）
require(MASS)
set.seed(123)
## 訓練データの準備 (判別関数の推定に用いる)
mu1 <- c(14,11)
mu2 <- c(13,13)
Sigma <- matrix(c(1,0.7,0.7,1),2,2)*2.5
n <- 30
x1 <- mvrnorm(n,mu=mu1,Sigma=Sigma)
x2 <- mvrnorm(n,mu=mu2,Sigma=Sigma)
X <- data.frame(rbind(x1,x2),
                cat=as.factor(rep(c(0,1),each=n)))
## head(X) # データの確認 (cat=0)
## tail(X) # データの確認 (cat=1)
## plot(X[,1:2],pch=as.numeric(X[,3]),
##      col=c("red","blue")[as.numeric(X[,3])])

## 判別関数の作成
(myld <- lda(cat ~ X1 + X2, data=X))

## 新しいデータの準備 (判別関数の性能を評価)
n1 <- 25
n2 <- 18
x1new <- mvrnorm(n1,mu=mu1,Sigma=Sigma)
x2new <- mvrnorm(n2,mu=mu2,Sigma=Sigma)
Xnew <- data.frame(rbind(x1new,x2new),
                   cat=as.factor(c(rep(0,n1),rep(1,n2))))
## 推定した判別関数で予測
mypred<-predict(myld, newdata=Xnew[,1:2]) # Xnewを判別
table(true=Xnew$cat, pred=mypred$class)   # 真のクラスと予測されたクラスの比較
## 予測を真の分類と比較
mypred$class # 予測
Xnew$cat     # 真の値
## 結果の図示
plot(Xnew[,1:2], pch=as.numeric(Xnew[,3]),
     col=c("red","blue")[as.numeric(Xnew[,3])], main="new data")
## 判別境界を求める
myline <- function(z){
    a0<-as.vector(colMeans(z$means) %*% z$scaling)
    a<-c(a0/z$scaling[2],-z$scaling[1]/z$scaling[2])
    return(a)}
abline(myline(myld),col="orchid",lwd=2)
