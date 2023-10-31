library(mosaic)
library(tidyr)
require(magrittr)

Births78 <- 
  readr::read_csv("Births78.csv") |>
  dplyr::mutate(
    date = as.Date(date),
    wday = lubridate::wday(date, label = TRUE),
    year = 1978,
    month = lubridate::month(date),
    day_of_year = 1:nrow(Births78),
    day_of_month = lubridate::day(date),
    day_of_week = lubridate::wday(date)
  ) |>
  dplyr::select(date, births, wday, year, month, day_of_year, day_of_month, day_of_week) |>
  data.frame()
  
Births <- 
  readr::read_csv("birthdates-1968-1988.csv") |>
  dplyr::mutate(
    date = lubridate::ymd(paste(year, month, day, sep = "-")),
    wday = lubridate::wday(date, label = TRUE),
    ) |>
  dplyr::select(date, births, wday, year, month, day_of_year, day_of_month = day, day_of_week) |>
  data.frame()


Births2015 <-
  readxl::read_excel("USLiveBirthsByDay2015.xlsx", skip = 2)[-1, -2]
names(Births2015)[1] <- "day"  # merged cell in original excel sheet
Births2015 <-
  Births2015 |>
  lapply(function(x) ifelse(x == "-", NA, x)) |>
  lapply(readr::parse_number) |>
  data.frame() |> 
  tidyr::gather(month, births, January:December) |>
  dplyr::filter(!is.na(births)) |>
  dplyr::mutate(
    date = lubridate::ymd(paste("2015", month, day, sep="-")),
    wday = lubridate::wday(date, label = TRUE, abbr = TRUE),
    day_of_year = 1:365,
    year = lubridate::year(date),
    month = lubridate::month(date),
    day_of_week = lubridate::wday(date)
  ) |>
  dplyr::select(date, births, wday, year, month, day_of_year, day_of_month = day, day_of_week) |>
  data.frame()

devtools::use_data(Births, Births78, Births2015, overwrite = TRUE)

