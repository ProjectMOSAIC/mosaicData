#' US Births
#' 
#' Number of births each day from 1968 to 1988
#'
#' @docType data
#' @name Births
#' @usage data(Births)
#' @format  A data.frame with 7305 observations on the following 8 variables.
#' \itemize{
#'    item{code{date }}{[Date]}
#'    item{code{births }}{number of births on \code{date} [integer]}
#'    item{code{wday }}{day of week [ordered factor]}
#'    item{code{year }}{year [integer]}
#'    item{code{month }}{month [integer]}
#'    item{code{day }}{day of month [integer]}
#'    item{code{day_of_year }}{day of year [integer]}
#'    item{code{day_of_week }}{day of week [integer]}
#' }
#' @source
#' Data source: National Vital Statistics System natality data, as provided by
#' Google BigQuery and exported to csv 
#' Robert Kern (\url{http://www.mechanicalkern.com/static/birthdates-1968-1988.csv)}
#'
#' @details
#' The number of births in \code{\link{Births78}} is slightly lower than the number
#' of births in this data set for the year 1978.  See the examples.
#' 
#' @examples
#' data(Births)
#' if(require(ggplot2)) {
#'   ggplot(data = Births, aes(x = date, y = births, colour = wday)) +
#'     stat_smooth(se = FALSE, alpha = 0.8, geom = "line")
#'   ggplot(data = Births, aes(x = day_of_year, y = births, colour = wday)) +
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
