###
### 宿題と質問への回答 (第4回)
###   (宿題の答えは最後にあります)

## 質問
## aggregate( . ~ A, ...) の ". ~ A" の使い方が良く分りません．

## 回答
## ". ~ A" のような表記は R では formula(式) と呼ばれます．

## "y=f(x)"" のような関数の表記を思い浮かべてもらうと良いですが
## R では "左辺 = 右辺" と書く代わりに "左辺 ~ 右辺" と書き
## "~" (チルダ;tilde) を "=" の代わりに使います．
## 左辺を目的変数(従属変数)，右辺を説明変数(独立変数)と呼ぶこともあり
## 右辺を用いて計算した結果が左辺になると考えれば良いです

## formulaにおいて "." (ピリオド) は特殊な扱いをされ
## そこに明記されていない変数全てを表します．

## 具体的に例を見てみましょう．以下一行ずつ実行して，内容を確認して下さい．
## code menu の "run selected lines" (short cut あり)が利用できます．
## windowsの場合は par(family="HiraginoSans-W4") を comment out して下さい．

## covid19_tokyo.csv を用いて説明します．
## まずデータを読み込みます．
myData <- read.csv(file="data/covid19_tokyo.csv",fileEncoding="utf8")
## データの最初の6行は以下のとおりです．
head(myData)
## 各列の名前は以下のとおりです．
names(myData)
## データの型は以下のとおりで，各列が数値であったり文字であったりします．
str(myData)
## 月ごとの陽性患者数の集計を考えてみましょう．
(x1 <- aggregate(陽性患者数 ~ 月, FUN=sum,
               data=myData))
## 右辺の変数(月)で条件付けた左辺の変数(陽性患者数)の計算結果(sum)が得られます．
## 目的の変数に検査実施人数を加えてみましょう．
## これには列ベクトルをbindするcbindを使います．
## データフレームの"陽性患者数"の列と"検査実施人数"の列を並べるという意味です．
(x2 <- aggregate(cbind(陽性患者数, 検査実施人数) ~ 月, FUN=sum,
                 data=myData))
## 計算したい列を列挙すれば多数の目的変数に関して集計が行えますが，
## 列が多い場合には面倒です．
## こうした場合は "." を利用することができます．
## subsetで不要な列(日と曜日)を除いた上で，多数の列に関して集計を行います．
(x3 <- aggregate(. ~ 月, FUN=sum,
                 data=subset(myData,select=-c(日,曜日))))
## なお，日については意味があるかどうかは別として sum を計算することはできますが，
## 曜日については文字列なので sum の計算はできないので，除かないとエラーになります．
## 条件を増やす場合は，右辺に "+" で追加します．左辺とは違う記号を使うことに注意して下さい． 
(x4 <- aggregate(. ~ 月 + 曜日, FUN=sum,
                 data=subset(myData,select=-日)))
## 条件の順番により集計表の並びは変わりますが，内容は一緒です．
(x5 <- aggregate(. ~ 曜日 + 月, FUN=sum,
                 data=subset(myData,select=-日)))
## 曜日の並び順は文字列のコード順(アルファベット順みたいなもの)なので，
## 我々の感覚にはそぐわない並び方になることがしばしばです．
## 日曜から土曜の順に並べたい場合は factor という属性を使います．
## 曜日の列は文字列 (""で囲まれている) です．
myData$曜日
## これを関数 factor() を使って変換 (""で囲まれない) します．
## levels で渡した順序が factor の順になります．
factor(myData$曜日,levels=c("日","月","火","水","木","金","土"))
## 曜日の列を factor で置き換えて処理をすると以下のようになります．
myData$曜日 <- factor(myData$曜日,levels=c("日","月","火","水","木","金","土"))
(x6 <- aggregate(. ~ 曜日 + 月, FUN=sum,
                 data=subset(myData,select=-日)))
## 期待どおりの並びになっていることがわかります．
## 日曜から土曜の文字列ベクトルを直接書き下すかわりに，以下のようにすることもできます
myData$曜日[5:11] # 適当なところを切り出す
factor(myData$曜日,levels=myData$曜日[5:11])
myData$曜日 <- factor(myData$曜日,levels=myData$曜日[5:11])
## boxplot も factor に書き換えたデータフレームを用いると
## 期待どおりの並び順を実現できます．
par(family="HiraginoSans-W4") # 日本語表示
boxplot(検査実施件数 ~ 曜日, data=myData, col=cm.colors(7))

## 別の例として jpdata を用いたものを示しておきます．
myData <- read.csv(file="data/jpdata1.csv",fileEncoding="utf8",row.names=1)
myArea <- read.csv(file="data/jpdata3.csv",fileEncoding="utf8")
x <- data.frame(divorce=myData$離婚,
                area=factor(myArea$地方,levels=unique(myArea$地方)))
## uniqueはベクトルの中で同じものを削って，ユニークなものだけのベクトルを生成
## データに現れる地方名の順で factor に順序を指定していることになります
boxplot(divorce ~ area, data=x, col=rainbow(8), ylab="人口1000人あたりの離婚数")

