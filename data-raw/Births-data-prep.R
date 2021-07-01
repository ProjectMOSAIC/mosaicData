
BirthsCDC <- 
  read.csv("US_births_1994-2003_CDC_NCHS.csv") |>
  dplyr::mutate(
    date = lubridate::ymd(paste(year, month, date_of_month, sep = "-")),
    wday = lubridate::wday(date, label = TRUE, abbr = TRUE),
    day_of_week = lubridate::wday(date),
    day_of_year = lubridate::yday(date)
  ) |>
  dplyr::rename(
    day_of_month = date_of_month,
  ) |>
  dplyr::select(
    date, births, wday, year, month, day_of_year, day_of_month, day_of_week
  )

BirthsSSA <- read.csv("US_births_2000-2014_SSA.csv") |>
  dplyr::mutate(
    date = lubridate::ymd(paste(year, month, date_of_month, sep = "-")),
    wday = lubridate::wday(date, label = TRUE, abbr = TRUE),
    day_of_week = lubridate::wday(date),
    day_of_year = lubridate::yday(date)
  ) |>
  dplyr::rename(
    day_of_month = date_of_month,
  ) |>
  dplyr::select(
    date, births, wday, year, month, day_of_year, day_of_month, day_of_week
  )

head(BirthsCDC)
head(BirthsSSA)
head(mosaicData::Births)
head(mosaicData::Births78)

usethis::use_data(BirthsSSA, overwrite = TRUE)
usethis::use_data(BirthsCDC, overwrite = TRUE)
