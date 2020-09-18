### 気候データによる例
mydata <- read.csv("data/tokyo_weather.csv",
                   fileEncoding="utf8")
jul <- subset(mydata, 月==7) # 7月のデータを抽出
(model1 <- lm(気温 ~ 日射量, # 気温を日射量で説明
              data=jul)) 
summary(model1) # 推定値・標準誤差・t値・p値などを表示
## 日射量のp値は非常に小さいので
## 日射量は気温の説明に有用であると結論できそう
(model2 <- lm(気温 ~ 風速, # 気温を風速で説明
              data=jul)) 
summary(model2) # 推定値・標準誤差・t値・p値などを表示
## 風速のp値は小さくはないので有意であるとはいえない

## p値の意味の確認
## 回帰係数=0の下でモデルを多数回シミュレーションして
## 計算されたt値たちが観測されたt値を超える確率を計算する
set.seed(123) # 乱数シードの固定
t0 <- coef(summary(model2))["風速", "t value"] # t値
x <- jul$風速 # xの観測データ
mc <- 10000 # シミュレーション回数
t.sim <- double(mc) # t値を保持するベクトル
## 定数項と誤差項の標準偏差の真値は不明なので
## データから計算された値で代用する
a <- coef(model2)[1]
sigma <- summary(model2)$sigma
## シミュレーションの開始
for(m in 1:mc){
    y <- a + rnorm(length(x), sd=sigma) # 観測データ
    res <- lm(y ~ x) # 回帰分析の実行
    t.sim[m] <- coef(summary(res))["x", "t value"]
}
## シミュレーションのt値が観測されたt値を超えた割合を計算
mean(abs(t.sim) > abs(t0))
