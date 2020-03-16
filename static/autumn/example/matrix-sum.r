(A <- matrix(1:6,nrow=2,ncol=3))   # 2x3行列の作成 
(B <- rbind(c(2,3,5),c(7,11,13)))  # 行ベクトル(row)を連結する 
(C <- cbind(c(0,0),c(0,1),c(1,0))) # 列ベクトル(column)を連結する
A + B - C
