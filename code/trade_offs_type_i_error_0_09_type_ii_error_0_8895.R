library(ggplot2)

theta_x <- c(-3, 3)
theta_y <- c(-3, 3)
data <- expand.grid(theta_x = seq(-3, 3, by = 0.1), theta_y = seq(-3, 3, by = 0.1))

data$region <- ifelse(data$theta_x > 0 & data$theta_y > 0, "Max Type II Error", "Null Hypothesis Acceptance")

ggplot(data, aes(x = theta_x, y = theta_y)) +
  geom_tile(aes(fill = region), alpha = 0.2) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  annotate("rect", xmin = 0, xmax = 2, ymin = 0, ymax = 2, color = "red", fill = NA, linetype = "solid") +
  annotate("text", x = 2, y = 1.5, label = "Max Type II Error = 0.8895", hjust = 1) +
  scale_fill_manual(values = c("Max Type II Error" = "red", "Null Hypothesis Acceptance" = "pink")) +
  labs(title = "Trade-offs: Type I Error = 0.09 | Type II Error = 0.8895",
       x = "Treatment Effect 1 (θ_x)", 
       y = "Treatment Effect 2 (θ_y)") +
  theme_minimal()
