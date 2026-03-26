 Load libraries
library(dplyr)
library(readr)
library(ggplot2)

# ----------------------------
# Load dataset
# ----------------------------
data <- read_csv("C:/Users/sebra/Desktop/pain_rct_data.csv") 

# Example columns
# SubjectID | Group | BaselinePain | Week1 | Week4 | Week8

# Check first few rows
head(data)

# Handle missing values
data <- data %>%
  mutate(
    BaselinePain = ifelse(is.na(BaselinePain), median(BaselinePain, na.rm = TRUE), BaselinePain),
    Week1 = ifelse(is.na(Week1), median(Week1, na.rm = TRUE), Week1),
    Week4 = ifelse(is.na(Week4), median(Week4, na.rm = TRUE), Week4),
    Week8 = ifelse(is.na(Week8), median(Week8, na.rm = TRUE), Week8)
  )

# Summary statistics by group
summary_stats <- data %>%
  group_by(Group) %>%
  summarise(
    N = n(),
    Mean_Baseline = mean(BaselinePain),
    SD_Baseline = sd(BaselinePain),
    Mean_Week8 = mean(Week8),
    SD_Week8 = sd(Week8)
  )

print(summary_stats)
