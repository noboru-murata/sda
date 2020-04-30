score <- 90
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

ifelse(score < 60,
       "D",
ifelse(score < 70,
       "C",
ifelse(score < 80,
       "B",
ifelse(score < 90,
       "A",
       "S"))))

c(score<60,
  score>=60 && score<70,
  score>=70 && score<80,
  score>=80 && score<90,
  score>=90)

which(c(score<60,
        score>=60 && score<70,
        score>=70 && score<80,
        score>=80 && score<90,
        score>=90))

switch(which(c(score<60,
               score>=60 && score<70,
               score>=70 && score<80,
               score>=80 && score<90,
               score>=90)),
       "D", # 1のとき
       "C", # 2のとき
       "B", # 3のとき
       "A", # 4のとき
       "S") # 5のとき

switch(which(c(score<60,
               score>=60 && score<70,
               score>=70 && score<80,
               score>=80 && score<90)),
       "D",
       "C",
       "B",
       "A",
       "S") # あてはまらないとき

c(score<60,score<70,score<80,score<90)
which(c(score<60,score<70,score<80,score<90))
min(which(c(score<60,score<70,score<80,score<90)))
switch(min(which(c(score<60,
                   score<70,
                   score<80,
                   score<90))),
       "D",
       "C",
       "B",
       "A",
       "S")

switch(min(which(c(score<60,
                   score<70,
                   score<80,
                   score<90))),
       {print("D");print("再履修")},
       {print("C");print("しっかり")},
       "B",
       "A",
       "S")

