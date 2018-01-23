require(dplyr)

Weather <- 
  bind_rows(
    readxl::read_excel("Weather.xlsx", sheet = "Chicago2017", na = "-") %>% 
      mutate(city = "Chicago", precip = as.character(precip)),
    readxl::read_excel("Weather.xlsx", sheet = "Auckland2017", na = "-") %>% 
      mutate(city = "Auckland", precip = as.character(precip)),
    readxl::read_excel("Weather.xlsx", sheet = "Beijing2017", na = "-") %>% 
      mutate(city = "Beijing", precip = as.character(precip)),
    readxl::read_excel("Weather.xlsx", sheet = "SanDiego2017", na = "-") %>% 
      mutate(city = "San Diego", precip = as.character(precip)),
    readxl::read_excel("Weather.xlsx", sheet = "Mumbai2017", na = "-") %>% 
      mutate(city = "Mumbai", precip = as.character(precip))
  ) %>%
  group_by(city) %>%
  mutate(
    month = cumsum(day == 1),
    date  = lubridate::make_date(year = year, month = month, day = day)
    ) %>%
  select(
    city, date, year, month, day, matches("*"))


