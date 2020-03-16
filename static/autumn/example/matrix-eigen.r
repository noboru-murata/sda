(A <- matrix(c(1,-1,-1,1),2,2)) # 2x2行列
r <- eigen(A) # 結果は固有値と固有ベクトルからなるリスト
r$values  # 固有値
r$vectors # 固有ベクトルからなる行列
## r$vectors[,i] が r$values[i]に対する固有ベクトルに対応
t(r$vectors) %*% A %*% r$vectors # 対角化
