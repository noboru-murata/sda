### 関数histによるヒストグラムの作図
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(月,気温,降水量,日射量,風速))
### 基本的なヒストグラム
hist(myData$気温) # ビンの数は自動的に計算される
### ビンの数を指定
hist(myData$気温, 
     breaks=25, # ビンの数を約25に設定
     labels=TRUE, # 各ビンの度数を表示
     col="green",
     xlab="温度", ylab="頻度", main="気温ヒストグラム") 
### 密度での表示
hist(myData$風速, freq = FALSE, # 全体に対する割合で表示
     breaks=25, col="lightblue", 
     border="blue", # 長方形の境界の色
     xlab="速度", ylab="密度", main="風速ヒストグラム") 
### Weylの一様分布定理の確認
##  aが無理数のとき，数列a,2a,3a,...の小数部分は
##  区間(0,1)上に均一に現れる
a <- pi # 無理数 (適当に変えて実験してみよう)
n <- 10000
x <- (1:n) * a
x <- x - floor(x) # 小数の取り出し(floorはGauss記号)
hist(x, breaks=20, col="gray", border="darkgray",
     main="Weylの一様分布定理の実験")
