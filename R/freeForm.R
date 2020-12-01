#' Free Form Question
#'
#' Creates the UI for a free form question using wide textboxes, allowing a user input to be obtained.
#'
#' @import shiny
#'
#' @param questionNum Integer, the question number
#' @param questionBody String, the question being asked
#'
#' @examples
#' freeForm(1, 'Provide code that evaluates to 5.')
#'
#'

freeForm <- function(questionNum, questionBody) {
  column(8, wellPanel(
    h2(paste("Question", questionNum)),
    h4("Provide code that creates the specified output"),
    textAreaInput(paste("inputProvide", questionNum, sep = ""), label = questionBody, width = "100%"),
    p("Your input is:", style = "color:#888888;"),
    verbatimTextOutput(paste("outputProvide", questionNum, sep = "")),
    br(),
    actionButton(paste("submitProvide", questionNum, sep = ""), "Submit", class = "btn btn-primary")
  ))
}
