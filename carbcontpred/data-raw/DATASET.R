# Install and load the package needed to preprocess the data:
install.packages("prospectr")
library(prospectr)

# Read the "SoilReflectanceDry_v01" file as a data frame
data_ref <- read.csv("data-raw/SoilReflectanceDry_v01.csv")

# Get a summary of the data frame
summary(data_ref)

# Calculate continuum removal for the data frame
ref_dry <- as.data.frame(apply(data_ref[,-1], MARGIN=2, FUN =continuumRemoval, wav = data_ref$Wavelength))
ref_dry <- cbind(Wavelength = data_ref$Wavelength, ref_dry)

# Define the lower and higher end of the wavelength range
start_row <- 350
end_row <- 2500

# Select the columns for your subset to be the samples you are interested in
ref_dry <- ref_dry[start_row:end_row, 2:ncol(ref_dry)]

# Calculate the average reflectance for each column in the data set excluding NA values
avg_values <- colMeans(ref_dry, na.rm = TRUE)

# Create a new data set with the ID of the soil samples and the average reflectance values and name them "Sample_ID" and "Reflectance" respectively
ref_dry_avg <- data.frame(
  "Sample_ID" = colnames(ref_dry),
  "Reflectance" = avg_values
)

# Read the "SoilMetrics_v01" file as a data frame
data_met <- read.csv("data-raw/SoilMetrics_v01.csv")

# Get a summary of the data frame:
summary(data_met)

# Install and load the package needed to preprocess the data
install.packages("dplyr")
library(dplyr)

# Merge the organic carbon data from the "data_met" dataset to the "ref_dry_avg" dataset based on the ID of the soil samples
ref_dry_avg <- ref_dry_avg %>%
  left_join(data_met %>% select(Sample_ID, OC), by = "Sample_ID") %>%
  rename(Organic_Carbon = OC)

# Load the summary of the new data frame and ensure that there is no missing data:
summary(ref_dry_avg)

# Save to data folder
usethis::use_data(ref_dry_avg, overwrite = TRUE)