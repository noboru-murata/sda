### datasets::iris による例
require(MASS) 
## あやめの3品種(setosa, versicolor, virginica)について
## 萼片(Sepal)・花弁(Petal)の幅と長さを記録したデータセット
## 後者の情報から品種を判別することが目的
## 散布図(Speciesごとに色分け)
pairs(subset(iris, select=-Species),
      col=rainbow(3)[iris$Species]) 
## 品種ごとに花弁・萼片の幅と長さの分布が異なるように見える
## 花弁の方が萼片より品種ごとの違いがある

## データをランダムに２分割 (一方で訓練, もう一方で試験)
set.seed(123)
idx <- sample.int(nrow(iris), size=nrow(iris)/2)
iris.train <- iris[idx, ] # 訓練データ
iris.test <- iris[-idx, ] # テストデータ

## 萼片の長さ・幅を特徴量とする線形判別分析
(myld1 <- lda(Species ~ Sepal.Length + Sepal.Width,
              data=iris.train))
## 訓練データに対する予測結果
prd1.train <- predict(myld1) 
head(prd1.train$class)   # 予測されたクラス(最初の6個)
head(iris.train$Species) # 実際のクラス(最初の6個)
## 真のクラスと予測されたクラスの比較
table(true=iris.train$Species, pred=prd1.train$class) 
## setosaは完全に判別できているが
## versicolorとvirginicaの判別に少し誤りがある

## 試験データに対する予測
prd1.test <- predict(myld1, newdata=iris.test) 
head(prd1.test$class)   # 予測されたクラス(最初の6個)
head(iris.test$Species) # 実際のクラス(最初の6個)
## 真のクラスと予測されたクラスの比較
table(true=iris.test$Species, pred=prd1.test$class) 
## setosaはほぼ判別できているが
## versicolorとvirginicaの判別に少し誤りがある

### 花弁の長さ・幅を特徴量とする線形判別分析
(myld2 <- lda(Species ~ Petal.Length + Petal.Width,
              data=iris.train))
## 訓練データに対する予測
prd2.train <- predict(myld2) 
head(prd2.train$class)   # 予測されたクラス(最初の6個)
head(iris.train$Species) # 実際のクラス(最初の6個)
## 真のクラスと予測されたクラスの比較
table(true=iris.train$Species, pred=prd2.train$class) 
## ほぼ完全に判別できている(萼片による分類よりよい)

## 試験データに対する予測
prd2.test <- predict(myld2, newdata=iris.test) 
head(prd2.test$class) # 予測されたクラス(最初の6個)
head(iris.test$Species) # 実際のクラス(最初の6個)
## 真のクラスと予測されたクラスの比較
table(true=iris.test$Species, pred=prd2.test$class) 
## ほぼ完全に判別できている(萼片による分類よりよい)
