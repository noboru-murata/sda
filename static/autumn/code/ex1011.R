###  第3回 演習 解答例

### sleepデータによる例
help(sleep) # ヘルプを表示
head(sleep) # 内容を確認
tail(sleep) # 内容を確認

## 以下ではエラーとなる
x <- subset(sleep, group==1, extra)
y <- subset(sleep, group==2, extra)
plot(x,y)
## 必要なベクトルを取得 (drop=TRUEはベクトル化)
x <- subset(sleep, group==1, extra, drop=TRUE) 
y <- subset(sleep, group==2, extra, drop=TRUE)
plot(x,y, col="blue",pch=4,
     main="sleep data",xlab="group 1",ylab="group 2")
## データフレームも利用可能
xy <- data.frame(
    group1=subset(sleep, group==1, extra, drop=TRUE),
    group2=subset(sleep, group==2, extra, drop=TRUE))
plot(xy, col="blue",pch=4, # x軸=1列目，y軸=2列目
     main="sleep data",xlab="group 1",ylab="group 2")
plot(group1 ~ group2, xy, col="blue",pch=4, # y軸 ~ x軸
     main="sleep data",xlab="group 2",ylab="group 1")

### 確率的な事象の実験
## 簡単な双六
## * ゴールまでの升目は100
## * さいころを振り出た目の数だけ進む
## * ゴールに辿り着くまで繰り返す
## さいころを振る回数の分布は?

## 双六の試行
mytrial <- function(){
    step <- 0 # 最初の位置
    num <- 0  # さいころを振る回数
    while(TRUE){ # 永久に回るループ
        step <- step + sample(1:6,1) # さいころを振る
        num <- num + 1 # 回数を記録
        if(step >= 100) { # ゴールしたか?
            return(num) # 回数を出力して関数を終了
        }
    }
}

## 試行を行ってみる
for(i in 1:10) print(mytrial())

## Monte-Carlo実験
set.seed(12345)
mc <- 10000 # 実験回数を設定 
mydata <- replicate(mc,mytrial()) 
hist(mydata) # ヒストグラムを出力
summary(mydata) # 簡単な集計
