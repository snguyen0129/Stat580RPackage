#' Example List
#'
#' Holds variables for use in building examples
#'
#' @import shiny
#'
#'

getHist <- list(1, "Try filling the blank in with 'Sturges', 'Scott', or 'FD' (Freedman-Diaconis) and see what comes up. Note, anything else won't do anything!", "binHist <- hist(fire$problem_count, xlim = (c(0,800)), breaks = ____, xlab = 'Problem count')\nbinHist")
answerHist <- column(6, plotOutput('resultFill1'))
