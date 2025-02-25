
#' Plot Euler Characteristic Curve for 1D Data
#'
#' This function computes and plots the Euler characteristic curve for a given set of 1D data points.
#' The Euler characteristic is calculated by measuring the number of connected components minus the number of holes
#' at different radius levels based on the distances between consecutive points.
#'
#' @param data Numeric vector, a set of data points in 1D.
#'
#' @details
#' The function first computes the distances between consecutive sorted data points, and then uses these distances
#' to create the Euler characteristic curve. The Euler characteristic is calculated as the difference between the number
#' of connected components and the number of holes as the radius (or merging time) increases.
#' The curve is plotted on a logarithmic scale for both the x-axis (radius) and y-axis (Euler characteristic).
#'
#' @return A plot of the Euler characteristic curve with the radius (merging time) on the x-axis
#'         and the Euler characteristic on the y-axis.
#'
#' @export
ecc1D <- function(data)
{
  # Step 1: Sort the radii
  r <- sort(diff(sort(data)))/2

  # Initialize vectors to track the number of connected components and holes
  Euler <- length(r):1

  # Euler characteristic is C(t) - H(t)
  pointX <- rep(r, each = 2)
  pointX <- pointX[-1]
  pointY <- rep(Euler, each = 2)
  pointY <- pointY[-length(pointY)]

  # Step 2: Plot the Euler characteristic curve
  plot(log(pointX), log(pointY), type = "l",
       col = "blue", lwd = 2,
       xlab = "Radius (Merging Time)",
       ylab = "Euler Characteristic",
       main = "Euler Characteristic Curve")
}
