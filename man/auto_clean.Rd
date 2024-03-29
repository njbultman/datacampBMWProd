% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto_clean.R
\name{auto_clean}
\alias{auto_clean}
\title{Prepare New BMW Data For Model Prediction}
\usage{
auto_clean(new_data_df)
}
\arguments{
\item{new_data_df}{New data frame with BMW data that you would like cleaned before passing to the auto_predict function.}
}
\value{
Returns the modified data frame containing all of the requirements for model prediction.
}
\description{
Returns a modified data frame containing all of the requirements for model prediction.
}
\examples{
auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2))

}
\seealso{
\code{\link{auto_predict}}
}
\author{
Nick Bultman, \email{njbultman74@gmail.com}, April 2021
}
\keyword{clean}
