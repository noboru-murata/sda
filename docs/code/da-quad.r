### 人工データによる二次判別（２群の場合）
require(MASS)
set.seed(123)
## データの準備 (判別関数の推定に用いる)
mu1 <- c(14,11)
mu2 <- c(13,13)
Sigma1 <- matrix(c(1,0.7,0.7,1),2,2)*2.5
Sigma2 <- matrix(c(1,-0.3,-0.3,1),2,2)*0.5
n <- 30
x1 <- mvrnorm(n,mu=mu1,Sigma=Sigma1)
x2 <- mvrnorm(n,mu=mu2,Sigma=Sigma2)
X <- data.frame(rbind(x1,x2),
                cat=as.factor(rep(c(0,1),each=n)))
## plot(X[,1:2],pch=as.numeric(X[,3]),
##      col=c("red","blue")[as.numeric(X[,3])])

## 判別関数の作成
(myqd <- qda(cat ~ X1 + X2, data=X))

## 新しいデータの準備 (判別関数の性能を評価)
n1 <- 25
n2 <- 18
x1new <- mvrnorm(n1,mu=mu1,Sigma=Sigma1)
x2new <- mvrnorm(n2,mu=mu2,Sigma=Sigma2)
Xnew <- data.frame(rbind(x1new,x2new),
                   cat=as.factor(c(rep(0,n1),rep(1,n2))))
myprdq<-predict(myqd, newdata=Xnew[,1:2]) # Xnewを判別
table(true=Xnew$cat, pred=myprdq$class) # 真値と予測の比較
## 予測を真の分類と比較
myprdq$class # 予測
Xnew$cat     # 真値
## 結果の図示
## plot(Xnew[,1:2], pch=as.numeric(Xnew[,3]),
##      col=c("red","blue")[as.numeric(Xnew[,3])],
##      main="new data")
## 比較のためldaも実行
(myld <- lda(cat ~ X1 + X2, data=X))
myprdl<-predict(myld, newdata=Xnew[,1:2]) # Xnewを判別
table(true=Xnew$cat, pred=myprdl$class) # 真値と予測の比較
## 予測を真の分類と比較
myprdl$class # 予測
Xnew$cat     # 真値

## ISLR::Smarket による例(2群の判別)
## S&P500指数の2001-2005年の価格変動を記録したデータ
## 価格の上昇・下降を直近何日かの収益率から予測するモデルの構築
## install.packages("ISLR") # パッケージのインストール
require(ISLR)
head(Smarket)
pairs(subset(Smarket, select=paste("Lag", 1:5, sep="")),
      col=rainbow(2)[Smarket$Direction]) 
Smarket.train <- subset(Smarket, Year<2005) # 訓練(-2004年)
Smarket.test <- subset(Smarket, Year==2005) # 試験(2005年)
(myld <- lda(Direction ~ Lag1 + Lag2,
             data=Smarket.train))
prdl.train <- predict(myld) # 訓練データに対する予測結果
table(true=Smarket.train$Direction,
      pred=prdl.train$class)
(myqd <- qda(Direction ~ Lag1 + Lag2,
             data=Smarket.train))
prdq.train <- predict(myqd) # 訓練データに対する予測結果
table(true=Smarket.train$Direction,
      pred=prdq.train$class)
prdl.test <- predict(myld, # 試験データに対する予測結果
                     newdata=Smarket.test) 
table(true=Smarket.test$Direction,
      pred=prdl.test$class)
prdq.test <- predict(myqd, # 試験データに対する予測結果
                     newdata=Smarket.test) 
table(true=Smarket.test$Direction,
      pred=prdq.test$class)
