###  第2回 演習 解答例

### 成績データフレームの作成
## 属性ごとのベクトルから作る
math <- c(90,80,70,60,50)
phys <- c(25,50,75,100,80)
chem <- c(65,100,70,40,75)
bio  <- c(70,50,30,80,100)
exdat <- data.frame(math,phys,chem,bio)
rownames(exdat) <- c("A","B","C","D","E")
exdat # 内容を表示して確認
## 個体ごとのベクトルから作る (注・全て数字だからできる)
A <- c(90,25,65,70)
B <- c(80,50,100,50)
C <- c(70,75,70,30)
D <- c(60,100,40,80)
E <- c(50,80,75,100)
exdat <- data.frame(rbind(A,B,C,D,E))
names(exdat) <- c("math","phys","chem","bio") 
exdat # 内容を表示して確認

### データのファイルの作成 (書き出し・読み込み)
## CSV形式
write.csv(exdat,file="exdata.csv")
exnew <- read.csv(file="exdata.csv",row.names=1)
exnew # 内容を表示して確認
## RData形式
save(exdat,file="exdata.RData")
rm(exdat) # データの削除 Environmentからも削除可能
exdat # 表示しようとしても無いのでエラーとなる
load(file="exdata.RData")
exdat # saveした名前で読み込まれている

### mtcars データフレームの操作 (抽出)
subset(mtcars, subset = am==0)
subset(mtcars, select = c(cyl,mpg,disp))
subset(mtcars, subset = hp >= 110 & wt < 3)

### mtcars データフレームの操作 (集計)
## 以下では式を用いた方法を紹介 (byを用いる方法もある)
## 式: 左辺(集計される属性) ~ 右辺(条件を決める属性)
## 気筒数ごとの排気量の集計
aggregate(disp ~ cyl, data=mtcars, FUN=mean)
aggregate(disp ~ cyl, data=mtcars, FUN=max)
aggregate(disp ~ cyl, data=mtcars, FUN=min)
## ギア数ごとの燃費の集計
## 関数を定義してまとめて集計する例
aggregate(mpg ~ gear, data=mtcars,
          FUN=function(x){ # mean/max/minからなるベクトル
              c(mean=mean(x),max=max(x),min=min(x))})
## 注・計算結果[,"mpg"] は mean,max,min を列とする行列なので
##     集計結果を取り出すときには注意が必要
## 気筒数・ギア数ごとの燃費の集計
aggregate(mpg ~ cyl + gear, data=mtcars, FUN=mean)
xtabs(mpg ~ ., # 表形式(分割表)に書き直す方法の例
      data=aggregate(mpg ~ cyl + gear, data=mtcars, FUN=mean))
## 集計する属性が複数の場合は以下のようにする
aggregate(cbind(disp, mpg) ~ cyl + gear, data=mtcars, FUN=mean)

### e-stat のデータを利用した例
## 政府統計の総合窓口 https://www.e-stat.go.jp
## FEI_PREF_191004182207.csv: 以下の例で用いるファイル 
## 上記サイトから "地域">"都道府県データ">"データ表示"を選択
## 地域区分"都道府県"から地域候補として47都道府県を選択
## データ種別"基礎データ"の"人口・世帯"および"自然環境"から
## "総人口"，"15歳未満人口"，"65歳以上人口"，"総面積"，"可住地面積"を
## 選択し，CSV形式でダウンロードしたもの
##
## ファイルの読み込み
rawdata <-
    read.csv(file="FEI_PREF_191004182207.csv",
             fileEncoding="sjis", # estatの文字コードはsjis
             skip=8) # 最初の8行にはデータ以外の情報が入っている
View(rawdata) # Environmentでrawdataをクリックしてもよい
mydata <- rawdata[,c(6,8,10,12,14)] # 必要な列だけ集約する
View(mydata)  # 作成するデータフレームを左上ペインに表示
rownames(mydata) <- rawdata[,4] # 行の名前を県名にする
names(mydata) <- # 列の名前を簡略化 (以降の計算のため)
    c("人口","若年","老年","面積","可住地")
areaname <- # 地方名を付加する
    c("北海道","東北","関東","中部","近畿","中国","四国","九州")
area <- rep(factor(areaname,levels=areaname), # 因子の順番を指定
            c(1,6,7,9,7,5,4,8)) # 地方ごとの都道府県数
mydata <- data.frame(mydata,地方=area)
## 人口密度や年齢比率などを計算して追加
perfdata <-
    within(mydata, { # 列の計算方法と代入先を列挙する
        人口密度 <- 人口/面積
        可住密度 <- 人口/可住地
        若年率 <- 若年/人口
        老年率 <- 老年/人口
        可住率 <- 可住地/面積
        rm(地方) # 列を除去
    })
View(perfdata)
## 同じ内容を地方別に計算
areadata <-
    within(aggregate(. ~ 地方, data=mydata, FUN=sum), {
        人口密度 <- 人口/面積
        可住密度 <- 人口/可住地
        若年率 <- 若年/人口
        老年率 <- 老年/人口
        可住率 <- 可住地/面積
    })
View(areadata)
