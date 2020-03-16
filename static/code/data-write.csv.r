### 関数write.csvの使い方
(myData <- subset(airquality, # データフレームの作成
                  Ozone>90, select=-Temp)) 
dim(myData) # 大きさを確認
write.csv(myData,file="myData.csv") # 書き出し
