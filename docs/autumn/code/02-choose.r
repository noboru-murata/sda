### データフレームの操作
## 要素の選択
head(airquality) # データフレームairqualityの最初の6行を表示
airquality[2,3]  # 2行3列を取り出す
airquality[3, ]  # 3行目を取り出す 
airquality[c(2,4),]        # 2行目と4行目を取り出す
head(airquality[-c(2,4),]) # 2行目と4行目を取り除く
airquality[ ,4]  # 4列目を取り出す
airquality$Temp  # 列名で取り出す (上記の別記法)
head(airquality[4])       # 4列目だけからなるデータフレームを取り出す
head(airquality["Temp"])  # 列名で取り出す (上記の別記法)
head(airquality[c("Ozone","Temp")]) # 複数列の場合はベクトルで指定する

## 関数subsetの使い方
##  subset(dataframe, subset=条件, select=列)
## Ozoneが100を超える行を抽出 
subset(airquality, subset = Ozone > 100) 
## Ozoneが100を超える行で列名がWindとDayのデータ
subset(airquality, Ozone > 100, select = c(Wind,Day)) # 
## Ozoneが100を超える行で列名がWindからDayまでのデータ
subset(airquality, Ozone > 100, select = Wind:Day) # 
## Ozoneに欠測(NA)がなく, かつ(&;and) Dayが1か2のデータ
subset(airquality, !is.na(Ozone) & Day %in% c(1, 2))
## Ozoneが100以上か，または(|;or) Windが5以下のデータ
subset(airquality, Ozone > 100 | Temp <= 5) 
## Dayが1の行について，Temp以外の列を抽出
subset(airquality, Day == 1, select = -Temp) 
