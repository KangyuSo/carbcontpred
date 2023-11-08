#' Create a linear regression model, cross-validate it, and use it to predict the organic carbon content of soil samples based on their reflectance
#'
#' @param reflectance The average reflectance at a given wavelength range
#' @param carbon The organic carbon content by percent dry weight
#' @param folds The number of folds for the cross-validation
#' @param prediction The name for the predicted organic carbon content output
#' @return A column containing the predicted organic carbon content using a cross-validated linear regression model
#' @usage data(ref_dry_avg)
#' @export
#' @reference https://github.com/KangyuSo/my-GEO712-repository
#' @source The data was collected by Kangyu So, Dr. Alemu Gonsamo, and Dr. Cheryl A. Rogers (All affiliated with McMaster University) from the Hudson Bay Lowlands region on July 2023
#' @examples
#' data(ref_dry_avg)
#' pred_c <- cpred(ref_dry_avg, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon")
install.packages("caret")
library(caret)
cpred <- function(data, predictor_col, response_col, test_size, cv_folds, prediction_col) {
  library(caret)
  set.seed(123)
  indices <- sample(1:nrow(data), nrow(data) * (1 - test_size))
  train_data <- data[indices, ]
  test_data <- data[-indices, ]
  lm_model <- lm(formula(paste0(response_col, '~', predictor_col)), data = train_data)
  train_control <- trainControl(method = "cv", number = cv_folds)
  cv_model <- train(x= data.frame(train_data[, predictor_col]), train_data[, response_col], method = "lm", trControl = train_control)
  cv_model <- train(x= train_data[predictor_col], train_data[, response_col], method = "lm", trControl = train_control)
  test_data[, prediction_col] <- predict(cv_model, newdata = test_data)
  return(test_data)
}
