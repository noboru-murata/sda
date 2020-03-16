### dplyr::summarize (データフレームを集計する)
summarize(airquality,
          mean    = mean(Ozone, na.rm=TRUE),
          min     = min(Ozone, na.rm=TRUE),
          median  = median(Ozone, na.rm=TRUE),
          max     = max(Ozone, na.rm=TRUE)) 
