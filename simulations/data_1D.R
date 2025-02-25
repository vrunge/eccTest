



dataU <- data_Uniform_mixture_1D(N = 1000, L1 = 5, L2 = 10, M = 2, a = 0.6, b = 0.4)
hist(dataU, breaks = 100)

dataG <- data_gaussian_corrupted_1D(1000)
hist(dataG, breaks = 100)




