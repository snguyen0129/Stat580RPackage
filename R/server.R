#' Shiny app Server
#'
#' Obtains info and returns data
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
  output$outputFill2 <- renderPrint({ input$inputFill2 })
  output$outputCheck3 <- renderText({ input$inputCheck3 })
  output$outputProvide4 <- renderPrint({ input$inputProvide4 })

  # When the submit button is clicked, it will obtain the input and compare to the answer.

  output$outputMult1 <- renderText({ input$inputMult1 })
  answerMult1 <- eventReactive(input$submitMult1, {
    if (input$inputMult1 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })
  output$resultMult1 <- renderText({ answerMult1() })

  output$outputMult5 <- renderText({ input$inputMult5 })
  answerMult5 <- eventReactive(input$submitMult5, {
    if (input$inputMult5 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C: Freedman-Diaconis Rule'
    }
  })
  output$resultMult5 <- renderText({ answerMult5() })

  # Checks if the input matches the answer exactly
  answerCheck3 <- eventReactive(input$submitCheck3, {
    if (isTRUE(all.equal(input$inputCheck3, checkanswers))) {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A, B.'
    }
  })

  # This particular example requires a number for the input
  # The code will have to be modified for other types of questions.
  answerFill2 <- eventReactive(input$submitFill2, {
    # Checks if the input does not contain a non-digit: AKA, if input contains only numbers.
    # The input is stored as a string, so we can't use is.numeric()
    if (!grepl("\\D", input$inputFill2)) {

      # If so, runs the code using the input.
      get_example <- function(x){
        z <- x + as.numeric(input$inputFill2) # as.numeric to convert the input string to a numeric
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

  answerProvide4 <- eventReactive(input$submitProvide4, {
    # Checks if the input does not contain a non-digit: AKA, if input contains only numbers.
    # The input is stored as a string, so we can't use is.numeric()
    # This isn't finished yet, because it requires knowing the question to code it.
    if (eval(parse(text=input$inputProvide4)) == 5) {
      'Correct'
    }
    else {
      paste('Incorrect. Your output was ', eval(parse(text=input$inputProvide4)))
    }
  })

  # Saves the output from above into a variable that is then displayed to the user through the UI.
  # EX: Might save 'Correct' or 'Incorrect. Correct answer is A.'
  output$resultFill2 <- renderText({ answerFill2() })
  output$resultCheck3 <- renderText({ answerCheck3() })
  output$resultProvide4 <- renderText({ answerProvide4() })
}

# Following is work in progress stuff that may or may not be finished
#multAnswer <- function(questionNum, correctAns) {
#  paste("output$outputMult", questionNum, sep = "") <- renderText({ paste("input$inputMult", questionNum, sep = "")})
#
#  paste("answerMult", questionNum, sep = "") <- eventReactive(paste("input$submitMult", questionNum, sep = ""), {
#    if (paste("input$inputMult", questionNum, sep = "")) {
#      "Correct"
#    }
#    else {
#      paste("Incorrect. Correct answer is", correctAns)
#    }
#  })
#  paste("output$resultMult", questionNum, sep="") <- renderText({ paste(paste("answerMult", questionNum, sep = ""), "()")})
#}
