set.seed(123)
data <- data.frame(theta_x = rnorm(1000), theta_y = rnorm(1000), error = sample(c("Type I", "Type II"), 1000, replace = TRUE))

ggplot(data, aes(x = theta_x, y = theta_y, color = error)) +
  geom_point(alpha = 0.5) +
  scale_color_manual(values = c("Type I" = "purple", "Type II" = "orange")) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  labs(title = "Hypothesis Regions: Type I and Type II Errors",
       subtitle = "Maximized Type I and Type II Error Regions",
       x = "θ_x", y = "θ_y") +
  theme_minimal()
