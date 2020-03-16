### ファイルの操作
## 02-frame.r で作ったx,yを利用する
(mydata <- rbind(x,y))

### CSV形式の操作
## 関数 write.csv の使い方
dim(mydata) # 大きさを確認
write.csv(mydata,file="mydata.csv") # csvファイルに書き出し
## 関数 read.csv の使い方
(newdata <- read.csv(file="mydata.csv",row.names=1)) # csvファイルから読み込み
dim(newdata) # 大きさを確認

### Rdata形式の操作
## 関数 save の使い方
save(mydata,x,y,file="mydata.rdata") # RData形式で書き出し
## 関数 load の使い方
(x <- c(1,2,3)) # xを上書きしておく
rm(y) # yを消しておく
y # "オブジェクト 'y' がありません"というエラーになる 
load(file="mydata.rdata") # RData形式の読み込み
mydata 
x 
y 
