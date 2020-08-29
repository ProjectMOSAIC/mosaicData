library(dplyr)
Gestation <- 
  readr::read_csv('Gestation.csv') %>%
  mutate(
    pluralty = case_when(pluralty == 5 ~ "single fetus"),
    outcome = case_when(outcome == 1 ~ 'live birth'),
    date = lubridate::ymd('1960-12-31') + lubridate::days(date),
    sex = case_when(sex == 1 ~ "male", sex == 2 ~ "female"),
    parity = ifelse(parity == 99, NA,  parity),
    race = case_when(
      race <= 5 ~ 'white', 
      race == 6 ~ 'mex', 
      race == 7 ~ 'black', 
      race == 8 ~ 'asian', 
      race == 9 ~ 'mixed'), 
    ed = case_when(
      ed == 0 ~ 'less than 8th grade', 
      ed == 1 ~ '8th -12th grade - did not graduate', 
      ed == 2 ~ 'HS graduate--no other schooling', 
      ed == 3 ~ 'HS+trade',
      ed == 4 ~ 'HS+some college',
      ed == 5 ~ 'College graduate',
      ed == 6 ~ 'Trade school HS unclear',
      ed == 7 ~ 'Trade school HS unclear'
    ),
    drace = case_when(
      drace == "0" ~ 'white', 
      drace == "1" ~ 'white', 
      drace == "2" ~ 'white', 
      drace == "3" ~ 'white', 
      drace == "4" ~ 'white', 
      drace == "5" ~ 'white', 
      drace == "6" ~ 'mex', 
      drace == "7" ~ 'black', 
      drace == "8" ~ 'asian', 
      drace == "9" ~ 'mixed'), 
    ded = case_when(
      ded == 0 ~ 'less than 8th grade', 
      ded == 1 ~ '8th -12th grade - did not graduate', 
      ded == 2 ~ 'HS graduate--no other schooling', 
      ded == 3 ~ 'HS+trade',
      ded == 4 ~ 'HS+some college',
      ded == 5 ~ 'College graduate',
      ded == 6 ~ 'Trade school HS unclear',
      ded == 7 ~ 'Trade school HS unclear'
    ),
    marital = case_when(
      marital == 1 ~ 'married', 
      marital == 2 ~ 'legally separated', 
      marital == 3 ~ 'divorced',
      marital == 4 ~ 'widowed', 
      marital == 5 ~ 'never married'),
    inc = case_when(
      inc < 9 ~ paste0(inc * 2500, '-', (inc + 1) * 2500),
      inc == 9 ~ '15000+',
      inc == 99 ~ 'not asked'
    ),
    smoke = case_when(
      smoke == 0 ~ 'never',
      smoke == 1 ~ 'now',
      smoke == 2 ~ 'until current pregnancy',
      smoke == 3 ~ 'once did, not now'
    ),
    time = case_when(
      time == 0 ~ 'never smoked',
      time == 1 ~ 'still smokes',
      time == 2 ~ 'during current preg',
      time == 3 ~ 'within 1 yr',
      time == 4 ~ '1 to 2 years ago',
      time == 5 ~ '2 to 3 years ago',
      time == 6 ~ '3 to 4 years ago',
      time == 7 ~ '5 to 9 years ago',
      time == 8 ~ '10+ years ago',
      time == 9 ~ "don't know",
      time == 98 ~ "unknown",
      time == 99 ~ "not asked"),
    number = case_when(
      number == 0 ~ 'never', 
      number == 1 ~ '1-4 per day',
      number == 2 ~ '5-9 per day',
      number == 3 ~ '10-14 per day',
      number == 4 ~ '15-19 per day',
      number == 5 ~ '20-29 per day',
      number == 6 ~ '30-39 per day',
      number == 7 ~ '40-60 per day',
      number == 8 ~ '60+ per day',
      number == 9 ~ "don't know",
      number == 98 ~ "unknown",
      number == 99 ~ "not asked"
    )
  )

usethis::use_data(Gestation, overwrite = TRUE)
    