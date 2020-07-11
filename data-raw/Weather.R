require(dplyr)
library(ggformula)

Weather <- 
  bind_rows(
    lapply(1:10, function(i) 
      readxl::read_excel("Weather.xlsx", sheet = i, na = "-") %>% 
        mutate(precip = as.character(precip))
    )
  ) %>%
  group_by(city,year) %>%
  mutate(
    month = cumsum(day == 1),
    date  = lubridate::make_date(year = year, month = month, day = day)
  ) %>%
  select(
    city, date, year, month, day, matches("*")) %>%
  ungroup() %>%
  set_labels(
    list(
      high_temp  = "high temp (F)",
      avg_temp   = "avg temp (F)",
      low_temp   = "low temp (F)",
      high_dewpt = "high dew point (F)",
      avg_dewpt  = "avg dew point (F)",
      low_dewpt  = "low dew point (F)",
      high_humidity = "high relative humidity",
      avg_humidity  = "avg relative humidity",
      low_humidity  = "low relative humidity",
      high_hg = "high pressure (mm Hg)",
      avg_hg  = "avg pressure (mm Hg)",
      low_hg  = "low pressure (mm Hg)",
      high_vis = "high visibility (miles)",
      avg_vis  = "avg visibility (miles)",
      low_vis  = "low visibility (miles)",
      high_wind = "high wind speed (mph)",
      avg_wind  = "avg wind speed (mph)",
      low_wind  = "low wind speed (mph)",
      precip = "precipitation",
      events = "events"
    )
  )

usethis::use_data(Weather, overwrite = TRUE)