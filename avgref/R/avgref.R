#' Calculate the average reflectance of soil samples at a given wavelength range
#'
#' @param start_row The lower end of the wavelength range
#' @param end_row The higher end of the wavelength range
#' @return The average reflectance of each soil sample at the wavelength range
#' @usage data(ref_dry)
#' @export
#' @reference https://github.com/KangyuSo/my-GEO712-repository
#' @source The data was collected by Kangyu So, Dr. Alemu Gonsamo, and Dr. Cheryl A. Rogers (All affiliated with McMaster University) from the Hudson Bay Lowlands region on July 2023
#' @examples
#' data(ref_dry)
#' ref_dry_average <- avgref(ref_dry, 500, 750)
avgref <- function(data, start_row, end_row) {

  # Select the columns from the second column to the last column
  selected_columns <- data[, 2:ncol(data)]

  # Calculate the average for each selected column
  column_means <- colMeans(selected_columns[start_row:end_row,])

  # Create a new data frame with "Sample ID" and "Reflectance" columns
  result_data <- data.frame(
    Sample_ID = colnames(selected_columns),
    Reflectance = column_means
  )

  return(result_data)
}
