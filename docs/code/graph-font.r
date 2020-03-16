### 日本語フォントの指定
par(family="HiraginoSans-W4") 
### 東京都の気候データによる例 (tokyo_weather.csv)
## 気象庁のホームページより取得
## https://www.data.jma.go.jp/gmd/risk/obsdl/
## 地点・東京における平均気温(℃)・降水量(mm)など
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(月,気温,降水量,日射量,風速))
## 月ごとの平均をプロットする
(x <- aggregate( . ~ 月, data=myData, FUN=mean))
plot(x$気温, type ="b", # 点と線 (both)
     lwd=3, col="green", # 太さと色
     ylim=c(0, max(x$気温)+2), # y軸の範囲を限定
     xlab="月", ylab="平均値", main="東京都の気候", 
     axes=FALSE) # 軸を書かない
axis(1, 1:12, 1:12) # x軸の作成
axis(2) # y軸の作成
lines(x$降水量, type="h", lwd=3, col="blue")
lines(x$日射量, lwd=3, lty=2, col="red")
abline(h=0, lwd=2, lty="dotted") #  y=0の線を引く
legend(1, 28, # 凡例の位置を左上の座標で指定
       legend=c("気温","降水量","日射量"),
       col=c("green","blue","red"),
       lty=c(1,1,2), lwd=3)
