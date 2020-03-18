### 線形回帰の信頼区間
## データセットsleepによる例
x <- subset(sleep, group == 1, extra, drop=TRUE)
y <- subset(sleep, group == 2, extra, drop=TRUE)
(myModel <- lm(y ~ x)) # 線形回帰分析の実行
confint(myModel)             # 95%信頼区間(標準値)
confint(myModel, level=0.99) # 99%信頼区間
