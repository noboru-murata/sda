### 条件分岐 (if)
x <- 5
if(x > 0) { # 正か否か判定
    ## 条件が真の場合に実行するブロック
    print("positive")
} else {
    ## 条件が偽の場合に実行するブロック
    print("negative")
}
## else以下はなくても動く
if(x > 0) {
  print("positive")
}
## 評価が簡便な場合の条件分岐 (ifelse)
ifelse(x < 0, "true","not true")
### 繰り返し (for)
y <- 0
for(i in 1:10) { # 1-10の合計を計算
    y <- y + i
}
print(y)
### 繰り返し (while)
z <- 1
n <- 0
while(z < 100) { # 100未満の間は2倍し続ける
    z <- 2 * z 
    n <- n + 1
}
print(z) # 100を超えた際のzの値
print(n) # 条件を満たすまでの回数
