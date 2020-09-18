### 人工データに対する単回帰分析の例
### モデル: y = -1 + 2x
set.seed(123) # 乱数の初期値の固定
a <- -1 # 定数項の真値
b <- 2 # xの回帰係数の真値
x <- c(7, 2, 6, 4, 3, 10, 9, 1, 8, 5) # 説明変数
n <- length(x) # サンプル数
## yの観測データを乱数を変えながら多数回シミュレーション
## 統計量を多数個生成しt分布に従っていることを確認
MC <- 5000 # シミュレーション回数
t.alpha <- double(MC) # alphaに関する統計量
t.beta <- double(MC) # betaに関する統計量
for(m in 1:MC){ # シミュレーションの実行
  epsilon <- rnorm(n) # 誤差項
  y <- a + b * x + epsilon # 目的変数の観測データ
  out <- lm(y ~ x) # 回帰分析の実行
  est <- coef(out) # 最小二乗推定量
  se <- coef(summary(out))[ ,2] # 標準誤差
  t.alpha[m] <- (est[1]-a)/se[1]
  t.beta[m] <- (est[2]-b)/se[2]
}
## ヒストグラムの作成
bins <- c(-Inf,seq(-4,4,by=0.4),Inf)
hist(t.alpha, freq=FALSE, breaks=bins, xlim=c(-4, 4),
     col="lightblue", border="white")
curve(dt(x, df=n-2), # 理論上の密度
      add=TRUE, col="red", lwd=2) 
hist(t.beta, freq=FALSE, breaks=bins, xlim=c(-4, 4),
     col="lightblue", border="white")
curve(dt(x, df=n-2), # 理論上の密度
      add=TRUE, col="red", lwd=2) 
