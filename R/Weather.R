
#' Weather
#' 
#' 2016-17 weather in several cities
#' 
#' @docType data
#' @name Weather
#' @usage data(Weather)
#' @format A data frame with weather-related variables for several world cities.
#' \describe{
#'   \item{city}{City name.}
#'   \item{date}{Date.}
#'   \item{year}{Numeric year.}
#'   \item{month}{Numeric month.}
#'   \item{day}{Numeric day.}
#'   \item{high_temp, avg_temp, low_temp}{High, average, and low temperature for the day in degrees F.}
#'   \item{high_dewpt, avg_dewpt, low_dewpt}{High, average, and low dew point for the day in degrees F.}
#'   \item{high_humidity, avg_humidity, low_humidity}{High, average, and low relative humidity.}
#'   \item{high_hg, avg_hg, low_hg}{High, average, and low sea level pressure in inches of mercury.}
#'   \item{high_vis, avg_vis, low_vis}{High, average, and low visability for the day in miles.}
#'   \item{high_wind, avg_wind, low_wind}{High, average, and low wind speed for the day in mph.}
#'   \item{precip}{Precipitation for the day -- a character vale; `T` means "trace amount".}
#'   \item{events}{Character string naming weather events on the day (Rain, Fog, Snow, etc.)}
#' }
#' @source These data were downloaded from WeatherUnderground in January 2018.
#' 
#' @examples
#' if (require(dplyr)) {
#'   Weather %>%
#'     group_by(city, year) %>%
#'     summarise(
#'       min_temp = min(low_temp),
#'       max_temp = max(high_temp)
#'       )
#' }
#' 
#' if (require(ggformula)) {
#'   Weather %>%
#'     gf_linerange(low_temp + high_temp ~ date | city ~ ., 
#'     color = ~ (high_temp + low_temp) / 2 ) %>%
#'     gf_refine(scale_color_gradientn(colors = rev(rainbow(5))))
#' }
#' 
"Weather"