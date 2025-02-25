



dataU <- data_Uniform_mixture_1D(N = 1000, L1 = 5, L2 = 5, M = 2, a = 0.6, b = 0.4)
hist(dataU, breaks = 100)

dataG <- data_gaussian_corrupted_1D(1000)
hist(dataG, breaks = 100)

####


dataU <- data_Uniform_mixture_1D(N = 500, L1 = 5, L2 = 5, M = 0, a = 0.5, b = 0.5)
ecc1D(dataU)
dataG <- data_gaussian_corrupted_1D(500, l = NULL, r = NULL)
ecc1D(dataG)



dataU <- data_Uniform_mixture_1D(N = 50000, L1 = 5, L2 = 5, M = 0, a = 0.5, b = 0.5)
ecc1D(dataU)
dataG <- data_gaussian_corrupted_1D(50000, l = NULL, r = NULL)
ecc1D(dataG)

