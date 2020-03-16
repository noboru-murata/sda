### 階乗を計算する関数
fact <- function(n){ # 素直に計算
    ifelse(n>0,prod(1:n),1)
}
fact2 <- function(n){ # 再帰的に定義
    if(n>0) {
        return(n*fact2(n-1)) # 自分を呼び出す
    } else {
        return(1) # fact2(0) = 0! = 1
    }
}
fact(10)  # 同じ結果になるか確認する
fact2(10) 
