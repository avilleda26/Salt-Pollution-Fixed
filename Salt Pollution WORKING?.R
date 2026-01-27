

library(readxl)
library(dplyr)


file_path <- "Consulting_ClassUMBS_Mesocosm_Biochar_NaCl_Master_Data_2025aug27.xlsx"

df <- read_excel(file_path)


df <- df %>%
  mutate(
    tankSize = as.factor(tankSize),
    biocharRate_trt = as.factor(biocharRate_trt),
    saltRate_trt = as.factor(saltRate_trt),
    treatment = as.factor(treatment),
    year = as.integer(year),
    month = as.integer(month),
    jdate = as.integer(jdate)
  )

# Quick check
str(df)
head(df)


 