### datasets::iris に対するk-平均法
## クラスラベルSpeciesを他の変数から正確に予測できるか検証
x <- subset(iris, select = -Species) # 変数の抽出
## k-平均法の実行
set.seed(123)
est <- kmeans(x, centers=3, # k=3
              nstart=20) # 初期値は20通り試す
## 結果の確認
table(iris$Species[est$cluster==1]) # setosa
table(iris$Species[est$cluster==2]) # virginica
table(iris$Species[est$cluster==3]) # versicolor
## クラスタリングの状況を散布図上で図示
plot(x,col=rainbow(3)[est$cluster])
## k-平均法の実行: データを標準化した場合
set.seed(123)
est <- kmeans(scale(x), centers=3, nstart=20)
## 結果の確認
table(iris$Species[est$cluster==1]) # setosa
table(iris$Species[est$cluster==2]) # virginica
table(iris$Species[est$cluster==3]) # versicolor
## 標準化しない方が良好な結果が得られている

## k-平均法の実行: k=2としてみた場合
set.seed(123)
est <- kmeans(x, centers=2, nstart=20) 
## 結果の確認
table(iris$Species[est$cluster==1]) # setosa
table(iris$Species[est$cluster==2]) # virginica/versicolor

### 総務省統計局の統計データによる例
mydata <- read.csv(file="data/japan-living.csv",
                   row.names=1,header=TRUE) 
## k-平均法の実行: 「八地方区分」を考慮してk=8を試す
set.seed(123)
est <- kmeans(scale(mydata), centers=8, nstart=20)
## 結果の確認 (各クラスター内の県名を表示)
perf <- rownames(mydata) # 県名の取得
perf[est$cluster==1] # 北関東, 静岡, 香川, 北部九州の多く, 沖縄
perf[est$cluster==2] # 東北・中部の一部, 近畿・中国の多く, 愛媛・大分
perf[est$cluster==3] # 南九州
perf[est$cluster==4] # 東北の一部, 北信越の多く, 滋賀・山口
perf[est$cluster==5] # 南四国, 山梨・和歌山
perf[est$cluster==6] # 北海道
perf[est$cluster==7] # 首都圏 + 大都市
perf[est$cluster==8] # 東京
## クラスタリングの状況を散布図上で図示
plot(mydata,col=rainbow(8)[est$cluster])
