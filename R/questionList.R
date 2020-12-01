#' Question List
#'
#' Holds variables for use in building questions
#'
#' @import shiny
#'
#'

q1Question <- list(1, "Which of the following methods for computing optimal bin widths involves both minimizing the Mean-Squared Error formula and doubling the Interquartile Range?", "Sturge's Rule", "Scott’s Normal Reference Rule", "Freedman-Diaconis Rule", "Rizzo's Rule")
q1Answer <- column(4, textOutput('resultMult1'))

q2Question <- list(2, "Which of the following is the default for the “break” argument of the hist() function in R?", "Sturges", "Scott", "Freedman-Diaconis", "None of the above")
q2Answer <- column(4, textOutput('resultMult2'))

checkanswers <- c("A", "B") # This is the answers for the sample checkbox question

#q2Answer <- column(4, textOutput('resultFill2'))
#q3Answer <- column(4, textOutput('resultCheck3'))
#q4Answer <- column(4, textOutput('resultProvide4'))
