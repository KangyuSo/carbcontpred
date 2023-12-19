#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

#' carbcontpred: A package that uses a linear regression model to predict the organic carbon content of soil samples based on their reflectance, and then uses the predictions to estimate the organic carbon content of a Region of Interest (ROI) based on its spectral reflectance data.
#'
#' This package is an exercise in package creation using R studio. The package 
#' includes a function that builds and implements a linear regression model and 
#' a sample dataset containing the reflectance and organic carbon data of soil 
#' samples. The package includes another function that extracts an algebraic 
#' equation based on the predictions from the linear regression model and uses 
#' it to predict the organic carbon content of a sample ROI data file  using its
#' spectral reflectance data. The package contains a sample dataset of 
#' predictions from the linear regression model. The package also includes the 
#' documentation for the functions and datasets.
#'
#' @docType package
#' @name carbcontpred-package
#' @author Kangyu So, School of Earth, Environment and Society, McMaster University \email{sok11@mcmaster.ca}
#' @references \url{https://github.com/KangyuSo/carbcontpred}
NULL

#' Reflectance values and organic carbon content for post-dried soil samples.
#'
#' A dataset containing information about the spectral reflectance and organic 
#' carbon content of 432 post-dried soil samples collected from the Hudson Bay 
#' Lowlands.
#'
#' @format A data frame with 432 observations and 3 variables:
#' \describe{
#'   \item{Sample_ID}{ID of the soil sample}
#'   \item{Reflectance}{Average spectral reflectance value for a given wavelength for the soil sample}
#'   \item{Organic_Carbon}{Organic carbon content by percent dry weight for the soil sample}
#' }
#'
#' @docType data
#' @keywords datasets
#' @keywords Soil carbon stock
#' @keywords Soil spectroscopy
#' @name ref_dry_avg
#' @usage data(ref_dry_avg)
#' @import caret
#' @import prospectr
## usethis namespace: end
#' @examples
#'  data(ref_dry_avg)
#'  Reflectance <- ref_dry_avg$Reflectance
"ref_dry_avg"

#' Reflectance values and measured and predicted organic carbon content for post-dried soil samples.
#'
#' A dataset containing information about the spectral reflectance, measured 
#' organic carbon content, and predicted organic carbon content of 303 
#' post-dried soil samples collected from the Hudson Bay Lowlands.

#' @format A data frame with 303 observations and 4 variables:
#' \describe{
#'   \item{Sample_ID}{ID of the soil sample}
#'   \item{Reflectance}{Average spectral reflectance value for a given wavelength for the soil sample}
#'   \item{Organic_Carbon}{Organic carbon content by percent dry weight for the soil sample}
#'   \item{Predicted_Organic_Carbon}{Predicted organic carbon content by percent dry weight for the soil sample}
#' }
#' 
#' @docType data
#' @keywords datasets
#' @keywords Terrestrial spatial modeling
#' @keywords Soil carbon content estimation
#' @name pred_c
#' @usage data(pred_c)
#' @import readr
#' @import stats
## usethis namespace: end
#' @examples
#'  data(pred_c)
#'  Predicted_Organic_Carbon <- pred_c$Predicted_Organic_Carbon
"pred_c"

