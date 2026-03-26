

# Load libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Load data
data <- read_csv("C:/Users/sebra/Desktop/pain_rct_data.csv")

# Reshape for plotting
data_long <- data %>%
  pivot_longer(cols = c("BaselinePain", "Week1", "Week4", "Week8"),
               names_to = "Week",
               values_to = "PainScore")

# Plot pain scores over time by group
ggplot(data_long, aes(x = Week, y = PainScore, color = Group, group = Group)) +
  stat_summary(fun = mean, geom = "line", size = 1) +
  stat_summary(fun = mean, geom = "point", size = 2) +
  labs(title = "Pain Scores Over Time by Group",
       x = "Week",
       y = "Pain Score") +
  theme_minimal()
