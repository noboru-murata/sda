### rattle::wine によるCVによる誤差の評価
require(MASS)
require(rattle) # wineデータ
## LOO CV の例 (lda/qdaは標準で装備している)
## 線形判別
myld <- lda(Type ~ ., data=wine) 
myldloo <- lda(Type ~ ., data=wine, CV=TRUE)
table(true=wine$Type,est=predict(myld)$class) # 訓練誤差
table(true=wine$Type,est=myldloo$class)  # CVによる予測誤差
## 線形判別は若干過学習している

## 2次判別
myqd <- qda(Type ~ ., data=wine) 
myqdloo <- qda(Type ~ ., data=wine, CV=TRUE)
table(true=wine$Type,est=predict(myqd)$class) # 訓練誤差
table(true=wine$Type,est=myqdloo$class)  # CVによる予測誤差
## 過学習は見られない，予測誤差の観点からは2次判別の方が線形判別より精度が良い

### 参考
## k-fold CV は caret package の機能を利用して求めることができる
require(caret)  # k-fold CV 
(train(Type ~., data=wine, method="lda",
             trControl=trainControl(method="cv", number=10)))
(train(Type ~., data=wine, method="qda",
             trControl=trainControl(method="cv", number=10)))
## LOO CV も利用することができる
(train(Type ~., data=wine, method="lda",
             trControl=trainControl(method="LOOCV")))
(train(Type ~., data=wine, method="qda",
             trControl=trainControl(method="LOOCV")))
