test_that("mappred-works", {
  expect_equal(mappred(pred_c, "data-raw/Reflectance_ROI.csv", "ROI_Predicted_Carbon"), 6)
})
