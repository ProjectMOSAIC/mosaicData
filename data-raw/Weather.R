require(dplyr)

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
  ungroup()

usethis::use_data(Weather, overwrite = TRUE)

