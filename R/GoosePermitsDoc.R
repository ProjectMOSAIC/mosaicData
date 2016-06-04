#' Goose Permit Study
#' 
#' 237 hunters were each offered one of 11 cash amounts (bids) ranging from 
#' $1 to $200 in return for their goose permits.  Hunters returned either their 
#' permit or the cash.
#' 
#' @docType data
#' @name GoosePermits
#' @usage data(GoosePermits)
#' @format  A data.frame with 11 observations on the following 3 variables.
#' \itemize{
#'    item{code{bid }}{amount offered for permit (US $) [numeric]}
#'    item{code{keep }}{number of hunters who kept the permit and returned the cash [numeric]}
#'    item{code{sell }}{number of hunters who kept the cash and returned the permit [numeric]}
#' }
#' @source  Bishop and Heberlein (Amer. J. Agr. Econ. 61, 1979).  
#' See also \url{http://www.math.umt.edu/patterson/ProfileLikelihoodCI.pdf}.
#' 
#' @examples
#' data(GoosePermits)
#' 
#' goose.model <- 
#'   glm( cbind(keep, sell) ~ log(bid), data = GoosePermits, family = binomial())
#' if (require(mosaic)) {
#'   f <- makeFun(goose.model)
#'   xyplot( (keep/(keep+sell)) ~ bid, data = GoosePermits, ylim = c(0,1.05))
#'   plotFun( f(b) ~ b, add = TRUE) 
#' }
#' 
NA