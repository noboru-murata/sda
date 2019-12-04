### 関数sampleの使い方
x <- 1:10 # サンプリング対象の集合をベクトルとして定義
set.seed(123) # 乱数のシード値(任意に決めてよい)を指定
sample(x, 5)  # xから5つの要素を重複なしでランダムに抽出
sample(x, length(x)) # xの要素のランダムな並べ替えとなる
sample(x, 5, replace=TRUE) # xから5つの要素を重複ありでランダムに抽出
sample(1:6, 10, replace=TRUE) # サイコロを10回振る実験の再現
sample(1:6, 10, prob=6:1, replace=TRUE) # 出る目の確率に偏りがある場合
### 関数rbinomの使い方
rbinom(10, size=4, prob=0.5) # 確率0.5に対する次数4の二項乱数を10個発生
rbinom(20, size=4, prob=0.2) # 個数を20, 確率を0.2に変更
### 関数runifの使い方
runif(5, min=-1, max=2) # 区間(-1,2)上の一様乱数を5個発生
runif(5) # 指定しない場合は区間(0,1)が既定値
### 関数set.seedについて
set.seed(1) # 乱数の初期値をseed=1で指定
runif(5) 
set.seed(2) # 乱数の初期値をseed=2で指定
runif(5)    # seed=1の場合と異なる結果
set.seed(1) # 乱数の初期値をseed=1で指定
runif(5)    # 初めのseed=1の場合と同じ結果
