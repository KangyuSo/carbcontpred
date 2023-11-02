#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

#' avgref: A package that calculates the average reflectance of each soil sample at a given wavelength range
#'
#' This package is an exercise in package creation using
#' R studio. The package includes a dataset of the reflectance values of soil
#' samples that were collected from the Hudson Bay Lowlands on July 2023. The
#' package also includes a function for calculating the average reflectance of
#' each soil sample at a given wavelength range.
#'
#' @docType package
#' @name avgref-package
#' @author Kangyu So, School of Earth, Environment and Society, McMaster University \email{sok11@mcmaster.ca}
#' @references \url{https://github.com/KangyuSo/my-GEO712-repository}
NULL

#' Reflectance values for post-dried soil samples.
#'
#' A dataset containing information about the spectral reflectance of 432
#' post-dried soil samples collected from the Hudson Bay Lowlands. The range of
#' information is between the wavelengths 350 nm and 2500 nm in increments of
#' 1 nm.
#'
#' @format A data frame with 2151 rows and 433 variables:
#' \describe{
#'   \item{Sample_ID}{ID of the soil sample}
#'   \item{Reflectance}{Spectral reflectance value at a given wavelength}
#' }
#'
#' @docType data
#' @keywords datasets
#' @keywords Soil carbon stock
#' @keywords Soil spectroscopy
#' @name ref_dry
#' @usage data(ref_dry)
#' @examples
#'  data(ref_dry)
#'  Wavelength <- ref_dry$Wavelength
"ref_dry"
