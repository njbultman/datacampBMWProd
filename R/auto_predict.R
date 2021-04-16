#' Generate Price Predictions on New BMW Data
#'
#' Generates price predictions on new BMW data using the final model. Note that data frame
#' must be passed through auto_clean function prior to using the auto_predict function. 
#'
#' @return Returns price predictions for new BMW data.
#' @author Nick Bultman, \email{njbultman74@@gmail.com}, April 2021
#' @seealso \code{\link{auto_clean}}
#' @keywords predict
#' @importFrom caret predict.train
#' @export
#' @examples
#' auto_predict(auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2)))
#'
#' @param clean_new_data_df Data frame used for price prediction after being passed through auto_clean function.
#'
auto_predict <- function(clean_new_data_df) {
  
  #Load in model
  data("rf_model_final")
  
  #Generate predictions
  predictions <- predict.train(rf_model_final, newdata = clean_new_data_df)
  
  return(predictions)
  
}