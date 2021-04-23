# Unit test to ensure it returns a data frame
test_that("Returns a data frame", {
  expect_equal(class(auto_clean(data.frame(model = "5 Series", 
                                           year = 2018, 
                                           transmission = "Manual", 
                                           mileage = 50000, 
                                           fuelType = "Diesel", 
                                           tax = 100, 
                                           mpg = 20, 
                                           engineSize = 2))), 
               "data.frame")
})

# Unit test to ensure it returns the same number of rows that were in initial data frame
test_that("Number rows in returned data frame matches number rows in initial", {
  expect_equal(nrow(auto_clean(data.frame(model = "5 Series", 
                                          year = 2018, 
                                          transmission = "Manual", 
                                          mileage = 50000, 
                                          fuelType = "Diesel", 
                                          tax = 100, 
                                          mpg = 20, 
                                          engineSize = 2))), 
               nrow(data.frame(model = "5 Series", 
                               year = 2018, 
                               transmission = "Manual", 
                               mileage = 50000, 
                               fuelType = "Diesel", 
                               tax = 100, 
                               mpg = 20, 
                               engineSize = 2)))
})
