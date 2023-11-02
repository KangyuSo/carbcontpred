# Install and load the package needed to preprocess the data
install.packages("prospectr")
library(prospectr)

# Read the CSV file as a data frame
data <- read.csv("data-raw/SoilReflectanceDry_v01.csv")

# Get a summary of the data frame
summary(data)

# Calculate continuum removal for the data frame
ref_dry <- as.data.frame(apply(data[,-1], MARGIN=2, FUN =continuumRemoval, wav = data$Wavelength))
ref_dry <- cbind(Wavelength = data$Wavelength, ref_dry)

# Get a summary of the new data frame
summary(ref_dry)

# Save to data folder
usethis::use_data(ref_dry, overwrite = TRUE)
