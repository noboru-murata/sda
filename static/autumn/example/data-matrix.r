### 行列の例 (ベクトルから行列を作成)
(A <- matrix(1:6,nrow=2,ncol=3)) # 列ごとに並べる
(B <- cbind(c(1,2),c(3,4),c(5,6))) # 列で結合する
(C <- matrix(1:6,nrow=2,ncol=3,byrow=TRUE)) # 行ごとに並べる
(D <- rbind(c(1,2,3),c(4,5,6))) # 行で結合する
dim(D) # 大きさを確認
(rownames(D) <- LETTERS[1:nrow(D)]) # 行に名前を付ける
(colnames(D) <- letters[1:ncol(D)]) # 列に名前を付ける
D # Dの内容を確認する
### データ例 datasets::volcano (詳細は help(volcano))
dim(volcano)     # 大きさを確認
volcano[1:3,1:5] # 左上の3行5列を表示
image(volcano)   # 濃淡図として表示
