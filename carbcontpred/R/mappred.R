#' The function first extracts an algebraic equation based on the reflectance and predicted organic carbon content of soil samples. Then the function applies continuum removal over the reflectance values of an Region of Interest (ROI) data table collected from image processing and analysis software ENVI. Then the function applies the extracted algebraic equation on this attribute table to predict organic carbon content of points based on their reflectance values.
#'
#' @param predictions_dataframe The dataset resulting from the output of the cpred function, contains the average reflectance and measured and predicted organic carbon content of some soil samples
#' @param ROI_dataset_path The ROI data table exported from ENVI into a CSV file, contains geoinformation and reflectance values of the ROI divided into individual points
#' @param output_dataset The updated ROI data table containing the new predicted organic carbon content of the points
#' @return A CSV file containing the ROI data table as well as the predicted organic carbon content of the points using an algebraic equation extracted from the predictions of a cross-validated linear regression model
#' @usage mappred(predictions_dataframe, ROI_dataset_path, output_dataset)
#' @import prospectr
#' @export
#' @references https://github.com/KangyuSo/my-GEO712-repository
#' @source The data used for the predictions was collected by Kangyu So, Dr. Alemu Gonsamo, and Dr. Cheryl A. Rogers (All affiliated with McMaster University) from the Hudson Bay Lowlands region on July 2022. The ROI dataset was collected from images collected by the Moderate Resolution Imaging Spectroradiometer (MODIS) satellite operated by the National Aeronautics and Space Administration (NASA).
#' @examples
#' mappred_c <- mappred(pred_c, "data-raw/Reflectance_ROI.csv", "ROI_Predicted_Carbon")
mappred <- function(predictions_dataframe, ROI_dataset_path, output_dataset) {
  independent_variable <- predictions_dataframe$Independent_Variable_Column_Name
  dependent_varriable <- predictions_dataframe$Dependent_Variable_Column_Name
  equation <- stats::lm(dependent_var ~ independent_var)
  ROI <- utils::read.csv(ROI_dataset_path)
  remove_rows <- c(1:7, 9)
  ROI_New <- ROI[-remove_rows, ]
  ROI_New$Reflectance <- prospectr::continuumRemoval(ROI_New$B1, wav = ROI_New$B1, type = "R")  
  ROI_New$Carbon <- stats::predict(equation, ROI_New$Reflectance)
  utils::write.csv(ROI_New, file = paste0(output_dataset, ".csv"), row.names = FALSE)
}

