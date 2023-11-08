#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

#' carbcontpred: A package that uses a linear regression model to predict the organic carbon content of soil samples based on their reflectance.
#'
#' This package is an exercise in package creation using R studio. The package 
#' includes a function that builds and implements a linear regression model and 
#' a sample dataset containing the reflectance and organic carbon data of soil 
#' samples. The package also includes the documentation for the function and 
#' dataset.
#'
#' @docType package
#' @name carbcontpred-package
#' @author Kangyu So, School of Earth, Environment and Society, McMaster University \email{sok11@mcmaster.ca}
#' @references \url{https://github.com/KangyuSo/my-GEO712-repository}
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
## usethis namespace: end
#' @examples
#'  data(ref_dry_avg)
#'  Reflectance <- ref_dry_avg$Reflectance
"ref_dry_avg"

