### 回帰係数の検定
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
## 気温を日射量で説明するモデルの作成
(myModel1 <- lm(気温 ~ 日射量, data=kikou)) 
summary(myModel1) # パラメータの推定値・標準誤差・t値・p値などを表示
## 日射量の回帰係数のp値は非常に小さいので，気温の説明に有用であるといえそう
##
## 気温を降水量で説明するモデルの作成
(myModel2 <- lm(気温 ~ 降水量, data=kikou)) 
summary(myModel2) # パラメータの推定値・標準誤差・t値・p値などを表示
## 降水量の回帰係数のp値は小さくないので, 有意であるとはいえない
