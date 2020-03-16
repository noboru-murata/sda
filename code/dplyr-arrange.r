### dplyr::arrange (指定した変数の順に並べ替える)
arrange(airquality, Temp, Wind) %>% # 結果を次に渡す
    head(8) # 先頭の8行を表示．並べ替えの基本は昇順
arrange(airquality, Temp, desc(Wind)) %>% 
    head(8) # Windを降順に指定
