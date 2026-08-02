set.seed(123)
null_data <- data.frame(X = rnorm(1000), Y = rnorm(1000), group = "Null")
alt_data <- data.frame(X = rnorm(1000, 1), Y = rnorm(1000, 1), group = "Alternative")
data <- rbind(null_data, alt_data)

ggplot(data, aes(x = X, y = Y, color = group)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", color = "black") +
  scale_fill_distiller(palette = "Spectral", direction = 1) +
  geom_vline(xintercept = 1.645, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 1.645, linetype = "dashed", color = "black") +
  labs(title = "Null (Blue) vs. Alternative (Red) Hypothesis Distributions",
       subtitle = "Type I Error Region Highlighted",
       x = "Measurement X", y = "Measurement Y") +
  annotate("text", x = 2, y = 3, label = "Type I Error Region", color = "black") +
  theme_minimal()
