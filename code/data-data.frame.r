### データフレームの例 (ベクトルから行列を作成)
(A <- data.frame(height=c(172,158,160),
                 weight=c(60,53,51)))
(B <- matrix(1:8,nrow=4,ncol=2)) 
(C <- data.frame(B)) # 行列から作ることもできる
(rownames(C) <- letters[1:nrow(C)]) # 行名を付ける
(names(C) <- c("Left","Right")) # 列名を付ける
C # 内容を確認する    
### データ例 datasets::airquality (help(airquality))
dim(airquality)      # 大きさを確認
names(airquality)    # 列の名前を表示
head(airquality,n=5) # 最初の5つのデータを表示
plot(airquality)     # 散布図を表示
ts.plot(airquality)  # 時系列として表示
subset(airquality, Ozone>100) # 条件を満たす部分集合
subset(airquality, Ozone>100, select=Wind:Day) 
