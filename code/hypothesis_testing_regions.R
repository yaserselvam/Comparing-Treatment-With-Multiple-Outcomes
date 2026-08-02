library(ggplot2)

data <- expand.grid(theta_x = seq(-3, 3, by = 0.1), theta_y = seq(-3, 3, by = 0.1))

data$region <- ifelse(data$theta_x > 0 & data$theta_y > 0, "Rejection Region", "Acceptance Region")

ggplot(data, aes(x = theta_x, y = theta_y)) +
  geom_tile(aes(fill = region), alpha = 0.3) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  scale_fill_manual(values = c("Rejection Region" = "red", "Acceptance Region" = "blue")) +
  labs(title = "Hypothesis Testing Regions",
       x = "Treatment Effect 1 (θ_x)", 
       y = "Treatment Effect 2 (θ_y)") +
  theme_minimal()
