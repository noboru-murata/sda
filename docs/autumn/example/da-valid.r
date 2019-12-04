## データセットirisによる例
library(MASS)
n <- nrow(iris) # サンプル数
### データセットをランダムに2分割し, 一方を訓練データ, 
### 他方をテストデータとする
set.seed(123)
idx <- sample.int(n, size = n/2)
iris.train <- iris[idx, ] # 訓練データ
iris.test <- iris[-idx, ] # テストデータ
(res.lda <- lda(Species ~., data = iris.train))
### LD1の寄与率が非常に高く, LD2は判別にほとんど役立たないことが示唆される
plot(res.lda, col = rainbow(3)[iris.train$Species])
### バイプロットからもLD1の有効性とLD2が判別に寄与していないことが確認できる
# LD1とLD2の再現
mu <- res.lda$means # クラスごとの平均ベクトル
Mtilde <- sqrt(res.lda$prior) * scale(mu, center = colSums(res.lda$prior %*% mu), scale = FALSE)
Xtilde <-  (subset(iris.train, select = -Species) - mu[iris.train$Species, ])/sqrt(n/2 - 3)
s1 <- svd(Xtilde)
s2 <- svd(Mtilde %*% s1$v %*% diag(1/s1$d))
s1$v %*% diag(1/s1$d) %*% s2$v[ ,1:2]
res.lda$scaling
# 上の考察に基づき, LD1のみによる正準判別分析を実行してみる
mycda <- function(obj, newdata){
  
  ybar <- drop(obj$means %*% obj$scaling[ ,1])
  y <- predict(obj, newdata)$x[ ,1] + c(obj$prior %*% ybar)
  d <- outer(y, ybar, FUN = "-")^2
  # 別の書き方
  # d <- matrix(0, length(y), length(ybar))
  # for(k in 1:length(ybar)) d[ ,k] <- (y - ybar[k])^2
  res <- apply(d, 1, "which.min")
  
  return(rownames(obj$means)[res])
}
# 訓練データの予測
lda.train <- predict(res.lda)$class 
cda.train <- mycda(res.lda)
table(true = iris.train$Species, pred = lda.train) # LDAの場合
table(true = iris.train$Species, pred = cda.train) # CDAの場合
### 後者のパフォーマンスは前者と比べて遜色ない
# テストデータの予測
lda.test <- predict(res.lda, iris.test)$class 
cda.test <- mycda(res.lda, iris.test)
table(true = iris.test$Species, pred = lda.test) # LDAの場合
table(true = iris.test$Species, pred = cda.test) # CDAの場合
### 後者のパフォーマンスは前者と比べて遜色ない