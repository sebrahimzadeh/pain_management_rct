# Load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(broom)


data <- read_csv("C:/Users/sebra/Desktop/pain_rct_data.csv")  

# Convert Group to factor
data$Group <- as.factor(data$Group)

# Example: calculate change from baseline to Week8
data <- data %>%
  mutate(Change_Week8 = Week8 - BaselinePain)

# t-test between groups at Week8
t_test <- t.test(Change_Week8 ~ Group, data = data)
print(t_test)

# Linear model for repeated measures (baseline to Week8)
lm_model <- lm(Change_Week8 ~ Group + BaselinePain, data = data)
summary(lm_model)
