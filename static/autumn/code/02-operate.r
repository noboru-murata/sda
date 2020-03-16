### データフレームの操作
## 東京都の気候データによる例
mydata <- read.csv("tokyo-weather.csv",fileEncoding="utf8")
## 気象庁より取得 (http://www.data.jma.go.jp/)
## 年,月,日,平均風速(m/s),平均気温(℃),降水量の合計(mm),
##  合計全天日射量(MJ/㎡),平均現地気圧(hPa),平均雲量(10分比)
## 文字コードはutf，以下はsjisの場合の読み込み方 
##  mydata <- read.csv("tokyo-weather_sjis.csv",fileEncoding="sjis")
head(mydata,n=10) # 最初の10日分のデータを見る
tail(mydata,n=10) # 最後の10日分のデータを見る
mydata[mydata$月==10,] # 10月のデータを見る
subset(mydata, 月==10 & 日>=10 & 日<20) # 10月の中旬のデータを見る

### 集約統計量の計算
temp <- mydata$気温 # 気温を取り出す
mean(temp)   # 平均気温の計算
var(temp)    # 分散
median(temp) # 中央値
max(temp)    # 最大値
min(temp)    # 最小値

### 行・列ごとの操作
## 関数 apply の使い方
x <- subset(mydata, select=-c(年,月,日)) # 月日は除いておく
colMeans(x)     # 列ごとの平均
apply(x,2,mean) # 上と同じ
apply(x,2,max)  # 列ごとの最大値
sapply(x,max)   # 上と同じ
## 自作関数の適用
apply(x,2,function(x){sum(x>mean(x))}) # 列ごとに平均より大きいデータ数を計算

## 関数 aggregate の使い方
## 月ごとの各変数の平均値を求める
aggregate(mydata[-(1:3)], by=list(月ごと=mydata$月), FUN=mean) 
aggregate(x, by=list(月ごと=mydata$月), FUN=mean) # 上と同じ
aggregate( . ~ 月, data=subset(mydata, select=-c(年,日)), FUN=mean) # 上と同じ

##  月および降水の有無でグループ分け
aggregate(mydata[-(1:3)], FUN=mean,
          by=list(月=mydata$月, 降水の有無=(mydata$降水量>0))) 
aggregate(x,FUN=mean,by=list(月=mydata$月,降水の有無=(x$降水量>0))) # 上と同じ
