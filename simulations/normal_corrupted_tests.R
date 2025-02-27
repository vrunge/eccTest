
###
### normal distribution tests. Corruption. What to do? ECC test?
###

n <- 100000
data1 <- rnorm(n, mean = 0, sd = 1)  # Generate 100 Gaussian data points
hist(data1, breaks = 100)
# Perform KS test against a standard normal distribution
ks.test(data1, "pnorm", mean = 0, sd = 1)


data2 <- data_gaussian_corrupted_1D(N = n, m = 0, s2 = 1, l = 1, r = 1.1)
hist(data2, breaks = 100)
ks.test(data2, "pnorm", mean = 0, sd = 1)

data3 <- floor(data1*10)/10 + runif(length(data1), -1e-6, 1e-6)
hist(data3, breaks = 100)
ks.test(data3, "pnorm", mean = 0, sd = 1)

library(nortest)
data3 <- floor(data1*100)/100
ad.test(data3)  # Anderson-Darling test
shapiro.test(data3)  # Shapiro-Wilk test (for small samples)

data4 <- floor(data1*10)/10
barplot(table(data4))
ad.test(data4)  # Anderson-Darling test
shapiro.test(data4)  # Shapiro-Wilk test (for small samples)




