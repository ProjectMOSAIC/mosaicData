require(mosaic)
SaratogaHouses <- read.table("http://sites.williams.edu/rdeveaux/files/2014/09/Saratoga.txt", 
  header=TRUE, stringsAsFactors=FALSE)
inspect(SaratogaHouses)
str(SaratogaHouses)
SaratogaHouses <- 
  SaratogaHouses %>%
  mutate(
    heating = derivedFactor('hot air' = Heat.Type == 2,
                            'hot water/steam' = Heat.Type == 3,
                            electric = Heat.Type == 4)) %>%
  mutate(
    fuel = derivedFactor(gas = Fuel.Type == 2,
                             electric = Fuel.Type == 3,
                             oil = Fuel.Type == 4)
    ) %>%
  mutate(
    sewer = derivedFactor("septic" = Sewer.Type == 2,
                         "public/commercial" = Sewer.Type == 3,
                         "none" = Sewer.Type == 1,
                         .default = NA)    # 0's code NA as well
    ) %>%
  mutate(
    waterfront = derivedFactor(Yes = Waterfront, .default = "No")) %>%
  mutate(
    newConstruction = derivedFactor(Yes = New.Construct, .default = "No")) %>%
  mutate( 
    centralAir = derivedFactor(Yes = Central.Air, .default = "No")) %>%
  rename( price = Price,
          lotSize = Lot.Size,
          age = Age,
          landValue = Land.Value,
          livingArea = Living.Area,
          pctCollege = Pct.College,
          bedrooms = Bedrooms,
          fireplaces = Fireplaces,
          bathrooms = Bathrooms,
          rooms = Rooms)

            
  
 
tally(heating ~ Heat.Type, data = SaratogaHouses)
tally(fuel ~ Fuel.Type, data = SaratogaHouses)
tally(sewer ~ Sewer.Type, data = SaratogaHouses)
tally(centralAir ~ Central.Air, data = SaratogaHouses)
SaratogaHouses <- 
  SaratogaHouses %>% 
  select(-Heat.Type, -Fuel.Type, -Sewer.Type, -Waterfront) %>%
  select(- matches("\\."))
devtools::use_data(SaratogaHouses, overwrite = TRUE) 
# save(SaratogaHouses, file="SaratogaHouses.Rda")


