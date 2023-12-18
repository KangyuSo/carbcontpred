
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
remotes::install_github("KangyuSo/carbcontpred", 
                         build_vignettes = TRUE)
library(carbcontpred)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
## Install and load the package
remotes::install_github("KangyuSo/carbcontpred", 
                         build_vignettes = TRUE)
#> Skipping install of 'carbcontpred' from a github remote, the SHA1 (66dfba84) has not changed since last install.
#>   Use `force = TRUE` to force installation
library(carbcontpred)

## Load the dataset 
data <- data.frame(ref_dry_avg)

## Create a linear regression model with "Reflectance" as the predictor variable, "Organic_Carbon" as the response variable, test size of 70%, 10 folds for the cross-validation, and "Predicted_Organic_Carbon" as the output column
pred_c <- cpred(data, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon")
#> Loading required package: ggplot2
#> Loading required package: lattice
 
## View the results
View(pred_c)
   
## Load the ROI data file "ROI_Predicted_Carbon.csv" and apply min-max normalization on the spectral reflectance values 
## Extract an equation for predicting organic carbon content using reflectance based on the results of the "cpred" function and use it to predicted the organic carbon content of the "ROI_Predicted_Carbon.csv" file using its reflectance values
## Update the ROI data file with the predictions and save it as a csv file output titled "ROI_Predicted_Carbon"
mappred_c <- mappred(pred_c, "Reflectance", "Predicted_Organic_Carbon", "~/carbcontpred/ROI_Data/Reflectance_ROI.csv", "ROI_Predicted_Carbon")
#> Rows: 12209 Columns: 7
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ","
#> chr (1): ; File X
#> dbl (6): File Y, Map X, Map Y, Lat, Lon, B1
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

## View the results
View(mappred_c)
```
