#' The function first extracts an algebraic equation based on the reflectance and predicted organic carbon content of soil samples. Then the function applies continuum removal over the reflectance values of an Region of Interest (ROI) data table collected from image processing and analysis software ENVI. Then the function applies the extracted algebraic equation on this attribute table to predict organic carbon content of points based on their reflectance values.
#'
#' @param predictions_dataframe The dataset resulting from the output of the cpred function, contains the average reflectance and measured and predicted organic carbon content of some soil samples
#' @param reflectance_column The average reflectance at a given wavelength range in the predictions_dataframe
#' @param prediction_column The predicted organic carbon content in the predictions_dataframe
#' @param ROI_dataset_path The ROI data table exported from ENVI into a CSV file, contains geoinformation and reflectance values of the ROI divided into individual points
#' @param output_dataset The updated ROI data table containing the new predicted organic carbon content of the points
#' @return A CSV file containing the ROI data table as well as the predicted organic carbon content of the points using an algebraic equation extracted from the predictions of a cross-validated linear regression model
#' @usage mappred(predictions_dataframe, ROI_dataset_path, output_dataset)
#' @import prospectr
#' @import readr
#' @import stats
#' @export
#' @references https://github.com/KangyuSo/carbcontpred
#' @source The data used for the predictions was collected by Kangyu So, Dr. Alemu Gonsamo, and Dr. Cheryl A. Rogers (All affiliated with McMaster University) from the Hudson Bay Lowlands region on July 2022. The ROI dataset was collected from images collected by the Moderate Resolution Imaging Spectroradiometer (MODIS) satellite operated by the National Aeronautics and Space Administration (NASA).
#' @examples
#' pred_c_df <- data.frame(pred_c)
#' mappred_c <- mappred(pred_c_df, "Reflectance", "Predicted_Organic_Carbon", "~/carbcontpred/ROI_Data/Reflectance_ROI.csv", "ROI_Predicted_Carbon")
mappred <- function(predictions_dataframe, reflectance_column, prediction_column, ROI_dataset_path, output_dataset) {
  independent_variable <- as.numeric(unlist(predictions_dataframe[reflectance_column]))
  dependent_variable <- as.numeric(unlist(predictions_dataframe[prediction_column]))
  coef_matrix <- cbind(independent_variable)
  coefficient <- solve(t(coef_matrix) %*% coef_matrix) %*% t(coef_matrix) %*% dependent_variable
  suppressWarnings(ROI <- stats::na.omit(readr::read_csv(ROI_dataset_path, skip = 7)))
  ROI$B1 <- (ROI$B1-min(ROI$B1))/(max(ROI$B1)-min(ROI$B1))
  ROI$B1 <- as.numeric(ROI$B1)
  predicted_carbon <- 3 * as.vector(coefficient) + as.vector(coefficient) * as.numeric(ROI$B1) * -3
  ROI$B1 <- predicted_carbon
  if ("B1" %in% colnames(ROI))
    colnames(ROI)[colnames(ROI) == "B1"] <- "Predicted_Organic_Carbon"
    return(ROI)
  utils::write.csv(ROI, file = paste0(output_dataset, ".csv"), row.names = FALSE)
}