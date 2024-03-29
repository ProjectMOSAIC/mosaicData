% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasetsDoc.R
\docType{data}
\name{Utilities}
\alias{Utilities}
\title{Utility bills}
\format{
A data frame containing 117 observations for the following variables.
\describe{
\item{\code{month}}{month (coded as a number)}
\item{\code{day}}{day of month on which bill was calculated}
\item{\code{year}}{year of bill}
\item{\code{temp}}{average temperature (F) for billing period}
\item{\code{kwh}}{electricity usage (kwh)}
\item{\code{ccf}}{gas usage (ccf)}
\item{\code{thermsPerDay}}{a numeric vector}
\item{\code{billingDays}}{number of billing days in billing period}
\item{\code{totalbill}}{total bill (in dollars)}
\item{\code{gasbill}}{gas bill (in dollars)}
\item{\code{elecbill}}{electric bill (in dollars)}
\item{\code{notes}}{notes about the billing period}
}
}
\source{
Daniel T. Kaplan, \emph{Statistical modeling: A fresh approach}, 2009.
}
\usage{
data(Utilities)
}
\description{
Data from utility bills at a residence.
\code{\link{Utilities2}}  is a similar data set with some additional variables.
}
\examples{
data(Utilities)
if (require(ggformula)) {
  gf_point(gasbill ~ temp, data = Utilities)
}

}
\seealso{
\code{\link{Utilities2}}.
}
\keyword{datasets}
