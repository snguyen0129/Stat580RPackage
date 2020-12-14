#' Fill in the Blank Example
#'
#' Creates the UI for a fill-in-the-blank example using textboxes, allowing a user input to be obtained.
#'
#' @import shiny
#'
#' @param exampleNum Integer, the example number
#' @param exampleBody String, the example question being asked
#' @param exampleCode String, the code provided to fill the blank in. Will be formatted as code.
#'
#' @examples
#' fillBlank(1, "What do you input for getNum to equal 5?", "getNum <- (2 + ___)")
#'
#'

fillBlank <- function(exampleNum, exampleBody, exampleCode) {
  column(6, wellPanel(
    h2(paste("Example", exampleNum)),
    h4(exampleBody),
    tags$pre(exampleCode),
    textInput(paste("inputFill", exampleNum, sep = ""), label = "", width = '100px'), # Fixed width depending on how much space they need
    p("Your input is:", style = "color:#888888;"),
    verbatimTextOutput(paste("outputFill", exampleNum, sep = "")),
    br(),
    actionButton(paste("submitFill", exampleNum, sep = ""), "Submit", class = "btn btn-primary")
  ))
}
