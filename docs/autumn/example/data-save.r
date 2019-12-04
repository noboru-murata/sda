### 関数saveの使い方
(mydat1 <- subset(airquality, Temp>95, select=-Ozone)) # データフレームの作成
(mydat2 <- subset(airquality, Temp<60, select=-Ozone)) # データフレームの作成
dim(mydat1) # 大きさを確認
dim(mydat2) # 大きさを確認
save(mydat1,mydat2,file="mydata.rdata") # RData形式で書き出し
