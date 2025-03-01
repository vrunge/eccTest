#' Generate Uniformly Distributed Data from Two Segments
#'
#' This function generates a set of `N` points distributed over two segments of a real line.
#' The first segment has length `L1`, and the second segment has length `L2`.
#' The gap between the segments is given by `M`. The number of points assigned to each segment
#' is controlled by the probabilities `a` and `b`, and the total number of points to be generated is `N`.
#'
#' @param N Integer, the number of points to be generated.
#' @param L1 Numeric, the length of the first segment.
#' @param L2 Numeric, the length of the second segment.
#' @param M Numeric, the gap between the two segments.
#' @param a Numeric, the probability of assigning a point to the first segment (must be between 0 and 1).
#' @param b Numeric, the probability of assigning a point to the second segment (must be between 0 and 1).
#'
#' @return A numeric vector of length `N` containing the generated points.
#' The points are distributed over two segments, either `[0, L1]` or `[L1 + M, L1 + M + L2]`,
#' based on the probabilities `a` and `b`.
#'
#' @details
#' This function randomly selects `N` points with probabilities `a` and `b` for each segment.
#' Points selected for the first segment are uniformly distributed between 0 and `L1`.
#' Points selected for the second segment are uniformly distributed between `L1 + M` and `L1 + M + L2`.
#' The function returns a numeric vector of length `N` containing the generated points.
#'
#' @examples
#' # Generate 1000 points with 60% assigned to segment 1,
#' # segment 1 having length 5, segment 2 having length 10,
#' # and a gap of 2 between the segments.
#' data_Uniform_mixture_1D(N = 1000, L1 = 5, L2 = 10, M = 2, a = 0.6, b = 0.4)
#'
#' @seealso \code{\link{runif}}
#'
#' @export
data_Uniform_mixture_1D <- function(N = 1000, L1 = 1, L2 = 1, M = 0.3, a = 0.5, b = 0.5)
{
  sel <- sample(c(1,0), size = N, replace = TRUE, prob = c(a,b))
  res <- runif(N, min = 0, max = L1)*sel + runif(N,min = L1 + M, max = L1 + M + L2)*(1-sel)
  return(res)
}
