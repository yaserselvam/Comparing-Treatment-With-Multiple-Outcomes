library(ggplot2)

set.seed(123)
null_data <- data.frame(theta1 = rnorm(1000), theta2 = rnorm(1000), group = "Null")
alt_data <- data.frame(theta1 = rnorm(1000, 1), theta2 = rnorm(1000, 1), group = "Alternative")

data <- rbind(null_data, alt_data)

ggplot(data, aes(x = theta1, y = theta2, color = group)) +
  geom_point(alpha = 0.3, size = 2) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  scale_color_manual(values = c("Null" = "blue", "Alternative" = "red")) +
  labs(title = "Low Correlation: Null (blue) vs. Alternative (red)",
       subtitle = "Type I Error: 0.0402 | Type II Error: 0.9184",
       x = "θ_1",
       y = "θ_2") +
  theme_minimal()
