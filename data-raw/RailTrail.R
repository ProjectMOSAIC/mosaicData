require(mosaic)
RailTrail <- readRDS("RailTrail_orig.rds")
RailTrail <- 
  RailTrail %>% 
  mutate(weekday = weekday == "1") %>%
  mutate(dayType = ifelse(weekday, "weekday", "weekend")) 

RailTrail2 <-
  data_frame(
    date = lubridate::mdy(
      c("4/5/05", "4/6/05", "4/7/05", "4/8/05", "4/9/05", "4/10/05", 
        "4/11/05", "4/12/05", "4/13/05", "4/14/05", "4/15/05", "4/16/05", 
        "4/17/05", "4/18/05", "4/19/05", "4/20/05", "4/21/05", "4/22/05", 
        "4/24/05", "4/25/05", "4/26/05", "4/27/05", "4/28/05", "4/29/05", 
        "5/3/05", "5/4/05", "5/5/05", "5/6/05", "5/7/05", "5/8/05", "5/9/05", 
        "5/10/05", "5/11/05", "5/12/05", "5/13/05", "5/14/05", "5/15/05", 
        "5/16/05", "5/17/05", "5/18/05", "5/19/05", "5/20/05", "5/21/05", 
        "5/22/05", "5/23/05", "5/24/05", "5/25/05", "5/26/05", "5/27/05", 
        "5/28/05", "5/29/05", "5/30/05", "5/31/05", "6/1/05", "6/2/05", 
        "6/3/05", "6/5/05", "6/22/05", "6/23/05", "6/24/05", "6/25/05", 
        "6/26/05", "6/27/05", "6/28/05", "6/29/05", "6/30/05", "7/1/05", 
        "7/2/05", "7/3/05", "7/4/05", "7/5/05", "7/6/05", "7/7/05", "7/8/05", 
        "8/11/05", "8/12/05", "8/13/05", "8/14/05", "11/4/05", "11/5/05", 
        "11/6/05", "11/7/05", "11/8/05", "11/9/05", "11/10/05", "11/11/05", 
        "11/12/05", "11/13/05", "11/14/05", "11/15/05")
    ),
    day = 
      c("Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", 
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", 
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
        "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", 
        "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", 
        "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", 
        "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", 
        "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", 
        "Thursday", "Friday", "Sunday", "Wednesday", "Thursday", "Friday", 
        "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", 
        "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", 
        "Thursday", "Friday", "Thursday", "Friday", "Saturday", "Sunday", 
        "Friday", "Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", 
        "Thursday", "Friday", "Saturday", "Sunday", "Monday", "Tuesday"
      ),
    hightemp = c(62L, 75L, 70L, 65L, 66L, 74L, 56L, 54L, 59L, 64L, 62L, 70L, 
           80L, 76L, 81L, 86L, 67L, 63L, 63L, 52L, 70L, 58L, 61L, 66L, 57L, 
           57L, 65L, 60L, 49L, 55L, 72L, 77L, 75L, 61L, 66L, 70L, 65L, 69L, 
           70L, 67L, 71L, 56L, 67L, 55L, 59L, 51L, 51L, 55L, 74L, 79L, 74L, 
           77L, 74L, 72L, 74L, 78L, 89L, 73L, 79L, 88L, 95L, 95L, 90L, 76L, 
           84L, 84L, 83L, 80L, 80L, 83L, 83L, 81L, 70L, 64L, 92L, 90L, 97L, 
           89L, 69L, 71L, 59L, 59L, 59L, 46L, 50L, 41L, 51L, 62L, 60L, 42L
    ),
    lowtemp = 
      c(39L, 43L, 47L, 48L, 38L, 33L, 38L, 32L, 34L, 41L, 36L, 30L, 
        33L, 44L, 39L, 50L, 43L, 35L, 46L, 43L, 41L, 51L, 42L, 38L, 36L, 
        48L, 30L, 34L, 43L, 43L, 47L, 43L, 47L, 35L, 39L, 49L, 20L, 54L, 
        62L, 43L, 39L, 41L, 39L, 45L, 40L, 39L, 49L, 52L, 50L, 47L, 55L, 
        52L, 52L, 53L, 55L, 55L, 57L, 49L, 45L, 54L, 61L, 66L, 66L, 72L, 
        70L, 69L, 60L, 55L, 53L, 54L, 50L, 65L, 63L, 58L, 66L, 65L, 71L, 
        69L, 41L, 42L, 46L, 35L, 35L, 30L, 35L, 25L, 19L, 28L, 32L, 37L
      ),
    precip = 
      c(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.17, 
        0.01, 0, 0.15, 0.01, 0, 0.01, 0, 0, 0, 0.12, 0, 0, 0, 0, 0, 0, 
        0, 0.22, 0.02, 0, 0, 0, 0, 0.02, 0.2, 0.34, 0.16, 0.03, 0.14, 
        0.12, 0.01, 0, 0, 0.32, 0, 0, 0, 0, 0.29, 0, 0, 0, 0, 0, 0.35, 
        1.49, 0.01, 0.14, 0, 0, 0, 0, 1.44, 0, 1.15, 0, 0, 0.68, 0.36, 
        0, 0, 0, 0, 0, 0.2, 0, 0, 0, 0.02, 0, 0.15),
    cloudcover = 
      c(0.8, 6.3, 9.9, 7.2, 0, 2.5, 0, 3.6, 2.4, 3.4, 0, 0, 0.7, 1.8, 
        0, 6.2, 0.4, 8.6, 6.9, 5.8, 5.1, 10, 6.4, 3.9, 6.5, 6.8, 4.3, 
        10, 9.7, 9, 4.1, 0.4, 6.8, 4.4, 2.4, 7.9, 9.4, 6.6, 3, 6.7, 5.2, 
        7, 6.8, 9.6, 9.4, 10, 10, 10, 8, 7, 7.8, 5, 7.5, 7.9, 4.6, 8.5, 
        1.9, 6.3, 4.1, 6.2, 2.6, 4.1, 6.6, 9.7, 9.9, 8.9, 8.2, 3.8, 3.8, 
        1.2, 7.6, 10, 9.9, 10, 7.9, 8.4, 6.1, 9, 6.4, 4, 10, 1.7, 7.7, 
        9.7, 5.8, 0, 0, 5.7, 1.2, 10),
    volume = 
      c(236L, 156L, 328L, 418L, 629L, 635L, 335L, 304L, 344L, 349L, 
        259L, 461L, 617L, 650L, 540L, 484L, 445L, 365L, 400L, 186L, 422L, 
        156L, 322L, 186L, 174L, 259L, 393L, 293L, 129L, 264L, 517L, 429L, 
        421L, 362L, 417L, 514L, 314L, 375L, 460L, 371L, 452L, 362L, 407L, 
        316L, 311L, 150L, 193L, 200L, 409L, 507L, 339L, 736L, 397L, 376L, 
        461L, 432L, 356L, 419L, 547L, 531L, 385L, 449L, 453L, 298L, 388L, 
        505L, 405L, 533L, 564L, 535L, 501L, 256L, 554L, 155L, 395L, 411L, 
        352L, 286L, 339L, 415L, 261L, 252L, 331L, 189L, 280L, 287L, 291L, 
        367L, 348L, 181L)
  )

RailTrail %>% 
  inner_join(RailTrail2)

RailTrail %>% 
  anti_join(RailTrail2)
