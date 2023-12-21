test_that("mappred-works", {
  mappred_c <- mappred(pred_c, "Reflectance", "Predicted_Organic_Carbon", system.file("extdata", "Reflectance_ROI.csv", package = "carbcontpred"), "ROI_Predicted_Carbon", "ROI_folder", "carbcontpred")
  mappred_c_actual <- readr::read_csv(system.file("ROI_folder", "ROI_Predicted_Carbon.csv", package = "carbcontpred"))
  mappred_c_expected <- readr::read_csv(system.file("testdata", "testdata_mappred.csv", package = "carbcontpred"))
  expect_equal(mean(mappred_c_actual$B1), mean(mappred_c_expected$B1))
})
