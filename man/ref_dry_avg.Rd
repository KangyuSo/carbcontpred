% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/carbcontpred-package.R
\docType{data}
\name{ref_dry_avg}
\alias{ref_dry_avg}
\title{Reflectance values and organic carbon content for post-dried soil samples.}
\format{
A data frame with 432 observations and 3 variables:
\describe{
\item{Sample_ID}{ID of the soil sample}
\item{Reflectance}{Average spectral reflectance value for a given wavelength for the soil sample}
\item{Organic_Carbon}{Organic carbon content by percent dry weight for the soil sample}
}
}
\usage{
data(ref_dry_avg)
}
\description{
A data set containing information about the spectral reflectance and organic
carbon content of 432 post-dried soil samples collected from the Hudson Bay
Lowlands.
}
\examples{
 data(ref_dry_avg)
 Reflectance <- ref_dry_avg$Reflectance
}
\keyword{Soil}
\keyword{carbon}
\keyword{data}
\keyword{sets}
\keyword{spectroscopy}
\keyword{stock}
