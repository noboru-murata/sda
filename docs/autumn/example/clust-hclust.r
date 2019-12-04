### datasets::iris に対する階層的クラスタリング
## クラスラベルSpeciesを用いずに他の変数から的確な分類ができるか検証
x <- subset(iris, select = -Species) # 変数の抽出
## 階層的クラスタリング (ユークリッド距離，最長距離法)
dst <- dist(x) # ユークリッド距離(euclidean)が既定値
est <- hclust(dst) # 最長距離法(complete)が既定値
plot(est, labels=c("s","e","i")[iris$Species])
## 階層的クラスタリング (マンハッタン距離，最長距離法)
dst <- dist(x, method="manhattan") 
est <- hclust(dst)
plot(est, labels=c("s","e","i")[iris$Species])
## 階層的クラスタリング (ユークリッド距離，群平均法)
dst <- dist(x) 
est <- hclust(dst, method="average")
plot(est, labels=c("s","e","i")[iris$Species])
## クラスタリングの評価
clust <- cutree(est,3) # 3つに類別
table(iris$Species[clust==1]) # setosa
table(iris$Species[clust==2]) # versicolor
table(iris$Species[clust==3]) # virginica

### 総務省統計局の統計データによる例
## http://www.stat.go.jp/data/shihyou/naiyou.htm
## 社会生活統計指標－都道府県の指標－2017 社会生活統計指標 2017年2月17日公表
## http://www.e-stat.go.jp/SG1/estat/List.do?bid=000001083999&cycode=0
## 1. Ratio of forest area
##    森林面積割合 [2014; %] 
## 2. Gross agricultural product per agricultural worker
##    就業者１人当たり農業産出額(販売農家）[2014; 万円]
## 3. Percentage distribution by prefecture
##    全国総人口に占める人口割合 [2015; %]
## 4. Land productivity
##    土地生産性（耕地面積１ヘクタール当たり）[2014; 万円]
## 5. Annual sales of commercial goods
##    商業年間商品販売額［卸売業＋小売業］（事業所当たり）[2013; 百万円]
mydata <- read.csv(file="data/japan-living.csv",row.names=1,header=TRUE) 
## 階層的クラスタリングの実行:
dst <- dist(scale(mydata)) # ユークリッド距離
est <- hclust(dst, method="ward.D2") # Ward法 (代表的な方法の一つ)
plot(est)
## 結果の確認 (各クラスター内の県名を表示)
clust <- cutree(est,8) # 「八地方区分」を考慮する
perf <- rownames(mydata) # 県名の取得
perf[clust==1] # 北海道
perf[clust==2] # 東北・中部の一部, 近畿・中国地方の多く, 愛媛・大分
perf[clust==3] # 関東の一部，福岡
perf[clust==4] # 北関東, 静岡, 香川, 九州北部, 沖縄 
perf[clust==5] # 東京
perf[clust==6] # 神奈川，愛知，大阪
perf[clust==7] # 山梨，和歌山，南四国
perf[clust==8] # 九州南部
