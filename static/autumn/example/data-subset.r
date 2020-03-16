### 関数subsetの使い方
###  subset(dataframe, subset=条件, select=列)
## Ozoneが100を超える行を抽出 
subset(airquality, subset = Ozone>100) 
## Ozoneが100を超える行で列名がWindとDayのデータ
subset(airquality, Ozone>100, select=c(Wind,Day)) # 
## Ozoneが100を超える行で列名がWindからDayまでのデータ
subset(airquality, Ozone>100, select=Wind:Day) # 
## Ozoneに欠測(NA)がなく, かつDayが1か2のデータ (AND)
subset(airquality, !is.na(Ozone) & Day %in% c(1, 2))
## Ozoneが100以上か，またはWindが5以下のデータ (OR)
subset(airquality, Ozone>100 | Wind <= 5) 
## Dayが1の行について，Temp以外の列を抽出
subset(airquality, Day == 1, select = -Temp) 
