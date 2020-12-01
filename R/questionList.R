#' Question List
#'
#' Holds variables for use in building questions
#'
#' @import shiny
#'
#'

sampleQuestion <- list(1, "Sample Multiple Choice", "Answer 1", "Answer 2", "Answer 3", "Answer 4")
sampleAnswer <- column(4, textOutput('resultMult1'))

binQuestion <- list(5, "Which of the following methods for computing optimal bin widths involves both minimizing the Mean-Squared Error formula and doubling the Interquartile Range?", "Sturge's Rule", "Scott’s Normal Reference Rule", "Freedman-Diaconis Rule", "Rizzo's Rule")
binAnswer <- column(4, textOutput('resultMult5'))

checkanswers <- c("A", "B") # This is the answers for the sample checkbox question

q2Answer <- column(4, textOutput('resultFill2'))
q3Answer <- column(4, textOutput('resultCheck3'))
q4Answer <- column(4, textOutput('resultProvide4'))
