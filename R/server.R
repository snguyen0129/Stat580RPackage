#' Shiny app Server: obtains info and returns data
#'
#' @name server
#'
#' @import shiny
#'
#' @param input provided by shiny
#' @param output provided by shiny
#'
#'

server <- function(input, output) {

  # Takes the input and places in a variable
  # Used to display the user's input back to them, allowing them to verify their answer
  output$outputMult <- renderText({ input$inputMult })
  output$outputCheck <- renderText({ input$inputCheck })
  output$outputFill <- renderPrint({ input$inputFill })
  output$outputProvide <- renderPrint({ input$inputProvide })

  # When the submit button is clicked, it will obtain the input and compare to the answer.
  answerMult <- eventReactive(input$submitMult, {
    if (input$inputMult == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })

  # Checks if the input matches the answer exactly
  answerCheck <- eventReactive(input$submitCheck, {
    if (isTRUE(all.equal(input$inputCheck, checkanswers))) {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A, B.'
    }
  })

  # This particular example requires a number for the input
  # The code will have to be modified for other types of questions.
  answerFill <- eventReactive(input$submitFill, {
    # Checks if the input does not contain a non-digit: AKA, if input contains only numbers.
    # The input is stored as a string, so we can't use is.numeric()
    if (!grepl("\\D", input$inputFill)) {

      # If so, runs the code using the input.
      get_example <- function(x){
        z <- x + as.numeric(input$inputFill) # as.numeric to convert the input string to a numeric
        return(z)
      }

      # States correct or incorrect as necessary.
      if (get_example(2) == 3) {
        'Correct'
      }
      else {
        paste('Incorrect. Your output was ', get_example(2))
      }
    }

    # If not, tells user to input a number.
    else {
      'Please enter a number.'
    }
  })

  answerProvide <- eventReactive(input$submitProvide, {
    # Checks if the input does not contain a non-digit: AKA, if input contains only numbers.
    # The input is stored as a string, so we can't use is.numeric()
    # This isn't finished yet, because it requires knowing the question to code it.
    if (eval(parse(text=input$inputProvide)) == 5) {
      'Correct'
    }
    else {
      paste('Incorrect. Your output was ', eval(parse(text=input$inputProvide)))
    }
  })

  # Saves the output from above into a variable that is then displayed to the user through the UI.
  # EX: Might save 'Correct' or 'Incorrect. Correct answer is A.'
  output$resultMult <- renderText({ answerMult() })
  output$resultCheck <- renderText({ answerCheck() })
  output$resultFill <- renderText({ answerFill() })
  output$resultProvide <- renderText({ answerProvide() })
}
