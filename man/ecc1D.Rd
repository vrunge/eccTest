% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ecc.R
\name{ecc1D}
\alias{ecc1D}
\title{Plot Euler Characteristic Curve for 1D Data}
\usage{
ecc1D(data, quantile = 1, plotgraph = TRUE)
}
\arguments{
\item{data}{Numeric vector, a set of data points in 1D.}

\item{quantile}{Numeric (default = 1), a value in (0,1] specifying the fraction of computed radii to be used.
This allows focusing on a subset of the smallest distances.}

\item{plotgraph}{Logical (default = TRUE), if TRUE, the function plots the Euler characteristic curve.}
}
\value{
A list containing:
  \item{pointX}{A numeric vector of radius (merging time) values.}
  \item{pointY}{A numeric vector of corresponding Euler characteristic values.}
}
\description{
This function computes and optionally plots the Euler characteristic curve for a given set of 1D data points.
The Euler characteristic is calculated by measuring the number of connected components minus the number of holes
at different radius levels based on the distances between consecutive points.
}
\details{
The function first computes the distances between consecutive sorted data points and then uses these distances
to create the Euler characteristic curve. The Euler characteristic is calculated as the difference between the number
of connected components and the number of holes as the radius (or merging time) increases.
The `quantile` parameter allows for trimming the largest distances, which can be useful for visualization purposes.
The curve is plotted on a logarithmic scale for both the x-axis (radius) and y-axis (Euler characteristic).
}
\examples{
data <- runif(100, min = 0, max = 10)  # Generate 1D uniform data
ecc_result <- ecc1D(data, quantile = 0.9, plotgraph = TRUE)

}
