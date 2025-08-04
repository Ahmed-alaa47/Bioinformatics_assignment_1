# dir.create('raw_data')
# dir.create('clean_data')
# dir.create('scripts')
# dir.create('results')
# dir.create('plots etc')
################################ read the data ################################
data = read.csv('patient_info.csv')

################################ inspect ################################
print(head(data))

################################ incorrect or inconsistent ################################
print(sapply(data, class)) # from this we got (gender , diagnosis , smoker) should be factor 

################################ Convert variables to appropriate data types ################################
data$gender <- as.factor(data$gender)
data$diagnosis <- as.factor(data$diagnosis)
data$smoker <- as.factor(data$smoker)

################################ Create a new variable for smoking status ################################

data$smoker_binary <- ifelse(data$smoker == "Yes", 1, 0)


################################ cleaned dataset ################################

write.csv(data, file = "clean_data/patient_info_clean.csv", row.names = FALSE)

################################ Save your R script ################################

writeLines(
  text = c(
    '# Load required library',
    'library(dplyr)',
    '',
    '# Read the raw dataset',
    'df <- read.csv("patient_info.csv", stringsAsFactors = FALSE)',
    '',
    '# Convert categorical columns to factors',
    'df$gender <- as.factor(df$gender)',
    'df$diagnosis <- as.factor(df$diagnosis)',
    'df$smoker <- as.factor(df$smoker)',
    '',
    '# Create binary smoker variable: 1 for Yes, 0 for No',
    'df$smoker_binary <- as.integer(df$smoker == "Yes")',
    '',
    '# Save cleaned dataset',
    'write.csv(df, file = "clean_data/patient_info_clean.csv", row.names = FALSE)'
  ),
  con = "scripts/class_Ib.R"
)
