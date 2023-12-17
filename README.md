
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
remotes::install_github("KangyuSo/carbcontpred", 
                         build_vignettes = TRUE)
#> Downloading GitHub repo KangyuSo/carbcontpred@HEAD
#> 
#> ── R CMD build ─────────────────────────────────────────────────────────────────
#>      checking for file ‘/private/var/folders/j9/6__ydzcn15q_pgcfcdxhbrvc0000gn/T/Rtmpt4lVJX/remotesac83e424f5/KangyuSo-carbcontpred-e29a5ce/DESCRIPTION’ ...  ✔  checking for file ‘/private/var/folders/j9/6__ydzcn15q_pgcfcdxhbrvc0000gn/T/Rtmpt4lVJX/remotesac83e424f5/KangyuSo-carbcontpred-e29a5ce/DESCRIPTION’
#>   ─  preparing ‘carbcontpred’:
#>    checking DESCRIPTION meta-information ...  ✔  checking DESCRIPTION meta-information
#>   ─  installing the package to build vignettes
#>      creating vignettes ...  ✔  creating vignettes (8.4s)
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>        NB: this package now depends on R (>= 3.5.0)
#>        WARNING: Added dependency on R >= 3.5.0 because serialized objects in
#>      serialize/load version 3 cannot be read in older versions of R.
#>      File(s) containing such objects:
#>        ‘carbcontpred/vignettes/ref_dry_avg.rda’
#>   ─  building ‘carbcontpred_0.0.0.9000.tar.gz’
#>      
#> 
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
