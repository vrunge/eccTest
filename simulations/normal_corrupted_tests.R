

n <- 1000
data1 <- rnorm(n, mean = 0, sd = 1)  # Generate 100 Gaussian data points
hist(data1, breaks = 100)
# Perform KS test against a standard normal distribution
ks.test(data1, "pnorm", mean = 0, sd = 1)


data2 <- data_gaussian_corrupted_1D(N = n, m = 0, s2 = 1, l = 1, r = 1.2)
hist(data2, breaks = 100)
ks.test(data2, "pnorm", mean = 0, sd = 1)

data3 <- floor(data1*10)/10 + runif(length(data3), -1e-9, 1e-9)
hist(data3, breaks = 100)
ks.test(data3, "pnorm", mean = 0, sd = 1)

library(nortest)
ad.test(data3)  # Anderson-Darling test
shapiro.test(data3)  # Shapiro-Wilk test (for small samples)

