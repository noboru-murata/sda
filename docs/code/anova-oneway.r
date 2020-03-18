### 一元配置分散分析
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
## 月ごとの気温に差があるか否かを分散分析
kikou$月 <- as.factor(kikou$月) # 因子扱いするために月をfactorに変換
par(family="HiraginoSans-W4") # 日本語フォントの指定
boxplot(気温 ~ 月, data=kikou, # 箱ひげ図で可視化
        col="lavender", main="月ごとの気温") 
(result <- aov(気温 ~ 月, data=kikou)) # 月ごとの気温差に関する分散分析
summary(result)  # 分散分析表の表示(棄却される)
model.tables(result, type="means")   # 水準(月)ごとの平均値
model.tables(result, type="effects") # 水準(月)ごとの効果
## 検定のみ実行する場合
oneway.test(気温 ~ 月, data=kikou, var.equal=TRUE) # 等分散での検定
oneway.test(気温 ~ 月, data=kikou) # Welchの近似法による検定
## 曜日ごとの気温に差があるか否かを分散分析
days <- as.Date(paste(2016, kikou$月, kikou$日, sep="-")) # 日付オブジェクト
youbi <- weekdays(days) # 各日付の曜日を計算
kikou2 <- cbind(kikou, 曜日=as.factor(youbi)) # 曜日因子を追加したデータセット
boxplot(気温 ~ 曜日, data=kikou2, # 箱ひげ図で可視化
        col="lavender", main="曜日ごとの気温") 
(result <- aov(気温 ~ 曜日, data=kikou2)) # 曜日ごとの気温差に関する分散分析
summary(result) # 分散分析表の表示(棄却されない)
model.tables(result, type="means")   # 水準(曜日)ごとの平均値
model.tables(result, type="effects") # 水準(曜日)ごとの効果
