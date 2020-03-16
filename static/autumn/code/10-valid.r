###  予測誤差の評価

## データセットirisによる例
library(MASS)
n <- nrow(iris) # サンプル数
## データセットをランダムに2分割し, 訓練データと試験データを用意する
set.seed(123)
idx <- sample.int(n, size = n/2) # ランダムに2分割
iris.train <- iris[idx, ] # 訓練データ
iris.test <- iris[-idx, ] # 試験データ
## Fisherの線形判別
(mylda <- lda(Species ~., data = iris.train))
## LD1の寄与率が非常に高く, LD2は判別にほとんど役立たないことが示唆される
plot(mylda, col = rainbow(3)[iris.train$Species])
## 散布図からもLD1の有効性とLD2が判別に寄与していないことが確認できる
## 2次判別
(myqda <- qda(Species ~., data = iris.train))
## 訓練データの予測
lda.train <- predict(mylda)$class 
qda.train <- predict(myqda)$class 
table(true = iris.train$Species, pred = lda.train) 
table(true = iris.train$Species, pred = qda.train) 
## テストデータの予測
lda.test <- predict(mylda, newdata=iris.test)$class 
qda.test <- predict(myqda, newdata=iris.test)$class 
table(true = iris.test$Species, pred = lda.test) 
table(true = iris.test$Species, pred = qda.test) 
