### 関数write.csvの使い方
(mydata <- subset(airquality, Ozone>90, select=-Temp)) # データフレームの作成
dim(mydata) # 大きさを確認
write.csv(mydata,file="mydata.csv") # csvファイルとして書き出し
