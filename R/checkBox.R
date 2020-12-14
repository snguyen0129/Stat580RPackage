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
  selection <- c("A","B", "C", "D")

  A <- paste("A)", answerA)
  B <- paste("B)", answerB)
  C <- paste("C)", answerC)
  D <- paste("D)", answerD)
  answer <- list(A, B, C, D)

  names(selection) <- answer
  # selection <- c(varA = "A", varB = "B", varC = "C", varD = "D")

  column(8, wellPanel(
    h2(paste("Question", questionNum)),
    checkboxGroupInput(paste("inputCheck", questionNum, sep = ""), h4(questionBody), choices = selection),
    p("You have selected:", style = "color:#888888;"),
    textOutput(paste("outputCheck", questionNum, sep = "")),
    br(),
    actionButton(paste("submitCheck", questionNum, sep = ""), "Submit", class = "btn btn-primary")
  ))
}
