
# recoding some variables on 7/13/2020

# data(Marriage)  # from previous version of package
# Marriage <-
#   Marriage |>
#   mutate(
#     appdate = lubridate::mdy(appdate),
#     ceremonydate = lubridate::mdy(ceremonydate),
#     dob = lubridate::mdy(dob),
#     dayOfBirth = lubridate::yday(dob)
#   )

# fixing on 2022-08-30 because some dates were placed in the wrong century.

Marriage <- readRDS('Marriage-orig.rds')
Marriage <-
  Marriage |>
  mutate(
    appdate = lubridate::mdy(appdate),
    ceremonydate = lubridate::mdy(ceremonydate),
    dob = lubridate::mdy(dob),
    dayOfBirth = lubridate::yday(dob)
  )
Marriage <- Marriage |>
  mutate(
    dob = case_when(
      dob > lubridate::ymd('1999-12-31') ~ dob - lubridate::years(100),
      TRUE ~ dob)
  )

use_data(Marriage, overwrite = TRUE)

## reprex for testing it out.
library(mosaicData)
range(Marriage$appdate)
range(Marriage$ceremonydate)
range(Marriage$dob)

Marriage |>
  ggformula::gf_point( ceremonydate ~ (dob + lubridate::days(round(age * 365.25))))
