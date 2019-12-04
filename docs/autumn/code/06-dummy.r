### 質的変数(カテゴリデータ)の取り扱い

### datasets::ToothGrowth による例
?ToothGrowth
## モルモットにビタミンC/オレンジジュースを与えた場合の歯の成長度を記録したデータ
example("ToothGrowth") # helpに付いている例を使ってデータを図示する

## ビタミンCとオレンジジュースで成長度に違いは出るか?
est1 <- lm(len ~ supp, data=ToothGrowth) 
summary(est1) 
## suppVC(ビタミンC=1のダミー変数)の係数が負のため
## オレンジジュースの方が効果が高いと予想される
## しかしながら係数は5%水準では有意でない

## 投与量も説明変数として加える
est2 <- lm(len ~ supp + dose, data=ToothGrowth) 
summary(est2)
## suppVC(ビタミンC=1のダミー変数)の係数が1%水準で有意となる
## これから「投与量が等しい」という条件下で効果を比較した場合
## オレンジジュースの方が効果が高いことを統計的に支持している

### 東京都の気候による例
## データの読み込み
mydata <- read.csv("tokyo-weather.csv",fileEncoding="utf8")

## 雨と気温の関係を分析
mydat1 <- transform(mydata, 降水=as.factor(降水量 > 0)) 
est1 <- lm(気温 ~ 降水, data=mydat1) # モデルの推定
summary(est1) # 年間では雨の日に気温が高いことは支持されない

## 東京では冬より夏の方が降水が多いことを考慮して月を表す変数をダミー化する
mydat2 <- transform(mydat1, 月=as.factor(月))
est2 <- lm(気温 ~ 降水 + 月, data=mydat2) 
summary(est2) # 月毎に比較すると雨の日の方が気温が低いことが支持される
