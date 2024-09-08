library(ggplot2)

sample_size <- c(10, 50, 100, 200, 500)
type_ii_error <- c(0.6, 0.4, 0.2, 0.1, 0.05)
data <- data.frame(sample_size, type_ii_error)

ggplot(data, aes(x = sample_size, y = type_ii_error)) +
  geom_line(color = "black") +
  geom_point(size = 3) +
  labs(title = "Type II Error Rate vs. Sample Size",
       subtitle = "As sample size increases, Type II error decreases",
       x = "Sample Size (n)", y = "Type II Error Rate (β)") +
  annotate("text", x = 50, y = 0.4, label = "Significant decrease in Type II error", vjust = -1, color = "blue") +
  theme_minimal()
