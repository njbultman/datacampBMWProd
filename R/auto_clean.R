#' Prepare New BMW Data For Model Prediction
#'
#' Returns a modified data frame containing all of the requirements for model prediction. 
#'
#' @return Returns the modified data frame containing all of the requirements for model prediction.
#' @author Nick Bultman, \email{njbultman74@@gmail.com}, April 2021
#' @seealso \code{\link{auto_predict}}
#' @keywords clean
#' @import dplyr
#' @importFrom stringr str_detect
#' @importFrom fastDummies dummy_cols
#' @export
#' @examples
#' auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2))
#'
#' @param new_data_df New data frame with BMW data that you would like cleaned before passing to the auto_predict function.
#'
auto_clean <- function(new_data_df) {
  
  # Load in model
  data("rf_model_final")
  
  # Load in historical quantiles
  data("historical_mileage_25_75_quantiles")
  data("historical_mpg_25_75_quantiles")
  
  # Convert variables to factor
  new_data_df$model <- as.factor(new_data_df$model)
  new_data_df$transmission <- as.factor(new_data_df$transmission)
  new_data_df$fuelType <- as.factor(new_data_df$fuelType)
  new_data_df$year <- as.factor(new_data_df$year)
  
  # Add categorical variables
  new_data_full <- new_data_df %>%
    mutate(model_generic = as.factor(case_when(
      str_detect(model, "Series") == TRUE ~ "Series",
      str_detect(model, "X") == TRUE ~ "X",
      str_detect(model, "i") == TRUE ~ "i",
      str_detect(model, "M") == TRUE ~ "M",
      str_detect(model, "Z") == TRUE ~ "Z")),
      is_auto_semi = ifelse(transmission == "Automatic" | 
                              transmission == "Semi-Auto", 1, 0),
      is_man_semi = ifelse(transmission == "Manual" | 
                             transmission == "Semi-Auto", 1, 0),
      mileage_cat = as.factor(case_when(
        mileage < historical_mileage_25_75_quantiles[1] ~ "Low",
        mileage > historical_mileage_25_75_quantiles[2] ~ "High",
        mileage >= historical_mileage_25_75_quantiles[1] & 
          mileage <= historical_mileage_25_75_quantiles[2] ~ "Medium"
      )),
      mpg_cat = as.factor(case_when(
        mpg < historical_mpg_25_75_quantiles[1] ~ "Low",
        mpg > historical_mpg_25_75_quantiles[2] ~ "High",
        mpg >= historical_mpg_25_75_quantiles[1] & 
          mpg <= historical_mpg_25_75_quantiles[2] ~ "Medium"
      )))
  
  # Get dummy variables
  new_data_full_model <- dummy_cols(new_data_full, remove_first_dummy = FALSE) %>%
    select_if(is.numeric)
  
  # Find difference in columns - 
  # Remove ones that are present in test data only
  names_rm <- setdiff(names(new_data_full_model), names(rf_model_final$trainingData))
  
  for (i in names_rm) {
    
    new_data_full_model[, i] <- NULL
    
  }
  
  # Add dummies with 0s that are not present in test data only
  names_add <- setdiff(names(rf_model_final$trainingData), names(new_data_full_model))
  
  for (i in names_add) {
    
    new_data_full_model[, i] <- 0
    
  }
  
  # Drop .outcome
  new_data_full_model$.outcome <- NULL
  
  return(new_data_full_model)
  
}
  
