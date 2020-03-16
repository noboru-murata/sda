### 関数pieによる円グラフの作図
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(月,気温,降水量,日射量,風速))
z <- hist(myData$日射量, breaks=5, # 5つ程度に分類
          plot=FALSE) # ヒストグラムのビンの情報のみ取得
x <- z$count  # 各ビンの頻度
y <- z$breaks # ビンの境界(ビンの数より1つ多い)
names(x) <- paste(y[-length(y)], y[-1], sep="-")
### 基本的な円グラフ
pie(x, col=gray(seq(0,1,length=length(x))))
### 向きと色を調整
pie(x,
    clockwise=TRUE, # 時計まわりで12時から描画
    col=heat.colors(length(x)),
    main="東京の日射量", sub="日射ごとの日数割合")
