### 関数loadの使い方
(mydat1 <- subset(airquality, Ozone > 120)) # データフレームの作成
load(file="mydata.rdata") # RData形式の読み込み
mydat1 # saveしたときの名前で読み込まれ上書きされる
mydat2
