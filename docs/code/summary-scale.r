### データの標準化 (気候データによる例)
kikou <- read.csv("kikou2016.csv", fileEncoding="sjis") # データの読み込み
dat <- subset(kikou, select=-c(月, 日)) # 月日は計算対象から削除
head(dat)
dat.std <- scale(dat) # 各変数ごとに標準化
head(dat.std)
colMeans(dat.std) # 各変数の平均が0であることの確認
apply(dat.std, 2, "sd") # 各変数の標準偏差が1であることの確認

