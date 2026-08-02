theta_x <- seq(-3, 3, by = 0.1)
theta_y <- seq(-3, 3, by = 0.1)
data <- expand.grid(theta_x = theta_x, theta_y = theta_y)
data$region <- ifelse(data$theta_x > 0 & data$theta_y > 0, "Rejection", "Acceptance")

ggplot(data, aes(x = theta_x, y = theta_y)) +
  geom_tile(aes(fill = region), alpha = 0.2) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  annotate("rect", xmin = 0, xmax = 2, ymin = 0, ymax = 2, color = "red", fill = NA, linetype = "solid") +
  annotate("text", x = 2, y = 1.5, label = "Max Type I Error = 0.1585", hjust = 1, color = "red") +
  labs(title = "Bivariate Hypothesis Regions with Maximized Type I Error",
       x = "θ₁ (Treatment Effect 1)", y = "θ₂ (Treatment Effect 2)") +
  theme_minimal()
