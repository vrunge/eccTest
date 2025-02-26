

# Example usage:
data <- gaussian_mixture_1D(N = 1000, means = c(2, 2), sds = c(1, 1), weights = c(0.4, 0.6))
hist(data, breaks = 50, probability = TRUE, col = "lightblue", main = "Gaussian Mixture Model")
r1 <- ecc1D(data, 0.95)

data <- gaussian_mixture_1D(N = 1000, means = c(2, -2), sds = c(2, 2), weights = c(0.4, 0.6))
#hist(data, breaks = 50, probability = TRUE, col = "lightblue", main = "Gaussian Mixture Model")
par(new = TRUE)
r2 <- ecc1D(data, 0.95)

r1$pointX <- r1$pointX/max(abs(r1$pointX))
r2$pointX <- r2$pointX/max(abs(r2$pointX))

length(r2$pointX)
# Assume r1 and r2 are lists containing pointX and pointY
plot((r1$pointX), (r1$pointY), type = "l", col = "blue", lwd = 2,
     xlab = "log(Radius (Merging Time))", ylab = "log(Euler Characteristic)",
     main = "Euler Characteristic Curves")

# Add the second curve
lines((r2$pointX), (r2$pointY), col = "red", lwd = 2)

# Add a legend to distinguish the curves
legend("bottomleft", legend = c("Curve 1", "Curve 2"),
       col = c("blue", "red"), lwd = 2)





