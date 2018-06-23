#' US Births
#' 
#' Number of births each day from 1968 to 1988
#'
#' @docType data
#' @name Births
#' @usage data(Births)
#' @format  A data.frame with 7305 observations on the following 8 variables.
#' 
#'  * `date`   Date
#'  * `births` Number of births on `date` (integer)
#'  * `wday`   Day of week (ordered factor)
#'  * `year`   Year (integer)
#'  * `month`  Month (integer)
#'  * `day_of_year`  Day of year (integer)
#'  * `day_of_month` Day of month (integer)
#'  * `day_of_week`  Day of week (integer)
#'  
#' @source
#' Data source: National Vital Statistics System natality data, as provided by
#' Google BigQuery and exported to csv 
#' Robert Kern (\url{http://www.mechanicalkern.com/static/birthdates-1968-1988.csv})
#'
#' @details
#' The number of births in \code{\link{Births78}} is slightly lower than the number
#' of births in this data set for the year 1978.  See the examples.
#' 
#' @seealso \code{\link{Births2015}}, \code{\link{Births}}.
#' 
#' @examples
#' data(Births)
#' if(require(ggplot2)) {
#'   ggplot(data = Births, aes(x = date, y = births, colour = ~ wday)) +
#'     stat_smooth(se = FALSE, alpha = 0.8, geom = "line")
#'   ggplot(data = Births, aes(x = day_of_year, y = births, colour = ~ wday)) +
#'     geom_point(size = 0.4, alpha = 0.5) +
#'     stat_smooth(se = FALSE, geom = "line", alpha = 0.6, size = 1.5)
#'   if (require(dplyr)) {
#'     ggplot(
#'      data =  bind_cols(Births %>% filter(year == 1978), 
#'                        Births78 %>% rename(births78 = births)),
#'      aes(x = births - births78)
#'      ) +
#'      geom_histogram(binwidth = 1)
#'   }
#' }
#' 
NA

#' US Births in 1969 - 1988
#'
#' A day by day record of the number of births in each US State.
#' 
#' @docType data
#' @name Birthdays
#' @usage data(Birthdays)
#' @format 
#'   A data frame with 374221 observations on the following variables.
#'   \itemize{
#'     \item{\code{state}} {state where child was born}
#'     \item{\code{year}} {year (1969-1988)}
#'     \item{\code{month}} {month (1-12)}
#'     \item{\code{day}} {day of month}
#'     \item{\code{date}} {date as a date object}
#'     \item{\code{births}} {number of births}
#'   }
#' 
#' @examples
#' data(Birthdays)
#' if (require(mosaic)) {
#'   MI <- Birthdays %>% filter(state == "MI")
#'   gf_point(births ~ date, Birthdays, data = MI) 
#'   gf_line(births ~ date, Birthdays, data = MI, color = ~ wday)
#'   gf_line(births ~ date, 
#'     data = Birthdays %>% group_by(date) %>% summarise(births = sum(births)))
#'   }

NA 

#' US Births in 1978
#'
#' A day by day record of the number of births in the United States in 1978.
#' 
#' @docType data
#' @name Births78
#' @usage data(Births78)
#' 
#' @format  A data.frame with 365 observations on the following 8 variables.
#' 
#'  * `date`   Date
#'  * `births` Number of births on `date` (integer)
#'  * `wday`   Day of week (ordered factor)
#'  * `year`   Year (integer)
#'  * `month`  Month (integer)
#'  * `day_of_year`  Day of year (integer)
#'  * `day_of_month` Day of month (integer)
#'  * `day_of_week`  Day of week (integer)
#'   
#' @seealso \code{\link{Births2015}}, \code{\link{Births}}
#' 
#' @examples
#' data(Births78)
#' if (require(ggformula)) {
#'   gf_point(births ~ date, data = Births78)
#'   gf_point(births ~ date, data = Births78, color = ~ wday)
#' }

NA 

#' US Births in 2015
#'
#' A day by day record of the number of births in the United States in 2015.
#' 
#' @docType data
#' @name Births2015
#' @usage data(Births2015)
#' 
#' @format  A data.frame with 365 observations on the following 8 variables.
#' 
#'  * `date`   Date
#'  * `births` Number of births on `date` (integer)
#'  * `wday`   Day of week (ordered factor)
#'  * `year`   Year (integer)
#'  * `month`  Month (integer)
#'  * `day_of_year`  Day of year (integer)
#'  * `day_of_month` Day of month (integer)
#'  * `day_of_week`  Day of week (integer)
#'  
#' @seealso \code{\link{Births78}}, \code{\link{Births}}
#' @source 
#' Obtained from the National Center for Health Statistics,  
#' National Vital Statistics System,  
#' Natality, 2015 data.
#' 
#' @examples
#' data(Births2015)
#' if (require(ggformula)) {
#'   gf_point(births ~ date, data = Births2015)
#'   gf_point(births ~ date, data = Births2015, color = ~ wday)
#' }
#' if (require(dplyr)) {
#'   Births78 %>% 
#'     group_by(wday) %>% summarise(births = sum(births)) %>% 
#'     ungroup() %>% mutate(frac = births / sum(births))
#'   Births2015 %>% 
#'     group_by(wday) %>% summarise(births = sum(births)) %>% 
#'     ungroup() %>% mutate(frac = births / sum(births))
#' }

NA 
