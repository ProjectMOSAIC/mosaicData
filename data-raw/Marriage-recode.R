
# recoding some variables on 7/13/2020

data(Marriage)  # from previous version of package
Marriage <- 
  Marriage %>% 
  mutate(
    appdate = lubridate::mdy(appdate),
    ceremonydate = lubridate::mdy(ceremonydate),
    dob = lubridate::mdy(dob),
    dayOfBirth = lubridate::yday(dob)
  )
