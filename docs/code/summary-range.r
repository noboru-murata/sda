### 範囲に関する統計量
## 気候データによる例
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis")
dat <- subset(kikou, select=-c(月, 日)) # 月日は計算対象から削除
range(dat$気温) # 最小値と最大値を計算
diff(range(dat$気温)) # 範囲を計算
apply(dat, 2, function(x) diff(range(x))) # 変数ごとの範囲
apply(dat, 2, "IQR") # 変数ごとの四分位範囲
apply(dat, 2, "mad", constant = 1) # 変数ごとのメディアン絶対偏差
apply(dat, 2, "sd") # 変数ごとの標準偏差
