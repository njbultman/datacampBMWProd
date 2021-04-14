# datacampBMWProd

This package is designed for use with the DataCamp certification case study. It supplements the original model building exercise with helpful functions that make pricing new BMW data simple and efficient in a pipeline. It also contains information about the final model including the model object and the training data/script for reproducability/transparancy.

For example, if I have a new dataframe of BMW data that I want scored, I simply pass that first to the *auto_clean* function. Then, I pass the revised dataframe to the *auto_predict* function to generate model predictions for price.
