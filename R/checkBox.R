#' Checkbox Question
#'
#' Creates the UI for a multiple choice question using Checkboxes, allowing multiple answers to be selected.
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
#' checkBox(1, "Sample Checkboxes", "Answer 1", "Answer 2", "Answer 3", "Answer 4")
#'
#'

checkBox <- function(questionNum, questionBody, answerA, answerB, answerC, answerD) {
  A <- paste("A)", answerA)
  B <- paste("B)", answerB)
  C <- paste("C)", answerC)
  D <- paste("D)", answerD)
  selection <- c(A = "A", B = "B", C = "C", D = "D")

  column(8, wellPanel(
    h2(paste("Question", questionNum)),
    checkboxGroupInput(paste("inputCheck", questionNum, sep = ""), h4(questionBody), choices = selection),
    p("You have selected:", style = "color:#888888;"),
    textOutput(paste("outputCheck", questionNum, sep = "")),
    br(),
    actionButton(paste("submitCheck", questionNum, sep = ""), "Submit", class = "btn btn-primary")
  ))
}
