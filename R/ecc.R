#' Plot Euler Characteristic Curve for 1D Data
#'
#' This function computes and optionally plots the Euler characteristic curve for a given set of 1D data points.
#' The Euler characteristic is calculated by measuring the number of connected components minus the number of holes
#' at different radius levels based on the distances between consecutive points.
#'
#' @param data Numeric vector, a set of data points in 1D.
#' @param quantile Numeric (default = 1), a value in (0,1] specifying the fraction of computed radii to be used.
#'        This allows focusing on a subset of the smallest distances.
#' @param plotgraph Logical (default = TRUE), if TRUE, the function plots the Euler characteristic curve.
#'
#' @details
#' The function first computes the distances between consecutive sorted data points and then uses these distances
#' to create the Euler characteristic curve. The Euler characteristic is calculated as the difference between the number
#' of connected components and the number of holes as the radius (or merging time) increases.
#' The `quantile` parameter allows for trimming the largest distances, which can be useful for visualization purposes.
#' The curve is plotted on a logarithmic scale for both the x-axis (radius) and y-axis (Euler characteristic).
#'
#' @return A list containing:
#'   \item{pointX}{A numeric vector of radius (merging time) values.}
#'   \item{pointY}{A numeric vector of corresponding Euler characteristic values.}
#'
#' @examples
#' data <- runif(100, min = 0, max = 10)  # Generate 1D uniform data
#' ecc_result <- ecc1D(data, quantile = 0.9, plotgraph = TRUE)
#'
#' @export
ecc1D <- function(data, quantile = 1, plotgraph = TRUE)
{
  # Step 1: Sort the radii
  r <- sort(diff(sort(data)))/2
  selection <- 1:(floor(length(r)*quantile))
  r <- r[selection]
  # Initialize vectors to track the number of connected components and holes
  Euler <- length(r):1

  # Euler characteristic is C(t) - H(t)
  pointX <- rep(r, each = 2)
  pointX <- pointX[-1]
  pointY <- rep(Euler, each = 2)
  pointY <- pointY[-length(pointY)]

  # Step 2: Plot the Euler characteristic curve
  if(plotgraph == TRUE)
  {
    plot(log(pointX), log(pointY), type = "l",
         col = "blue", lwd = 2,
         xlab = "Radius (Merging Time)",
         ylab = "Euler Characteristic",
         main = "Euler Characteristic Curve")
  }
  return(list(pointX = pointX, pointY = pointY))
}
