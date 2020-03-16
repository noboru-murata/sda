(A <- matrix(1:6,nrow=2)) # 2x3行列
s <- svd(A) # 結果は特異値と行列U,Vからなるリスト
s$d # 特異値
s$u # 行列U
s$v # 行列V
s$u %*% diag(s$d) %*% t(s$v) # 行列Aの再現
