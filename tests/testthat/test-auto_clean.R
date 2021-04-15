test_that("Returns a data frame", {
  expect_equal(class(auto_clean(data.frame(model = "5 Series", year = 2018, transmission = "Manual", mileage = 50000, fuelType = "Diesel", tax = 100, mpg = 20, engineSize = 2))), "data.frame")
})
