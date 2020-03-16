(a <- rnorm(6)) # 標準正規乱数でベクトルを作成
sqrt(a %*% a) # l2ノルム (計算結果は行列型で表示される)
as.vector(sqrt(a %*% a)) # l2ノルム (ベクトル型に変換)
sum(abs(a)) # l1ノルム
sum(abs(a)^2)^(1/2) # lpノルム (p=2)
sum(abs(a)^3)^(1/3) # lpノルム (p=3)
max(abs(a)) # 最大ノルム
