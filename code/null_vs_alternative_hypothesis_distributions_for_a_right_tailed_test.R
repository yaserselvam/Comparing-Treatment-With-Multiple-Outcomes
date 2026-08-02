library(ggplot2)

x <- seq(-4, 4, length.out = 400)
null_distribution <- dnorm(x, mean = 0, sd = 1)
alternative_distribution <- dnorm(x, mean = 2, sd = 1)

data <- data.frame(x, null_distribution, alternative_distribution)

critical_z <- 1.64

ggplot(data, aes(x)) +
  geom_line(aes(y = null_distribution, color = "Null Distribution"), size = 1.2) +
  geom_line(aes(y = alternative_distribution, color = "Alternative Distribution"), size = 1.2) +
  geom_area(data = subset(data, x >= critical_z), aes(y = null_distribution), fill = "blue", alpha = 0.2) +
  geom_area(data = subset(data, x < critical_z), aes(y = alternative_distribution), fill = "red", alpha = 0.2) +
  scale_color_manual(values = c("Null Distribution" = "blue", "Alternative Distribution" = "red")) +
  geom_vline(xintercept = critical_z, linetype = "dashed", color = "black") +
  annotate("text", x = critical_z, y = 0.25, label = "Critical Z = 1.64", vjust = -1, hjust = 1.5) +
  annotate("text", x = 0, y = 0.15, label = "Type II Error (β)", color = "red") +
  annotate("text", x = 3, y = 0.1, label = "Power of the Test", color = "blue") +
  labs(title = "Null vs. Alternative Hypothesis Distributions for a Right-Tailed Test",
       x = "Z-value", y = "Density") +
  theme_minimal()
