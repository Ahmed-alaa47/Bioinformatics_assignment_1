# Load required library
library(dplyr)

# Read the raw dataset
df <- read.csv("patient_info.csv", stringsAsFactors = FALSE)

# Convert categorical columns to factors
df$gender <- as.factor(df$gender)
df$diagnosis <- as.factor(df$diagnosis)
df$smoker <- as.factor(df$smoker)

# Create binary smoker variable: 1 for Yes, 0 for No
df$smoker_binary <- as.integer(df$smoker == "Yes")

# Save cleaned dataset
write.csv(df, file = "clean_data/patient_info_clean.csv", row.names = FALSE)
