### 人工データに対する単回帰分析の例
### モデル: y = -1 + 2x
set.seed(123) # 乱数の初期値の固定
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数
epsilon <- rnorm(length(x)) # 誤差項
y <- -1 + 2 * x + epsilon # 目的変数の観測データ
out <- lm(y ~ x) # 回帰分析の実行
summary(out)
coef(summary(out))[ ,2] # 標準誤差のみ抽出
summary(out)$sigma # 誤差項の標準偏差の推定値
## 誤差項の標準偏差が標準誤差に与える影響を確認する
epsilon <- rnorm(length(x), sd=2) # 誤差項(標準偏差2倍)
y <- -1 + 2 * x + epsilon # 目的変数の観測データ
out <- lm(y ~ x) # 回帰分析の実行
summary(out)
coef(summary(out))[ ,2] # 標準誤差のみ抽出
summary(out)$sigma # 誤差項の標準偏差の推定値
