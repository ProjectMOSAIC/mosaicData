require(magrittr)
Births2015 <-
  readxl::read_excel("USLiveBirthsByDay2015.xlsx", skip = 2)[-1, -2]
names(Births2015)[1] <- "day"  # merged cell in original excel sheet
Births2015 <-
  Births2015 %>%
  lapply(function(x) ifelse(x == "-", NA, x)) %>%
  lapply(readr::parse_number) %>%
  data.frame() %>% 
  tidyr::gather(month, births, January:December) %>%
  dplyr::filter(!is.na(births)) %>%
  dplyr::mutate(
    date = lubridate::ymd(paste("2015", month, day, sep="-")),
    wday = lubridate::wday(date, label = TRUE, abbr = TRUE),
    dayofyear = 1:365
    ) %>%
  dplyr::select(date, births, dayofyear, wday)
  

