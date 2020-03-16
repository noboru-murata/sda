### rattle::wine による多値判別の例
require(MASS)
require(car)    # 散布図
require(rattle) # wineデータ
head(wine)
## car package による散布図
scatterplotMatrix(~ Alcohol + Malic + Ash + Alcalinity | Type,
                  data=wine, col=rainbow(3), regLine=FALSE) 
## scatterplotMatrix(wine[,2:5],groups=wine$Type,
##                   col=rainbow(3),regLine=FALSE) # 上と同じグラフ
## pairs(subset(wine, select=2:5), col=rainbow(3)[wine$Type]) 

## Type(3値)の判別
(myld <- lda(Type ~ ., data=wine))
## LD1とLD2を用いた散布図
plot(myld, col=rainbow(3)[wine$Type])
## 各判別関数値のクラス別ヒストグラム
ldahist(predict(myld)$x[,"LD1"],g=wine$Type)
ldahist(predict(myld)$x[,"LD2"],g=wine$Type)
