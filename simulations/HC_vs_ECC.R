# Load required libraries
library(ggplot2)

# Generate data
data <- (runif(100))
#data <- (rnorm(100))
# Compute hierarchical clustering
dist_matrix <- dist(data)  # Compute distance matrix
hc <- hclust(dist_matrix, method = "single")  # Single-linkage clustering

# Plot the dendrogram
plot(hc, main = "Hierarchical Clustering Dendrogram", xlab = "Points", ylab = "Distance")


# Plot ECC
ecc1D(data, quantile = 0.5)
