#' Multiple Choice Question
#'
#' Creates the UI for a multiple choice question using Radio Buttons, allowing one answer to be selected.
#' Only built for a maximum of four answers.
#'
#' @import shiny
#'
#' @param questionNum Integer, the question number
#' @param questionBody String, the question being asked
#' @param ... String, Answer options
#'
#' @examples
#' multChoice(1, "Sample Multiple Choice", "Answer 1", "Answer 2", "Answer 3", "Answer 4")
#' multChoice(2, "Sample Multiple Choice", "Answer 1", "Answer 2", "Answer 3")
#'
#'

multChoice <- function(questionNum, questionBody, ...) {
  answer <- list(...)
  selection <- c("A","B", "C", "D")

  if (length(answer) < 4){
    for(i in 1:(4 - length(answer))) {
      selection <- selection[-length(selection)] #remove value
    }
  }

  for(i in 1:length(answer)) {
    answer[[i]] <- paste0(selection[i], ") ", answer[i])
  }

  names(selection) <- answer

  column(8, wellPanel(
    h2(paste("Question", questionNum)),
    radioButtons(paste("inputMult", questionNum, sep = ""), h4(questionBody), choices = selection),
    p("You have selected:", style = "color:#888888;"),
    textOutput(paste("outputMult", questionNum, sep= "")),
    br(),
    actionButton(paste("submitMult", questionNum, sep=""), "Submit", class = "btn btn-primary")
  ))
}
