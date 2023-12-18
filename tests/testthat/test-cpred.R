test_that("cpred-works", {
  pred_c_global <- cpred(ref_dry_avg, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon")
  write.csv(pred_c_global, file.path(system.file("testdata", package = "carbcontpred"), paste0("pred_c_actual", ".csv")), row.names = FALSE)
  pred_c_actual <- read.csv(system.file("testdata", "pred_c_actual.csv", package = "carbcontpred"))
  pred_c_expected <- readr::read_csv(system.file("testdata", "testdata_cpred.csv", package = "carbcontpred"))
  expect_equal(mean(pred_c_actual$Predicted_Organic_Carbon), mean(pred_c_expected$Predicted_Organic_Carbon))
})
