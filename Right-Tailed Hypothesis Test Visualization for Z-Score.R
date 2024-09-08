library(ggplot2)
library(dplyr)

z_scores <- seq(-3, 3, length.out = 300)
density <- dnorm(z_scores)

critical_value <- qnorm(0.95)

data <- data.frame(z_scores, density)

data <- data %>%
  mutate(Area = ifelse(z_scores <= critical_value, 'Acceptance', 'Rejection'))

plot <- ggplot(data, aes(x = z_scores, y = density)) +
  geom_line() +
  geom_area(data = data %>% filter(Area == 'Acceptance'), aes(fill = 'Acceptance'), alpha = 0.5) +
  geom_area(data = data %>% filter(Area == 'Rejection'), aes(fill = 'Rejection'), alpha = 0.5) +
  geom_vline(xintercept = critical_value, linetype = "dashed", color = "black") +
  annotate("text", x = critical_value, y = 0, label = sprintf("Critical Z = %.2f", critical_value), vjust = -0.5, hjust = -0.1) +
  annotate("text", x = 0, y = max(density)/2, label = "Mean (μ)", vjust = 0, hjust = 1) +
  scale_fill_manual(values = c("red", "green")) +
  labs(title = "Right-Tailed Hypothesis Test Visualization for Z-Score",
       x = "Z-Score (Standard Deviations from Mean)",
       y = "Density") +
  theme_minimal() +
  theme(legend.position = "none")

print(plot)
