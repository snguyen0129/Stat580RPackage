#' Fill in the Blank Question
#'
#' Creates the UI for a fill-in-the-blank question using textboxes, allowing a user input to be obtained.
#'
#' @import shiny
#'
#' @param questionNum Integer, the question number
#' @param questionBody String, the question being asked
#'
#'

fillBlank <- function(questionNum, questionBody, questionCode) {
  column(6, wellPanel(
    h2(paste("Question", questionNum)),
    h4(questionBody),
    tags$pre(questionCode),
    textInput(paste("inputFill", questionNum, sep = ""), label = "", width = '80px'), # Fixed width depending on how much space they need
    p("Your input is:", style = "color:#888888;"),
    verbatimTextOutput(paste("outputFill", questionNum, sep = "")),
    br(),
    actionButton(paste("submitFill", questionNum, sep = ""), "Submit", class = "btn btn-primary")
  ))
}
