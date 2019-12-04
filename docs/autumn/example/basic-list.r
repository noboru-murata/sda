### 関数listの使い方
(L1 <- list(c(1,2,5,4), matrix(1:4,2), c("Hello","World")))
## 各要素のデータ型はバラバラでよい
L1[[1]] # リストL1の第1要素を取り出す
L1[[2]][2,1] # リストの第2要素の(2,1)成分を取り出す
L1[[c(3,2)]] # リストの第3要素の2番目
L1[[3]][[2]] # 上と同じ
L1[1] # 第1要素をリストとして取り出す
L1[c(1,3)] # リストの複数要素を同時に取り出す
(L2 <- list(Info="統計データ解析", List=L1)) # 名前付きリストを生成する
L2[["Info"]] # 要素名で取り出す
L2$Info # 要素名で取り出す (別記法)
names(L1) <- c("vector","matrix","character") # L1の要素に名前をつける
L1 # 変更したリストを表示する
