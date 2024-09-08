library(ggplot2)

sample_size <- c(10, 50, 100, 200, 500)
type_ii_error <- c(0.2, 0.05, 0.01, 0.005, 0.001)

data <- data.frame(sample_size, type_ii_error)

ggplot(data, aes(x = sample_size, y = type_ii_error)) +
  geom_line(color = "black") +
  geom_point(size = 2) +
  annotate("text", x = 50, y = 0.05, label = "β decreases rapidly", vjust = -1) +
  labs(title = "Type II Error Rate vs. Sample Size in Bivariate Testing",
       subtitle = "Reduction in Type II error with increasing sample size",
       x = "Sample Size (n)",
       y = "Type II Error Rate (β)") +
  theme_minimal() +
  theme(axis.text = element_text(size = 12), axis.title = element_text(size = 14))
