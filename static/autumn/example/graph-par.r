### 複数図の配置
## 気候データの各変数のヒストグラムを1つの画面に配置
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
op <- par(mfrow=c(2,2)) # 画面を2×2に分割，行ごとにプロット
## par(mfcol=c(2,2))で列ごとにプロットできる
cl <- terrain.colors(4) # 色を用意
nam <- colnames(kikou)[-(1:2)] # ヒストグラムを作成する変数名
## 第1変数のヒストグラムの作成
hist(kikou[ ,nam[1]], col=cl[1], breaks=25, xlab="", 
     main=paste0(nam[1], "のヒストグラム")) 
## 第2変数のヒストグラムの作成
hist(kikou[ ,nam[2]], col=cl[2], breaks=25, xlab="", 
     main=paste0(nam[2], "のヒストグラム")) 
## 残りはfor文で作成
for(i in 3:4){
    hist(kikou[ ,nam[i]], col=cl[i], breaks=25, xlab="", 
         main=paste0(nam[i], "のヒストグラム"))
}
par(op) # 設定解除
### 余白の設定
op1 <- par(mfrow=c(1,2))
plot(kikou[ ,3:4], main="標準の余白の場合")
op2 <- par(mar=c(9,2,1,6)) 
## 下・左・上・右の順で余白を設定
## デフォルトは par(mar=c(5,4,4,2)+0.1)
plot(kikou[ ,3:4], main="余白を変更した場合")
par(op1); par(op2) # 設定解除
