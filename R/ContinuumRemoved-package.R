#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

#' ContinuumRemoved: A package that calculates the continuum removal of a soil spectral reflectance dataset,
#'
#' This package is an exercise in package creation using
#' R studio. The package includes a sample function and
#' a sample dataset with their respective documentation.
#'
#' @docType package
#' @name ContinuumRemoved-package
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
#'   \item{Wavelength}{Specific wavelength in nanometers}
#'   \item{Sample ID}{ID of the soil sample}
#'   \item{Reflectance}{Spectral reflectance value at a given wavelength}
#' }
#'
#' @docType data
#' @keywords datasets
#' @keywords Soil carbon stock
#' @keywords Soil spectroscopy
#' @name RefDryContinuumRemoved
#' @usage data(RefDryContinuumRemoved)
#' @examples
#'  data(RefDryContinuumRemoved)
#'  Wavelength <- RefDryContinuumRemoved$Wavelength
"RefDryContinuumRemoved"
