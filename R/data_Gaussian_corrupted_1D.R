
#' Generate Corrupted Gaussian Data (Excluding Specified Ranges)
#'
#' This function generates `N` points from a Gaussian distribution with mean `m` and variance `s2`,
#' excluding any points that fall within specified ranges (given by `l` and `r`).
#'
#' @param N Integer, the number of points to be generated.
#' @param m Numeric, the mean of the Gaussian distribution.
#' @param s2 Numeric, the variance of the Gaussian distribution.
#' @param l Numeric vector, the lower bounds of the ranges to exclude.
#' @param r Numeric vector, the upper bounds of the ranges to exclude.
#'
#' @return A numeric vector of length `N` containing the corrupted Gaussian data,
#'         with points removed from the specified ranges.
#'
#' @details
#' This function generates `N` points from a Gaussian distribution. If any point falls within the
#' ranges defined by the vectors `l` and `r`, it is excluded from the result.
#' The points that remain will be outside the specified ranges.
#'
#' @examples
#' # Generate 1000 corrupted Gaussian points with mean 0 and variance 1,
#' # excluding points in the ranges [-1.5, -1] and [1.3, 2].
#' data_gaussian_corrupted_1D(N = 1000, m = 0, s2 = 1, l = c(-1.5, 1.3), r = c(-1, 2))
#'
#' @seealso \code{\link{rnorm}}
#'
#' @export
data_gaussian_corrupted_1D <- function(N = 1000, m = 0, s2 = 1, l = c(-1.5, 1.3), r = c(-1, 2))
{
  # Preallocate vector for efficiency
  res <- numeric(N)

  # Generate N points, excluding those in the specified ranges
  n <- 0
  while (n < N) {
    # Generate a batch of random values from the Gaussian distribution
    temp <- rnorm(N - n, mean = m, sd = sqrt(s2))

    # Check for points not in the specified ranges
    valid_points <- TRUE
    for (i in seq_along(l)) {
      valid_points <- valid_points & !(temp > l[i] & temp < r[i])
    }

    # Select valid points
    valid_temp <- temp[valid_points]

    # If valid points exist, append them to the result
    num_valid <- length(valid_temp)
    res[(n + 1):(n + num_valid)] <- valid_temp
    n <- n + num_valid
  }

  return(res)
}

