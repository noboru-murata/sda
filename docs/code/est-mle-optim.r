### optimを用いた最尤推定量の関数
### mleのかわりにoptimを用いると細かな最適化の設定が行える
mle.gamma <- function(x, nu0=1, alpha0=1){ 
    n <- length(x) # データ数 (尤度関数で用いる)
    ## 対数尤度関数のマイナスを計算する関数(optimは最小化を行うため)
    ## suppressWarningsで定義域外で評価された際の警告を表示させない
    f <- function(theta) # theta=(nu,alpha)
        suppressWarnings(-sum(log(dgamma(x, theta[1], theta[2]))))
    ## fの勾配(偏微分からなるベクトル)を計算する関数
    ## 指定しなくても大丈夫だが, 指定した方が計算が速いことが多い
    gr <- function(theta){ # theta=(nu,alpha)
        ## nuに関する偏微分
        gr.nu <- -n*log(theta[2])+n*digamma(theta[1])-sum(log(x))
        ## alphaに関する偏微分
        gr.alpha <- -n*theta[1]/theta[2]+sum(x) 
        return(c(gr.nu, gr.alpha))
    }
    ## 関数fの最小化 
    opt <- optim(c(nu0, alpha0), # パラメータの初期値
                 fn=f, gr=gr,    # 関数fnとその勾配gr
                 method="BFGS")  # BFGSは準Newton法の一つ
    theta <- opt$par # 推定値
    names(theta) <- c("nu","alpha") 
    return(theta) 
}
