# Install and load the package needed to preprocess the data
install.packages("prospectr")
library(prospectr)

# Read the "SoilReflectanceDry_v01" file as a data frame
data <- read.csv("data-raw/SoilReflectanceDry_v01.csv")

# Get a summary of the data frame
summary(data)

# Calculate continuum removal for the data frame
ref_dry <- as.data.frame(apply(data[,-1], MARGIN=2, FUN =continuumRemoval, wav = data$Wavelength))
ref_dry <- cbind(Wavelength = data$Wavelength, ref_dry)

# Select the rows to be the target wavelegths and the columns to be the target samples
ref_dry <- ref_dry[350:2500, 2:ncol(ref_dry)]

# Calculate the average reflectance of the columns and exclude NA values
avg_values <- colMeans(ref_dry, na.rm=T)

# Create a new data with "Sample_ID" and "Reflectance" columns containing the soil sample ID and average reflectance respectively
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

# Merge the organic carbon data from "data_met" to "ref_dry_avg" dataset based on sample ID
ref_dry_avg <- ref_dry_avg %>%
  left_join(data_met %>% select(Sample_ID, OC), by = "Sample_ID") %>%
  rename(Organic_Carbon = OC)

# Get a summary of the new data frame
summary(ref_dry_avg)

# Save to data folder
usethis::use_data(ref_dry_avg, overwrite = TRUE)
