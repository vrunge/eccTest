

ecc1D <- function(radii)
{
  # Step 1: Sort the radii (time points)
  radii_sorted <- sort(radii)

  # Initialize vectors to track the number of connected components and holes
  C <- numeric(length(radii_sorted))  # Number of connected components
  H <- numeric(length(radii_sorted))  # Number of holes

  # Track number of components and holes at each point
  components <- length(radii)  # Initially, all points are separate
  holes <- 0  # No holes at the beginning

  # For each merge time (radius), update the components and holes
  for (i in 1:length(radii_sorted))
  {
    # Each merge reduces the number of components by 1
    components <- components - 1
    # Each time a merge happens, no new holes are created on a real line
    # So holes remain unchanged.

    # Store the values for each radius
    C[i] <- components
    H[i] <- holes
  }

  # Euler characteristic is C(t) - H(t)
  euler_characteristic <- C - H

  # Step 2: Plot the Euler characteristic curve
  plot(radii_sorted, euler_characteristic, type = "l",
       col = "blue", lwd = 2,
       xlab = "Radius (Merging Time)",
       ylab = "Euler Characteristic",
       main = "Euler Characteristic Curve")
}
