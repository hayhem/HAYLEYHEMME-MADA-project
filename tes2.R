# Load necessary libraries
library(spdep)
library(spatialreg)

# Load example data (Columbus data from the spdep package)
data(columbus)

# Compute the correlation matrix
columbus_cor <- cor(columbus)

# Perform PCA using princomp
pca <- princomp(columbus_cor)

# Extract the first two principal components
pc1 <- pca$scores[, 1]
pc2 <- pca$scores[, 2]

# Create a spatial weights matrix using inverse distance
d <- dnearneigh(coords, d1 = 0, d2 = 1)
w <- nb2listw(d, style = "W")

# Fit a CAR regression model using the first two principal components
car_model <- spautolm(CRIME ~ pc1 + pc2, data = columbus, listw = w)
summary(car_model)

pc1
