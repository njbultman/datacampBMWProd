test_that("Return a numeric vector", {
  expect_equal(class(auto_predict(auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2)))), 
               "numeric")
})

test_that("Length of vector matches number of rows in initial data frame", {
  expect_equal(length(auto_predict(auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2)))), 
               nrow(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2)))
})
