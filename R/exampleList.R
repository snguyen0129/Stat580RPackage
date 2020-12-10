#' Example List
#'
#' Holds variables for use in building examples
#'
#' @import shiny
#'
#'

getHist <- list(1, "Try filling the blank in with 'Sturges', 'Scott', or 'FD' (Freedman-Diaconis) and see what comes up. Note, anything else won't do anything!", "binHist <- hist(fire$problem_count, xlim = (c(0,800)), breaks = ____, xlab = 'Problem count')\nbinHist")
answerHist <- column(6, plotOutput('resultFill1'))

getScatter <- list(5, "Try to fill in the blank with a function that creates a 3D scatterplot matrix and compare the results to that of the kde2d() plot. Note any wrong answer won't do anything!", "scatter <- _____(fire[, c('problem_count', 'month_response','year_response')])\nscatter")
answerScatter <- column(6, plotOutput('resultFill5'))

getCorr <- list(6, "Try filling in the blank to create a corrplot. Note, any wrong answer won't do anything!", "library(corrplot)\n
corr_fire <- ____(fire[,c('problem_count', 'month_response','year_response')])\n
corrplot(corr_fire)")
answerCorr <- column(6, plotOutput('resultFill6'))

getPCA <- list(7, "Try filling in the blank for PCA in R. Remember: what is the first step you should do EVERY time? Note, any wrong answer won't do anything!", "
fire <- fire[,c('problem_count', 'month_response','year_response')]\n
fire_scale <- _____(fire)\n
P <- eigen(cov(fire_scale))$vectors\n
lambda <- eigen(cov(fire_scale))$values\n
eq_pc <- prcomp(fire_scale)\n
sqrt(lambda)\n
eq_pc$sdev")
answerPCA <- column(6, plotOutput('resultFill7'))

getScree <- list(8, "Try filling in the blank to create a scree plot that captures at least 90% of all variability. Note, any wrong answer won't do anything!", "
eq_eigen_all <- eigen(cov(fire_scale))\n
plot(_____(eq_eigen_all$values)/sum(eq_eigen_all$values),xlab = 'PC', ylab = 'Proportion of variance explained')\n
abline(h = 0.9, lty = 2)")
answerScree <- column(6, plotOutput('resultFill8'))

