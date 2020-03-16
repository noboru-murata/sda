### 関数barplotによる棒グラフの作図
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis") 
## 月ごとに各変数の平均を計算
x <- aggregate(kikou[ ,-c(1,2)], by=list(月 = kikou$月), 
                FUN = "mean")
### 基本的な棒グラフ
barplot(x[,2], # 棒の高さのベクトル
        col="slateblue", # 棒の色の指定
        names.arg=x[,1], # x軸のラベル
        main=names(x)[2]) # タイトル
### 複数の棒グラフ
barplot(as.matrix(x[ ,-1]), # 第1引数はベクトルまたは行列
        col=rainbow(12)[c(8:1,12:9)], # 12色に色分け
        beside=TRUE, # 棒グラフを横に並べる
        space=c(1.5, 3), # 棒グラフ間・変数間のスペースを指定
        legend.text=paste0(x[ ,1], "月"), # 凡例の指定
        args.legend=list(ncol = 2)) # 凡例を2列にして表示
