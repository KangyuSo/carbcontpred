test_that("cpred-works", {
  expect_equal(cpred(ref_dry_avg, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon"), 6)
})
