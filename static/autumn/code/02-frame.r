### データフレームの作成
## 各項目が同じ長さのベクトルを並べる
(x <- data.frame( 
     月=c(4,5,6,7),            
     価格=c(900,1000,1200,1100),
     取引量=c(100,80,50,75)))
x[2,3]  # 2行3列を取り出す
x[3, ]  # 3行目を取り出す
x[ ,2]  # 2列目を取り出す

## 行・列の名前の操作
rownames(x) # 行の名前を表示する
rownames(x) <- c("apr","may","jun","jul") # 行の名前を変更する
colnames(x) # 列の名前を表示する
colnames(x) <- c("month","price","deal") # 列の名前を変更する
x # 変更されたデータフレームを表示する
x["may","price"] # 特定の要素を名前で参照する

## データフレームを結合する
(y <- data.frame( 
     month=c(8,9,10), # 月
     price=c(1300,1400,1000),    # 価格
     deal=c(90,120,60)))         # 取引量
rownames(y) <- c("aug","sep","oct")
rbind(x,y) # 行を連結する 

(z <- data.frame(
     var=c(+200,-300,+250,-50))) # 変動
cbind(x,z) # 列を連結する
data.frame(x,z) # 上と同じ
