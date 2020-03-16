### コイン投げの賭け
## コイン投げの試行
## いろいろな書き方があるが，まずはベタに書いてみる
myTrial <- function(){ # 名前は何でも良い
    while(TRUE){ # 永久に回るループ
        if(rbinom(1,size=1,prob=0.5)==1){
            return("A") # Aが表を出して終了
        }
        if(rbinom(1,size=1,prob=0.5)==1){
            return("B") # Bが表を出して終了
        }
        ## どちらも裏ならもう一度ループ
    }
}

## 試行を行ってみる
myTrial()
myTrial()
myTrial()

## Monte-Carlo simulation
## set.seed(8888) # 実験を再現する場合はシードを指定
mc <- 10000 # 回数を設定 
myData <- replicate(mc,myTrial()) 

## 簡単な集計
table(myData) # 頻度
table(myData)/mc # 確率(推定値)
