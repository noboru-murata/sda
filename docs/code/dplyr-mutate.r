### dplyr::mutate (新しい列を作成する)
mutate(airquality, TempC=(Temp-32)/1.8) %>%
    head(8) # 華氏を摂氏に変換して追加
### dplyr::transmute (新しい列を作成する)
transmute(airquality,
          TempF=Temp,TempC=(Temp-32)/1.8) %>%
    head(8) # 元の列を保持しない
