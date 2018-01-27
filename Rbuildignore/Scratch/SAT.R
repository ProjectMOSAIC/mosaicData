#' State by State SAT data in 1994 and 2010 
#' 
#' SAT data for two years.  The 1994 data was
#' assembled for a statistics education journal article on the 
#' link between SAT scores and measures of educational expenditures.
#' The 2010 data has been put in the same format and concatenated to the 1994 format. 
#' 
#' 
#' @name SAT
#' @usage data(SAT)
#' @docType data
#' @format 
#'   A data frame with 100 observations on the following variables.
#'   \itemize{
#'     \item{\code{state}} {a factor with names of each state}
#'     \item{\code{expend}} {expenditure per pupil in average daily attendance in
#'  public elementary and secondary schools, 1994-95 (in thousands of US dollars)}
#'     \item{\code{ratio}} {average pupil/teacher ratio in public elementary and secondary
#' schools}
#'     \item{\code{salary}} {estimated average annual salary of teachers in public elementary
#' and secondary schools, unadjusted for inflation (in US dollars)}
#'     \item{\code{frac}} {percentage of all eligible students taking the SAT}
#'     \item{\code{verbal}} {average verbal SAT score}
#'     \item{\code{math}} {average math SAT score}
#'     \item{\code{sat}} {average total SAT score}
#'     \item{\code{year}} {1994 or 2010 (as a character string)}
#'   }
#' 
#' @source 
#' http://www.amstat.org/publications/jse/secure/v7n2/datasets.guber.cfm
#' 
#' @references 
#' Deborah Lynn Guber, "Getting what you pay for: the debate over equity in
#' public school expenditures" (1999), \emph{Journal of Statistics Education} 7(2).
#' 2010 data collated by Jeff Witmer, Oberlin College
#' 
#' @examples 
#' data(SAT)
#' SAT1994 <- subset(SAT, year=="1994") # the original SAT data
#' if (require(lattice)) {
#'   xyplot(sat ~ expend, group=year, SAT)
#'   xyplot(sat ~ expend, group=year, SAT, 
#' 	   panel=function(x,y){grid.text(abbreviate(SAT$state, 3), x, y, default.units='native')})
#' } 
#' @keywords datasets
