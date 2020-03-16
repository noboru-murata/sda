### ベクトルの描画
plot(11:20)
### 関数の描画
plot(sin, 0, 4*pi, 
     col="blue", # グラフの線の色
     lwd=2, # グラフの線の太さ
     ylab="sin/cos") # y軸のラベル
curve(cos, 
      add=TRUE, # グラフを上書き
      col="red", lwd=2)
x <- seq(0, 4*pi, by=0.1)
y <- sin(x) + rep_len(c(-0.2, 0.1), length(x))
points(x, y, col="green", # 点を追加
       pch="*") # pchは点の形を指定
### データ点の描画
plot(x, y, type="p", pch="x", # "p"=point
     ylim=c(-2,2)) # ylimで値域を指定
curve(sin, add=TRUE, col="orange", lwd=2)
lines(x, y, col="blue") # 折れ線を追加
### データフレームを用いた散布図 (airqualityを利用)
plot(Ozone ~ Wind, data=airquality,
     pch="*", col="red", 
     cex=2) # cexは点の大きさの倍率を指定
