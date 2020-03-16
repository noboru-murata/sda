### 描画の基礎
## 描画の例として東京都の気候データを使う
mydata <- read.csv("tokyo-weather.csv",fileEncoding="utf8")

## 基本的な描画 (ベクトルの描画)
(temp <- subset(mydata,月==10,select=気温,drop=TRUE)) # 温度を取り出す
plot(temp) # 既定値は点(type="p")として描画
plot(temp, type="l", col="blue",ylim=c(0,30)) # y軸を制限，折れ線(type="l")
plot(temp, type="s", col="orange",
     xlab="day",ylab="temperature",main="Tokyo, Oct") # タイトル付き，階段(type="s")

## 関数の描画
curve(sin, 0, 4*pi, 
      col="blue", # グラフの線の色
      lwd=2, # グラフの線の太さ
      ylab="sin/cos" # y軸のラベル
      )
curve(cos, 
      add=TRUE, # グラフを上書き
      col="red", lwd=2)

## データ点の描画
(x <- seq(0, 2*pi, by=0.1)) # 0から2πの点列
(y <- sin(x) + rep_len(c(-0.2, 0.1), length(x)))
plot(x, y, type="p", pch="x", ylim=c(-2,2)) # ylimで値域を指定
points(x, y, col="green", pch=19) # 点を追加. pchは点の形を指定
curve(sin, add=TRUE, col="orange", lwd=2)
lines(x, y, col="blue") # 折れ線を追加

## データフレームを用いた散布図
par(family="HiraginoSans-W4") # 日本語フォントの指定 (MacOSXの場合)
plot(気温 ~ 日, data=subset(mydata,月==8), # 8月の気温の推移
     type="l", col="blue", lwd=2) # lwdは線の太さの倍率を指定
plot(気温 ~ 日射量, data=subset(mydata,月==8), # 8月の日射量と気温の関係
     pch="*", col="red", cex=2) # cexは点の大きさの倍率を指定
abline(lm(気温 ~ 日射量, data=subset(mydata,月==8)),
       col="blue",lwd=2) # 回帰直線を書く (詳しくは次回)
with(subset(mydata, 月==8), # withの中ではデータフレームの列名が使用可能
     scatter.smooth(日射量,気温,col="red",pch="*",cex=2,
                    lpars=list(col="blue",lwd=2))) # 滑らかな曲線の例
