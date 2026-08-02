set.seed(123)
mu <- c(0, 0)
sigma <- matrix(c(1, 0.5, 0.5, 1), ncol = 2)
data <- as.data.frame(mvrnorm(n = 1000, mu = mu, Sigma = sigma))

ggplot(data, aes(x = V1, y = V2)) +
  stat_density_2d(aes(fill = ..level..), geom = "polygon", color = "black") +
  scale_fill_distiller(palette = "Greens", direction = 1) +
  geom_vline(xintercept = 1.645, linetype = "dashed", color = "blue") +
  geom_hline(yintercept = 1.645, linetype = "dashed", color = "blue") +
  annotate("rect", xmin = 1.645, xmax = 3, ymin = 1.645, ymax = 3, fill = "green", alpha = 0.2) +
  labs(title = "Two Primary Endpoints with Co-Primary Outcome",
       x = "Primary Endpoint (X)", y = "Co-Primary Endpoint (Y)") +
  theme_minimal()
