#' Example List
#'
#' Holds variables for use in building examples
#'
#' @import shiny
#'
#'

getHist <- list(1, "Try filling the blank in with 'Sturges', 'Scott', or 'FD' (Freedman-Diaconis) and see what comes up. Note, anything else won't do anything!", "binHist <- hist(fire$problem_count, xlim = (c(0,800)), breaks = ____, xlab = 'Problem count')\nbinHist")
answerHist <- column(6, plotOutput('resultFill1'))

getDens <- list(2, "Try filling in the blank with 'gaussian', 'triangular', or 'rectangular' and see what comes up. Note, anything else won't do anything!",
"Kernal <- density(fire$problem_count)\n
plot(Kernal, kernel = '_____', lwd = 2, col = 'black', main = 'KDEs for Month Response')")
answerDens <- column(6, plotOutput('resultFill2'))

getHex <- list(3, "Try filling in the blank to create a hexbin visual comparing month response and problem count. Note, wrong answers won't do anything!",
"library(hexbin)\n
plot(hexbin(fire$_____, fire$problem_count, xbins = 15), xlab = 'Month Response', ylab = 'Problem Count')")
answerHex <- column(6, plotOutput('resultFill3'))

getKde2d <- list(4, "Try filling in the blank to create a kde2d() visual comparing month response and problem count. Note, wrong answers won't do anything!",
"library(____)\n
dens <- kde2d(fire$month_response, fire$problem_count, n = 100, h = c(4,3000))\n
image(dens, xlab = 'Month Response', ylab = 'Problem Count')")
answerKde2d <- column(6, plotOutput('resultFill4'))

getScatter <- list(5, "Try to fill in the blank with a function that creates a 3D scatterplot matrix and compare the results to that of the kde2d() plot. Note wrong answers won't do anything!", "scatter <- _____(fire[, c('problem_count', 'month_response','year_response')])\nscatter")
answerScatter <- column(6, plotOutput('resultFill5'))

getCorr <- list(6, "Try filling in the blank to create a corrplot. Note, any wrong answer won't do anything!", "library(corrplot)\n
corr_fire <- ____(fire[,c('problem_count', 'month_response','year_response')])\n
corrplot(corr_fire)")
answerCorr <- column(6, plotOutput('resultFill6'))

getPCA <- list(7, "Try filling in the blank for PCA in R. Remember: what is the first step you should do EVERY time? Note, wrong answers won't do anything!",
"fire <- fire[,c('problem_count', 'month_response','year_response')]\n
fire_scale <- _____(fire)\n
P <- eigen(cov(fire_scale))$vectors\n
lambda <- eigen(cov(fire_scale))$values\n
eq_pc <- princomp(fire_scale)\n
eq_pc$rotation")
answerPCA <- column(6, tableOutput('resultFill7'))
table

getScree <- list(8, "Try filling in the blank to create a scree plot that captures at least 90% of all variability. Note, wrong answers won't do anything!", "
eq_eigen_all <- eigen(cov(fire_scale))\n
plot(_____(eq_eigen_all$values)/sum(eq_eigen_all$values),xlab = 'PC', ylab = 'Proportion of variance explained')\n
abline(h = 0.9, lty = 2)")
answerScree <- column(6, plotOutput('resultFill8'))

