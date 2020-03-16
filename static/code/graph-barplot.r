### 関数barplotによる棒グラフの作図
par(family="HiraginoSans-W4") 
myData <- subset(read.csv("data/tokyo_weather.csv",
                          fileEncoding="utf8"), 
                 select=c(月,気温,降水量,日射量,風速))
x <- aggregate( . ~ 月, data=myData, FUN=mean)
### 基本的な棒グラフ
barplot(x[,2], # 棒の高さのベクトル
        col="slateblue", # 棒の色の指定
        names.arg=x[,1], # x軸のラベル
        main=names(x)[2]) # タイトル
### 複数の棒グラフ
barplot(as.matrix(x[,-1]), # 第1引数はベクトル/行列
        col=rainbow(12)[c(8:1,12:9)], # 12色に色分け
        beside=TRUE, # 棒グラフを横に並べる
        space=c(.5, 3), # 棒間・変数間のスペースを指定
        legend.text=paste0(x[ ,1], "月"), # 凡例の指定
        args.legend=list(ncol=2)) # 凡例を2列にして表示
