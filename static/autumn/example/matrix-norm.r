(A <- matrix(c(1,0,0,0,2,0,1,-1,-3,0,0,0),nrow=3,ncol=4)) # 3x4行列
norm(A,type="O") # 作用素ノルム (p=1; one norm)
norm(A,type="I") # 作用素ノルム (p=infinity; infinity norm)
norm(A,type="F") # Frobeniusノルム (Frobenius norm)
norm(A,type="M") # 最大ノルム (max norm)
norm(A,type="2") # スペクトルノルム (spectral norm; 2-norm)
