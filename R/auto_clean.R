#' Prepare New BMW Data For Model Prediction
#'
#' Returns a modified data frame containing all of the requirements for model prediction. 
#'
#' @return Returns the modified data frame containing of of the requirements for model prediction.
#' @author Nick Bultman, \email{njbultman74@@gmail.com}, April 2021
#' @seealso \code{\link{auto_predict}}
#' @keywords clean
#' @import dplyr stringr
#' @export
#' @examples
#' auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2))
#'
#' @param new_data_df Specific character you would like to find in string/vector.
#' @param x Character vector or string you would like to slice.
#'
auto_clean <- function(new_data_df) {
  
  
  
}
