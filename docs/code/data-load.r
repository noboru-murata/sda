### 関数loadの使い方
(myDat1 <- subset(airquality, Ozone > 120)) 
load(file="mydata.rdata") # 読み込み
myDat1 # saveしたときの名前で読み込まれ上書きされる
myDat2
