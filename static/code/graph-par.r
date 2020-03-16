### 複数図の配置
## 気候データの各変数のヒストグラムを1つの画面に配置
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(気温,降水量,日射量,風速))
op <- par(mfrow=c(2,2)) # 画面を2x2に分割，行方向に配置
## par(mfcol=c(2,2))で列方向に配置できる
myColor <- terrain.colors(4) # 色を用意
myName <- colnames(myData) # ヒストグラムの変数名
## 第1変数のヒストグラムの作成
hist(myData[,myName[1]], col=myColor[1],
     breaks=25, xlab="",
     main=paste0(myName[1], "のヒストグラム")) 
## 第2変数のヒストグラムの作成
hist(myData[,myName[2]], col=myColor[2],
     breaks=25, xlab="",
     main=paste0(myName[2], "のヒストグラム")) 
## 残りはfor文で作成
for(i in 3:4){
    hist(myData[,myName[i]], col=myColor[i],
         breaks=25, xlab="",
         main=paste0(myName[i], "のヒストグラム")) 
}
par(op) # 設定解除 (古い設定 <- par(新しい設定))
### 余白の設定
op1 <- par(mfrow=c(1,2))
plot(myData[ ,c(1,3)], main="標準の余白の場合")
op2 <- par(mar=c(7,1,3,5)) 
## 下・左・上・右の順で余白を設定
## デフォルトは par(mar=c(5,4,4,2)+0.1)
plot(myData[ ,c(1,3)], main="余白を変更した場合")
par(op2); par(op1) # 設定解除
