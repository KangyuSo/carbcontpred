# Install and load the package needed to preprocess the data:
install.packages("prospectr")
library(prospectr)

# Read the CSV file as a data frame:
RefDry <- read.csv("data-raw/SoilReflectanceDry_v01.csv")

# Get a summary of the RefDry data frame:
summary(RefDry)

# Calculate continuum removal for the RefDry data frame:
RefDryContinuumRemoved<-as.data.frame(apply(RefDry[,-1], MARGIN=2, FUN =continuumRemoval, wav = RefDry$Wavelength))
RefDryContinuumRemoved<-cbind(Wavelength = RefDry$Wavelength, RefDryContinuumRemoved)

# Save to data folder
usethis::use_data(RefDryContinuumRemoved, overwrite = TRUE)
