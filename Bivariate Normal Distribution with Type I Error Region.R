library(ggplot2)
library(MASS)

mu <- c(0, 0)
sigma <- matrix(c(1, 0.5, 0.5, 1), ncol = 2)
data <- as.data.frame(mvrnorm(n = 1000, mu = mu, Sigma = sigma))

ggplot(data, aes(x = V1, y = V2)) +
  stat_density_2d(aes(fill = after_stat(level)), geom = "polygon", color = "black") +
  scale_fill_distiller(palette = "Blues", direction = 1) +
  geom_vline(xintercept = 1.645, linetype = "dashed", color = "red") + # Critical value for Type I error
  geom_hline(yintercept = 1.645, linetype = "dashed", color = "red") + # Horizontal critical value
  annotate("rect", xmin = 1.645, xmax = 3, ymin = 1.645, ymax = 3, fill = "red", alpha = 0.4) +
  labs(title = "Bivariate Normal Distribution with Type I Error Region",
       subtitle = "Type I Error Rate = 0.05",
       x = "X-axis", y = "Y-axis") +
  theme_minimal()

