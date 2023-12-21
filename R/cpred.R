#' Create a linear regression model, cross-validate it, and use it to predict the organic carbon content of soil samples based on their reflectance
#'
#' @param data The data set containing the average reflectance and organic carbon content of soil samples
#' @param reflectance The average reflectance at a given wavelength range
#' @param carbon The organic carbon content by percent dry weight
#' @param test_size The test size for the model
#' @param folds The number of folds for the cross-validation
#' @param prediction The name for the predicted organic carbon content output
#' @return A column containing the predicted organic carbon content using a cross-validated linear regression model
#' @usage cpred(data, reflectance, carbon, test_size, folds, prediction)
#' @import caret
#' @import stats
#' @export
#' @references https://github.com/KangyuSo/carbcontpred
#' @source The data was collected by Kangyu So, Dr. Alemu Gonsamo, and Dr. Cheryl A. Rogers (All affiliated with McMaster University) from the Hudson Bay Lowlands region on July 2022
#' @examples
#' data <- data.frame(ref_dry_avg)
#' pred_c <- cpred(data, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon")
cpred <- function(data, reflectance, carbon, test_size, folds, prediction) {
  set.seed(123)
  indices <- sample(1:nrow(data), nrow(data) * (1 - test_size))
  train_data <- data[indices, ]
  test_data <- data[-indices, ]
  lm_model <- stats::lm(stats::formula(paste0(carbon, '~', reflectance)), data = train_data)
  train_control <- caret::trainControl(method = "cv", number = folds)
  cv_model <- caret::train(x= data.frame(train_data[, reflectance]), train_data[, carbon], method = "lm", trControl = train_control)
  cv_model <- caret::train(x= train_data[reflectance], train_data[, carbon], method = "lm", trControl = train_control)
  test_data[, prediction] <- stats::predict(cv_model, newdata = test_data)
  return(test_data)
}