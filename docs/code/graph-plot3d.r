### 関数perspによる2変数関数の俯瞰図
f <- function(x,y) x^2 - y^2
x <- seq(-3, 3, length=51) # x座標の定義域の分割
y <- seq(-3, 3, length=51) # y座標の定義域の分割
z <- outer(x, y, f) # z座標の計算
### 基本的な俯瞰図
persp(x, y, z, col="lightblue")
### 俯瞰する向きを指定
persp(x, y, z, 
      theta=30, phi=30, expand=0.5, # 視点を設定
      col="royalblue", main=expression(z==x^2-y^2))
### 3次元散布図(パッケージscatterplot3dを利用)
## install.packages("scatterplot3d") # 初めて使う場合
library(scatterplot3d) # パッケージのロード
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(風速,日射量,気温))
scatterplot3d(myData, pch=20, color="orchid")
## pch の指定については help(points) を参照
