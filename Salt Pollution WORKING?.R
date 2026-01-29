library(readxl)
df <- read_excel("./Consulting_ClassUMBS_Mesocosm_Biochar_NaCl_Master_Data_2025aug27.xlsx")


library(dplyr)

df <- df %>%
  mutate(
    tankID = factor(tankID),
    tankSize = factor(tankSize),
    biocharRate_trt = factor(biocharRate_trt),
    saltRate_trt = factor(saltRate_trt),
    treatment = factor(treatment),
    year = factor(year),
    month = factor(month)
  )

library(ggplot2)

#Distribution of Cattail Biomass

ggplot(df, aes(x = typhaBiomass_g)) +
  geom_histogram(bins = 30) +
  labs(
    x = "Typha biomass (g)",
    y = "Count",
    title = "Distribution of cattail biomass"
  )

#Mean Biomass by Salt Treatment

ggplot(df, aes(x = saltRate_trt, y = typhaBiomass_g)) +
  stat_summary(fun = mean, geom = "bar") +
  stat_summary(fun.data = mean_se, geom = "errorbar", width = 0.2) +
  labs(
    x = "Salt treatment",
    y = "Mean Typha biomass (g)",
    title = "Mean cattail biomass by salt treatment"
  )


#Biochar x Salt interaction

ggplot(df, aes(x = saltRate_trt, y = typhaBiomass_g, color = biocharRate_trt)) +
  stat_summary(fun = mean, geom = "point") +
  stat_summary(fun = mean, geom = "line", aes(group = biocharRate_trt)) +
  labs(
    x = "Salt treatment",
    y = "Mean Typha biomass (g)",
    color = "Biochar rate",
    title = "Biochar × salt effects on cattail biomass"
  )

#Biomass through time

ggplot(df, aes(x = year, y = typhaBiomass_g, group = tankID)) +
  geom_line(alpha = 0.3) +
  labs(
    x = "Year",
    y = "Typha biomass (g)",
    title = "Cattail biomass trajectories by tank"
  )


