### dplyr::arrange (指定した変数の順に並べ替える)
arrange(airquality, Temp, Wind) %>%head(12)       # 基本は昇順
arrange(airquality, Temp, desc(Wind)) %>%head(12) # Windは降順
## %>% は処理を渡す演算子．head(12)で出力結果を12行に制限する
