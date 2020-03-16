### 主成分分析

### datasets::attitude による例
## ある金融機関の30の部署の事務職員への管理者の態度に関するアンケート調査
## 以下の7つの質問に対する好意的な回答の百分率
## rating:     全体的な評価
## complaints: 職員の苦情への対処
## privileges: えこひいきしていないか
## learning:   学習の機会はあるか
## raises:     仕事にみあった昇給をしているか
## critical:   批判的すぎないか
## advance:    昇進の機会はあるか

## データの図示
boxplot(attitude, col="green")     # 箱ひげ図
plot(attitude, pch=4, col="red") # 散布図
## データの整形: ratingは全体の特徴量に相当するので分析から除外
mydata <- subset(attitude, select=-rating) 
## 主成分分析
est <- prcomp(mydata) 
est$rotation # 各主成分方向を列ベクトルとする行列
## 主成分方向から読み取れること:
## 第1: 全変数の符号が同じ，全体の傾向を表す方向
## 第2: 正の向きに管理者の能力，負の向きに職員の待遇
## 第3: 正の向きにポジティブな項目, 負の向きにネガティブな項目

## 主成分得点の計算
pc <- predict(est) 
head(pc) # 一部を表示
plot(attitude$rating ~ pc[,1], # ratingと第1主成分の関係を図示
	xlab="PC1", ylab="rating", pch=4, col="blue") 

## 上と同じ分析を別の書き方で実行
prcomp( ~ . - rating, data=attitude) 
## 変数の正規化: 各変数をその標準偏差で割る．結果は変わる．
prcomp(mydata,scale.=TRUE) 
## 各変数のばらつきに大きな違いがある場合, ばらつきが大きい変数の効果を
## 重視してしまうことになるため, 全変数を同等に扱う必要がある

### 総務省統計局の統計データによる例
### http://www.stat.go.jp/data/shihyou/naiyou.htm
## 社会生活統計指標－都道府県の指標－2017 社会生活統計指標 2017年2月17日公表
## http://www.e-stat.go.jp/SG1/estat/List.do?bid=000001083999&cycode=0
## 森林面積割合 Ratio of forest area (%) 2014
## 就業者１人当たり農業産出額(販売農家）Gross agricultural product per agricultural worker
##         (commercial farm households) (万円:10 thousand yen) 2014
## 全国総人口に占める人口割合 Percentage distribution by prefecture (%) 2015
## 土地生産性（耕地面積１ヘクタール当たり）Land productivity
##         (per hectare of cultivated land area) (万円:10 thousand yen) 2014
## 商業年間商品販売額［卸売業＋小売業］（事業所当たり）Annual sales of commercial goods
##     [wholesale and retail trade] (per establishment) (百万円:million yen) 2013

## データの読み込み
mydata <- read.csv(file="japan-living.csv", row.names=1, header=TRUE)
head(mydata) # データの一部を表示
boxplot(mydata, col="green") # データの図示．変数のばらつきに大きな違いがある
(est <- prcomp(mydata,scale=TRUE))
## 主成分方向から読み取れること:
## 第1: 人の多さに関する成分(正の向きほど人が多い)
## 第2: 農業生産力に関する成分(正の向きほど高い)
