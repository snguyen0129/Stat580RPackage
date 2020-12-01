#' Placeholder text
#'
#' @import hexbin
#' @import MASS
#' @import corrplot
#'

fire <- read.csv("data/fire_incidents.csv")
head(fire)
tail(fire)
colnames(fire)

#hist() function: comparing bins

hist(fire$problem_count, xlim = (c(0,800)), xlab = "Problem count", main = "Sturges")
hist(fire$problem_count, xlim = (c(0,800)), breaks = "Scott", xlab = "Problem count", main = "Scott")
hist(fire$problem_count, xlim = (c(0,800)), breaks = "FD", xlab = "Problem count", main = "Freedman-Diaconis")

#density() func for KDE's
gKernal <- density(fire$problem_count)
plot(gKernal, lwd = 2, col = "black", main = "KDEs for Month Response")

rKernal <- density(fire$problem_count, kernel = "rectangular")
lines(rKernal, lwd = 2, col = "blue")

tKernal <- density(fire$problem_count, kernel = "triangular")
lines(tKernal, lwd = 2, col = "red")

legend(5, 0.025, lwd = 2,
       col = c("black", "blue", "red"),
       legend = c("Gaussian", "Rectangular", "Triangular"), cex=0.6)

# hexbin package
plot(hexbin(fire$month_response, fire$problem_count, xbins = 15), xlab = "Median Age", ylab = "Median Income in Thousands")

bandwidth.nrd(fire$month_response)
bandwidth.nrd(fire$problem_count)

# kde2d() function
#dens <- kde2d(fire$month_response, fire$problem_count, n = 100, h = c(4,3000))
#image(dens, xlab = "Month Response", ylab = "Problem Count")

#scatterplot matrix
pairs(fire[, c("problem_count", "month_response","year_response")])

#corrplot() func
corr_fire <- cor(fire[,c("problem_count", "month_response","year_response")])

corrplot(corr_fire)

#PCA
fire <- fire[,c("problem_count", "month_response","year_response")]
fire_scale <- scale(fire)

P <- eigen(cov(fire_scale))$vectors
lambda <- eigen(cov(fire_scale))$values
eq_pc <- prcomp(fire_scale)
sqrt(lambda)
eq_pc$sdev

eq_pc

#cumulative proportion of total variance
eq_eigen_all <- eigen(cov(fire_scale))
plot(cumsum(eq_eigen_all$values)/sum(eq_eigen_all$values),xlab = "PC", ylab = "Proportion of variance explained")
abline(h = 0.9, lty = 2)
