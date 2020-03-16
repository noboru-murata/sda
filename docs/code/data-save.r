### 関数saveの使い方
(myDat1 <- subset(airquality, Temp>95, select=-Ozone)) 
(myDat2 <- subset(airquality, Temp<60, select=-Ozone)) 
dim(myDat1) # 大きさを確認
dim(myDat2) # 大きさを確認
save(myDat1,myDat2,file="mydata.rdata") # 書き出し
