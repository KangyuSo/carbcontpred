
<!-- README.md is generated from README.Rmd. Please edit that file -->

# carbcontpred

<!-- badges: start -->
<!-- badges: end -->

The first goal of carbcontpred is to build and cross-validate a linear
regression model for a dataset containing the spectral reflectance and
organic carbon content of soil samples, and then use it to predict the
organic carbon content based on reflectance. The second goal of
carbcontpred is to use the predictions from the linear regression mode
to predict the organic carbon content of an Region of Interest (ROI)
data table containing the spectral reflectance of spatial points on a
map.

## Installation

You can install the development version of carbcontpred from
[GitHub](https://github.com/KangyuSo/carbcontpred) with:

``` r
install.packages('carbcontpred', repos = "https://github.com/KangyuSo/carbcontpred")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
## Install and load the package
remotes::install_github("paezha/packr", 
                         build_vignettes = TRUE)
#> Skipping install of 'packr' from a github remote, the SHA1 (c9642e64) has not changed since last install.
#>   Use `force = TRUE` to force installation
library(carbcontpred)

## Load the dataset 
data <- data.frame(ref_dry_avg)

## Create a linear regression model with "Reflectance" as the response variable, "Organic_Carbon" as the predictor variable, test size of 70%, 10 folds for the cross-validation, and "Predicted_Organic_Carbon" as the output column
pred_c <- cpred(data, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon")
#> Loading required package: ggplot2
#> Loading required package: lattice

## View the results
View(pred_c)
```
