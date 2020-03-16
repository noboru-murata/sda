
### car package を用いた回帰分析の診断の例
### 詳しい解説は以下を参照
###  An R Companion to Applied Regression, Second Edition
###     John Fox and Sanford Weisberg
###        Sage Publications, 2011

### car package の読み込み
require(car)

### データの読み込み ("datasets::mtcars"を用いる)
data(mtcars)  # データの読み込み
help(mtcars)  # 内容の詳細を表示
str(mtcars)   # データの構造を表示
head(mtcars)  # データの一部を表示
with(mtcars,table(cyl)) # カテゴリカルデータの割合を表示

### データの基本的なプロット例 
## 変量間の散布図
pairs(mtcars, main = "mtcars data")
## 気筒数(cyl)毎の燃費(mpg)と排気量(disp)の関係
coplot(mpg ~ disp | as.factor(cyl), 
       data=mtcars, panel=panel.smooth, rows = 1)
## データ毎の変量の値 
palette(rainbow(12, s = 0.6, v = 0.75))
stars(mtcars[, 1:7], len = 0.8, key.loc = c(12, 1.5),
      main = "Motor Trend Cars", draw.segments = TRUE)
palette("default")

### 線形回帰モデルの作成
## 目的変数: 燃費(mpg)
## 説明変数: 排気量(disp)，馬力(hp)，重さ(wt)，ギア比(drat)
## (馬力と重さが有意，排気量は不合理な結果で有意性も低い悪いモデル)
est <- lm(mpg ~ disp + hp + wt + drat, data=mtcars)
##
## その他，以下のモデルなども考えられるので比較せよ
## AICを用いたstepwise法により選択されたモデル
##   est <- step(lm(mpg ~ ., data=mtcars))
## 変数を変換して作成したモデル (hp/wtはpower-weight ratio)
##   mydata <- with(mtcars,
##              data.frame(gpm=1/mpg,pwr=hp/wt,mtcars[,c(5:11)]))
##   est <- step(lm(gpm ~ ., data=mydata))
##                                 
summary(est) # 分析結果のまとめ

### 残差(Studentized residual)の性質
## residual plot (各説明変数および予測値と残差の関係)
## モデルが正しければ残差は予測値や説明変数とは独立になるはず
## 出力は lack-of-fit test (2乗項を含むかどうかのt検定)
residualPlots(est)
## (drat 以外は値により残差に偏りが見られる)
## terms option の与え方でいろいろな図が作成できる
residualPlots(est, terms= ~ wt) # 重さ(wt)と残差の関係のみ
residualPlots(est, terms= ~ 1)  # 予測値と残差の関係のみ
residualPlots(est, terms= ~ 1 | cyl ) # 気筒数ごとの関係
## (残差の偏りとcylに関係性が見られる)

## marginal-model plots (各説明変数と目的変数およびモデルの関係)
## residualPlotsの変種で，残差の変わりに目的変数を縦軸に用いて
## 予測値や説明変数での条件付周辺分布を視覚化する
## モデルが正しければデータとモデルの条件付平均は一致するはず
marginalModelPlots(est, id.n=2)
## (hpやwtは2つの平均が明瞭に交差している)

## added-variable/partial regression plot
##  (各説明変数と目的変数をその他の変数で回帰したときの残差の関係)
## 偏回帰 (以下の2つの回帰)
##  y  ~ x2 + ... + xp 
##  x1 ~ x2 + ... + xp
## の残差の散布図を用いて，説明変数と目的変数の関係を視覚化する
avPlots(est, id.n=2)
## (hpは線形関係というより反比例(双曲線)の関係が示唆される)

### モデルに合致しないデータ
## QQ plot (正規分布から逸脱する残差を調べる)
qqPlot(est, envelope=.99, id.n=2)
## 最大正規化誤差のt-検定(Bonferroniの補正)
outlierTest(est)
## テコ比を表示
hatvalues(est)
## 各データの Cook's dist., Studentized residual,
## Bonferroni p-value, hat-value (テコ比)を表示
influenceIndexPlot(est, id.n=3)
## Cook's dist., Studentized residual, hat-valueを表示
influencePlot(est, id.n=2)

### 非線形性の確認
## component+residual plot
## (各説明変数とそれ以外の説明変数による残差の関係)
crPlots(est)
## crPlots(est, order=2) # 2次の関係を仮定してみる
## crPlots(est, order=3) # 3次の関係を仮定してみる

### 残差の分散の一様性
## spread-level plot (予測値と残差の絶対値の関係)
spreadLevelPlot(est)
## ncv検定 (non-constant variance score test)
## (残差の分散の一様性の検定)
ncvTest(est)

### 多重共線性
## variance inflation factor
vif(est)
## 主成分分析による説明変数の関係性の表示
biplot(princomp(~ disp + hp + wt + drat,data=mtcars, cor=TRUE))
