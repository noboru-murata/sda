### コイン投げの賭け

## コイン投げの試行 (いろいろな書き方はある)
mytrial <- function(){ # 名前は何でも良い
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
for(i in 1:10) print(mytrial())

## Monte-Carlo実験
## set.seed(8888) # 実験を再現したい場合はシードを指定する
mc <- 10000 # 実験回数を設定 
mydata <- replicate(mc,mytrial()) 

## 簡単な集計
table(mydata)    # 頻度
table(mydata)/mc # 確率(推定値)
