#' Generate Data from a 1D Gaussian Mixture Model
#'
#' This function generates `N` data points from a mixture of `k` Gaussian distributions
#' with given means, standard deviations, and mixture weights.
#'
#' @param N Integer, total number of data points to generate.
#' @param means Numeric vector of length `k`, specifying the means of the `k` Gaussians.
#' @param sds Numeric vector of length `k`, specifying the standard deviations of the `k` Gaussians.
#' @param weights Numeric vector of length `k`, specifying the mixture weights (should sum to 1).
#'
#' @return A numeric vector of `N` values drawn from the specified Gaussian mixture.
#'
#' @details
#' This function randomly assigns each data point to one of the `k` Gaussians based on the
#' given mixture weights and then samples from the corresponding normal distribution.
#'
#' @examples
#' # Generate 1000 points from a mixture of two Gaussians
#' data <- gaussian_mixture_1D(N = 1000, means = c(-2, 3), sds = c(1, 2), weights = c(0.4, 0.6))
#' hist(data, breaks = 50, probability = TRUE, col = "lightblue", main = "Gaussian Mixture")
#'
#' @export
gaussian_mixture_1D <- function(N, means = c(0,2), sds = c(2,3), weights = c(0.4, 0.6))
{
  # Ensure weights sum to 1
  weights <- abs(weights) / sum(abs(weights))
  # Sample component indices based on the mixture weights
  components <- sample(1:length(means), size = N, replace = TRUE, prob = weights)

  # Generate data from the selected Gaussians
  data <- rnorm(N, mean = means[components], sd = sds[components])

  return(data)
}
