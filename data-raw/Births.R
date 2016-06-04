library(mosaic)
library(tidyr)
Births <- 
  read.file("data-raw/birthdates-1968-1988.csv") %>%
  mutate(
    date = lubridate::ymd(paste(year, month, day, sep = "-")),
    wday = lubridate::wday(date, label = TRUE)
    ) %>%
  select(date, births, wday, year, month, day, day_of_year, day_of_week)
