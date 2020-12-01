#' Fill in the Blank Question
#'
#' Creates the UI for a fill-in-the-blank question using textboxes, allowing a user input to be obtained.
#'
#' @import shiny
#'
#' @param questionNum Integer, the question number
#' @param questionBody String, the question being asked
#'
#' @examples
#' fillBlank(1, "get_example <- function(x){\n  z <- x + ___\n  return(z)\n}\n> get_example(2)\''nOUTPUT: 3")
#'
#'

fillBlank <- function(questionNum, questionBody) {
  column(8, wellPanel(
    h2(paste("Question", questionNum)),
    h4("Sample Question Fill in the Blank"),
    tags$pre(questionBody),
    textInput(paste("inputFill", questionNum, sep = ""), label = "", width = '80px'), # Fixed width depending on how much space they need
    p("Your input is:", style = "color:#888888;"),
    verbatimTextOutput(paste("outputFill", questionNum, sep = "")),
    br(),
    actionButton(paste("submitFill", questionNum, sep = ""), "Submit", class = "btn btn-primary")
  ))
}
