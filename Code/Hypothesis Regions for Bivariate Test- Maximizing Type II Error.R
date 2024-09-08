library(ggplot2)

theta1 <- c(-3, 3)
theta2 <- c(-3, 3)

data <- expand.grid(theta1 = seq(-3, 3, by = 0.1), theta2 = seq(-3, 3, by = 0.1))

data$region <- ifelse(data$theta1 > 0 & data$theta2 > 0, "Max Type II Error", "Null Hypothesis Acceptance")

ggplot(data, aes(x = theta1, y = theta2)) +
  geom_tile(aes(fill = region), alpha = 0.2) +
  geom_vline(xintercept = 0, linetype = "dashed", color = "black") +
  geom_hline(yintercept = 0, linetype = "dashed", color = "black") +
  annotate("rect", xmin = 0, xmax = 2, ymin = 0, ymax = 2, color = "red", fill = NA, linetype = "solid") +
  annotate("text", x = 2, y = 1.5, label = "Max Type II Error = 0.8805", hjust = 1) +
  scale_fill_manual(values = c("Max Type II Error" = "red", "Null Hypothesis Acceptance" = "pink")) +
  labs(title = "Hypothesis Regions for Bivariate Test: Maximizing Type II Error",
       x = "Treatment Effect 1 (θ1)", 
       y = "Treatment Effect 2 (θ2)") +
  theme_minimal()
