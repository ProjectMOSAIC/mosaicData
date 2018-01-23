
HELPrct <- 
  HELPrct %>% mutate(avg_drinks = i1, max_drinks = i2)

HELPmiss <- 
  HELPmiss %>% mutate(avg_drinks = i1, max_drinks = i2)

devtools::use_data(HELPrct, HELPmiss, overwrite = TRUE)