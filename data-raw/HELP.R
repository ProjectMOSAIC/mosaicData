library(dplyr)
library(ggformula)
load('HELPrct.rda')
HELPrct <- 
  HELPrct |>
  mutate(avg_drinks = i1, max_drinks = i2) |>
  mutate(hospitalizations = d1) |>
  set_labels(
    list(
      age = "age (years)",
      anysub = "post-detox substance use",
      cesd =  "CESD at baseline",
      d1 = "hospitalizations",
      daysanysub = "days to 1st post-detox substance use",
      dayslink = "time to linkage to primary care (days)",
      drugrisk = "Risk Assessment Battery at baseline",
      e2b = "previous detox stays (last 6 months)",
      female = "female",
      sex = "sex",
      g1b = "serious suicidal thoughts (last 30 days)",
      homeless = "housing status",
      i1 = "avg. drinks per day",
      i2 = "max. drinks per day",
      avg_drinks = "avg. drinks per day",
      max_drinks = "max. drinks per day",
      id = "subject ID",
      indtot = "Inventory of Drug Use Consequences",
      linkstatus = "post-detox linkage to primary care",
      link = "post-detox linkage to primary care",
      mcs = "SF-36 Mental Component Score",
      pcs = "SF-36 Physical Component Score",
      pss_fr = "perceived social support by friends",
      racegrp = "race/ethnicity",
      satreat = "previous BSAS substance abuse treatment",
      sexrisk = "Risk Assessment Battery sex risk score",
      substance = "primary substance of abuse",
      treat = "randomized to HELP clinic"
    )
  )

load('HELPmiss.rda')
HELPmiss <- 
  HELPmiss |> mutate(avg_drinks = i1, max_drinks = i2) |>
  mutate(avg_drinks = i1, max_drinks = i2) |>
  mutate(hospitalizations = d1) |>
  set_labels(
    list(
      age = "age (years)",
      anysub = "post-detox substance use",
      cesd =  "CESD at baseline",
      d1 = "hospitalizations",
      daysanysub = "days to 1st post-detox substance use",
      dayslink = "time to linkage to primary care (days)",
      drugrisk = "Risk Assessment Battery at baseline",
      e2b = "previous detox stays (last 6 months)",
      female = "female",
      sex = "sex",
      g1b = "serious suicidal thoughts (last 30 days)",
      homeless = "housing status",
      i1 = "avg. drinks per day",
      i2 = "max. drinks per day",
      avg_drinks = "avg. drinks per day",
      max_drinks = "max. drinks per day",
      id = "subject ID",
      indtot = "Inventory of Drug Use Consequences",
      linkstatus = "post-detox linkage to primary care",
      link = "post-detox linkage to primary care",
      mcs = "SF-36 Mental Component Score",
      pcs = "SF-36 Physical Component Score",
      pss_fr = "perceived social support by friends",
      racegrp = "race/ethnicity",
      satreat = "previous BSAS substance abuse treatment",
      sexrisk = "Risk Assessment Battery sex risk score",
      substance = "primary substance of abuse",
      treat = "randomized to HELP clinic"
    )
  )

usethis::use_data(HELPrct, HELPmiss, overwrite = TRUE)
