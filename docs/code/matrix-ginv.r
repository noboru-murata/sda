### 一般化逆行列
library(MASS) # MASS パッケージを読み込む
(C <- matrix(rnorm(6),
             nrow=2,ncol=3)) # ランダムに2x3行列を作成
(D <- ginv(C)) # 一般化逆行列の計算
C %*% D %*% C  # CC^+C=C であることを確認
