###
### 質問への回答 (第2回)
###

## 質問
## if文を重ねるとき python のelif のような構文はないのですか？

## 回答  
## 残念ながら，ありません．
## 多重分岐については工夫することができます．

## 例
## 試験の結果から成績を計算する関数を考える

## if文を重ねる場合
grade1 <- function(score){
    if(score < 60) {
        print("D")
        print("再履修して下さい")
    } else {
        if(score < 70) {
            print("C")
            print("しっかり頑張りましょう")
        } else {
            if(score < 80) {
                print("B")
                print("もう少し頑張りましょう")
            } else {
                if(score < 90) {
                    print("A")
                    print("よくできました")
                } else {
                    print("S")
                    print("すばらしい")
                }
            }
        }
    }
}
## 入れ子で美しくないが期待どおり動きます
## 実行例
grade1(50)
grade1(65)
grade1(75)
grade1(85)
grade1(100)

## 返り値が単純であればifelseという関数を利用することもできる
grade2 <- function(score){
    ifelse(score < 60,
           "D",
    ifelse(score < 70,
           "C",
    ifelse(score < 80,
           "B",
    ifelse(score < 90,
           "A",
           "S")))) # ここが美しくない
}
## 実行例
grade2(50)
grade2(65)
grade2(75)
grade2(85)
grade2(100)
## こんなこともできる
grade2(c(50,65,75,85,100))
grade1(c(50,65,75,85,100)) # 最初しか計算してくれない

## 以下は条件分岐をまとめる方法の1つ
score <- 75 # 適当な値を入れて以下の挙動を確認
## 条件の真偽を判定
c(score<60,
  score>=60 & score<70,
  score>=70 & score<80,
  score>=80 & score<90,
  score>=90)
## 合致した条件の番号を取得
which(c(score<60,
        score>=60 & score<70,
        score>=70 & score<80,
        score>=80 & score<90,
        score>=90))
## switch文を利用
switch(which(c(score<60,
               score>=60 & score<70,
               score>=70 & score<80,
               score>=80 & score<90,
               score>=90)),
       "D", # 1のとき
       "C", # 2のとき
       "B", # 3のとき
       "A", # 4のとき
       "S") # 5のとき
## 条件の順序を考えるともう少しサボれる
c(score<60,score<70,score<80,score<90)
which(c(score<60,score<70,score<80,score<90))
min(which(c(score<60,score<70,score<80,score<90)))
## 以下だと破綻するのでちょっと工夫
score <- 100
min(which(c(score<60,score<70,score<80,score<90)))
min(which(c(score<60,score<70,score<80,score<90)),
    5,na.rm=TRUE) # 条件に合わない場合は5にする
switch(min(which(c(score<60,
                   score<70,
                   score<80,
                   score<90)),
           5,na.rm=TRUE),
       "D",
       "C",
       "B",
       "A",
       "S")
## ベクトルを使えば出力も変えることはできる
switch(min(which(c(score<60,
                   score<70,
                   score<80,
                   score<90)),
           5,na.rm=TRUE),
       c(grade="D",comment="再履修して下さい"),
       c(grade="C",comment="しっかり頑張りましょう"),
       c(grade="B",comment="もう少し頑張りましょう"),
       c(grade="A",comment="よくできました"),
       c(grade="S",comment="すばらしい"))
## 関数化
grade3 <- function(score){
    switch(min(which(c(score<60,
                       score<70,
                       score<80,
                       score<90)),
               5,na.rm=TRUE),
           c(grade="D",comment="再履修して下さい"),
           c(grade="C",comment="しっかり頑張りましょう"),
           c(grade="B",comment="もう少し頑張りましょう"),
           c(grade="A",comment="よくできました"),
           c(grade="S",comment="すばらしい"))
}

## 実行例
grade3(50)
grade3(65)
grade3(75)
grade3(85)
grade3(100)
## こんなこともしたい
grade3(c(50,65,75,85,100)) # 最初しか計算してくれない
sapply(c(50,65,75,85,100),grade3) # applyの一種

## &/| と &&/|| の注意
## &/| は要素毎の評価で，&&/|| は左側1つだけ評価
## 以下のように異なる
c(T,T,F) & c(F,T,F)
c(T,T,F) && c(F,T,F)
c(T,T,F) | c(F,T,T)
c(T,T,F) || c(F,T,T)
c(T,T,F) & c(T,F,T,F) # 長さが違うと怒られる
c(T,T,F) && c(T,F,T,F) 
