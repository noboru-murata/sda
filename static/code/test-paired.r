### 平均の差の検定 (対応がある場合)
## データセットsleepによる例 (睡眠薬による睡眠時間の伸び)
(x <- subset(sleep, group==1, extra, drop=TRUE)) # group 1の睡眠時間の伸び
(y <- subset(sleep, group==2, extra, drop=TRUE)) # gropu 2の睡眠時間の伸び
t.test(x, y) # 対応を考慮しないt検定(Welchのt検定)
t.test(x, y, paired=TRUE) # 対応を考慮するt検定
t.test(x-y) # 対応を考慮する場合と同じ結果 
plot(x,y,xlim=range(x,y),ylim=range(x,y),
     main="scatter plot of sleep data")
abline(a=0,b=1,col="red",lwd=2)
