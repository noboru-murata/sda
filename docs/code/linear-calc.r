(A <- matrix(1:16,nrow=4,ncol=4))
(b <- rnorm(4))
A %*% b # 列ベクトルとして計算
b %*% A # 行ベクトルとして計算
