require(mosaic)
RailTrail <- readRDS("RailTrail_orig.rds")
RailTrail <- 
  RailTrail %>% 
  mutate(weekday = weekday == "1") %>%
  mutate(dayType = ifelse(weekday, "weekday", "weekend"))

