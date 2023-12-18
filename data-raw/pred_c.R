# Install and load the package needed to preprocess the data:
remotes::install_github("KangyuSo/carbcontpred", 
                        build_vignettes = TRUE)
library(carbcontpred)

## Read the data frame "ref_dry_avg"
data <- data.frame(ref_dry_avg)

# Get a summary of the data frame
summary(data)

## Create a linear regression model based on the data frame, cross-validate the model, and use the model to predict the organic carbon content of soil samples based on their reflectance
pred_c <- cpred(data, "Reflectance", "Organic_Carbon", 0.7, 10, "Predicted_Organic_Carbon")

# Load the summary of the new data frame and ensure that there is no missing data:
summary(pred_c)

# Save to data folder
usethis::use_data(pred_c, overwrite = TRUE)