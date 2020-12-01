#' Multiple Choice Question
#'
#' Creates the UI for a multiple choice question using Radio Buttons, allowing one answer to be selected.
#'
#' @import shiny
#'
#' @param questionNum Integer, the question number
#' @param questionBody String, the question being asked
#' @param answerA String, option A
#' @param answerB String, option B
#' @param answerC String, option C
#' @param answerD String, option D
#'
#' @examples
#' multChoice(1, "Sample Multiple Choice", "Answer 1", "Answer 2", "Answer 3", "Answer 4")
#'
#'

multChoice <- function(questionNum, questionBody, answerA, answerB, answerC, answerD) {
  A <- paste("A)", answerA)
  B <- paste("B)", answerB)
  C <- paste("C)", answerC)
  D <- paste("D)", answerD)
  selection <- c("A","B", "C", "D")
  names(selection) <- c(A, B, C, D)

  column(8, wellPanel(
    h2(paste("Question", questionNum)),
    radioButtons(paste("inputMult", questionNum, sep = ""), h4(questionBody), choices = selection),
    p("You have selected:", style = "color:#888888;"),
    textOutput(paste("outputMult", questionNum, sep= "")),
    br(),
    actionButton(paste("submitMult", questionNum, sep=""), "Submit", class = "btn btn-primary")
  ))
}
