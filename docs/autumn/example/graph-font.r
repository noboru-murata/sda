### 日本語フォントの指定
par(family = "HiraginoSans-W4") 
### 東京都の2016年の気候データによる例
### 気象庁のホームページより取得
### http://www.data.jma.go.jp/gmd/risk/obsdl/index.php
### 東京都の2016年の各日の平均気温(℃)・降水量(mm)・全天日射量(MJ/u)・
### 平均風速(m/s)を記録したデータセットkikou2016.csv
kikou <- read.csv("kikou2016.csv", fileEncoding = "sjis")
## 月ごとの平均をプロットする
(x <- aggregate(kikou[ ,-c(1,2)], by = list(月 = kikou$月), 
                FUN = "mean")) # 月ごとの平均を計算
plot(x$気温, type ="b", lwd=3, col="green", ylim=c(0, max(x$気温)),
     xlab="月", ylab="", main="2016年気候データ", # グラフタイトル
     axes=FALSE) # 軸を書かない
axis(1, 1:12, 1:12) # x軸の作成
axis(2) # y軸の作成
lines(x$降水量, type="h", lwd=3, col="blue")
lines(x$日射量, lwd=3, lty=2, col="red")
abline(0, 0, lwd=2, lty="dotted") #  y=0の線を引く
legend(1, 25, legend=c("気温","降水量","日射量"),
       col=c("green","blue","red"), lwd=3,
       lty=c(1,1,2))
