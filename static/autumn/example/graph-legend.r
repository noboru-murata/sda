### 凡例の追加
f <- function(x) exp(-x) * cos(x)
plot(f, 0, 2*pi, col="red", lwd=2, ylab="")
g <- function(x) exp(-x) * sin(x)
curve(g, lty=2, # グラフの線の形式 2は破線
      add=TRUE, col="blue", lwd=2)
legend(4, # 凡例の左上のx座標
       1, # 凡例の左上のy座標
       legend=c(expression(e^{-x}*cos(x)),expression(e^{-x}*sin(x))), # 凡例
       lty=c(1,2), lwd=2, col=c("red","blue"), # パラメータはグラフに準拠
       bty="n", # 凡例の枠線の形式(オプション) "n"は枠線なし
       y.intersp=2) # 行間の指定(オプション)
