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

  # Histogram
  output$outputFill1 <- renderPrint({ input$inputFill1 })

  answerFill1 <- observeEvent(input$submitFill1, {
    if (input$inputFill1 == "Sturges") {
      output$resultFill1 <- renderPlot({
        hist(fire$problem_count, xlim = (c(0,800)), breaks = "Sturges", xlab = "Problem count", main = "Sturges")
      })
    }
    else if (input$inputFill1 == "Scott") {
      output$resultFill1 <- renderPlot({
        hist(fire$problem_count, xlim = (c(0,800)), breaks = "Scott", xlab = "Problem count", main = "Scott")
      })
    }
    else if (input$inputFill1 == "FD" | input$submitFill1 == "Freedman-Diaconis") {
      output$resultFill1 <- renderPlot({
        hist(fire$problem_count, xlim = (c(0,800)), breaks = "FD", xlab = "Problem count", main = "Freedman-Diaconis")
      })
    }
  })

  # Takes the input and places in a variable
  # Used to display the user's input back to them, allowing them to verify their answer
  output$outputFill2 <- renderPrint({ input$inputFill2 })
  output$outputCheck3 <- renderText({ input$inputCheck3 })
  output$outputProvide4 <- renderPrint({ input$inputProvide4 })


  answerFill2 <- observeEvent(input$submitFill2, {
    if (input$inputFill2 == "gaussian") {
      output$resultFill2 <- renderPlot({
        Kernal <- density(fire$problem_count)
        plot(Kernal, kernel = "gaussian", lwd = 2, col = "black", main = "KDEs for Month Response")
      })
    }
    else if (input$inputFill2 == "rectangular") {
      output$resultFill2 <- renderPlot({
        Kernal <- density(fire$problem_count)
        plot(Kernal, kernel = "rectangular", lwd = 2, col = "black", main = "KDEs for Month Response")
        })
    }
    else if (input$inputFill2 == "triangular" | input$submitFill2 == "triangular") {
      output$resultFill2 <- renderPlot({
        Kernal <- density(fire$problem_count)
        plot(Kernal, kernel = "triangular", lwd = 2, col = "black", main = "KDEs for Month Response")
      })
    }
  })

  # Takes the input and places in a variable
  # Used to display the user's input back to them, allowing them to verify their answer
  output$outputFill5 <- renderPrint({ input$inputFill5 })
  output$outputCheck6 <- renderText({ input$inputCheck6 })
  output$outputProvide7 <- renderPrint({ input$inputProvide7 })

  answerFill3 <- observeEvent(input$submitFill3, {
    if (input$inputFill3 == "month_response") {
      output$resultFill3 <- renderPlot({
        library(hexbin)
        plot(hexbin(fire$month_response, fire$problem_count, xbins = 15), xlab = "Month Response", ylab = "Problem Count")
      })
    }
  })

  answerFill4 <- observeEvent(input$submitFill4, {
    if (input$inputFill4 == "MASS") {
      output$resultFill4 <- renderPlot({
        library(MASS)
        dens <- kde2d(fire$month_response, fire$problem_count, n = 100, h = c(4,3000))
        image(dens, xlab = "Month Response", ylab = "Problem Count")
      })
    }
  })

  answerFill5 <- observeEvent(input$submitFill5, {
    if (input$inputFill5 == "pairs") {
      output$resultFill5 <- renderPlot({ pairs(fire[, c("problem_count", "month_response","year_response")])
      })
    }
  })

  answerFill6 <- observeEvent(input$submitFill6, {
    if (input$inputFill6 == "corr") {
      output$resultFill6 <- renderPlot({
        library(corrplot)
        corr_fire <- cor(fire[,c("problem_count", "month_response","year_response")])
        corrplot(corr_fire)
      })
    }
  })

  answerFill7 <- observeEvent(input$submitFill7, {
    if (input$inputFill7 == "scale") {
      output$resultFill7 <- renderTable({
        fire <- fire[,c("problem_count", "month_response","year_response")]
        fire_scale <- scale(fire)

        P <- eigen(cov(fire_scale))$vectors
        lambda <- eigen(cov(fire_scale))$values
        eq_pc <- prcomp(fire_scale)
        eq_pc$rotation

      })
    }
  })

  answerFill8 <- observeEvent(input$submitFill8, {
    if (input$inputFill8 == "cumsum") {
      output$resultFill8 <- renderPlot({
        eq_eigen_all <- eigen(cov(fire_scale))
        plot(cumsum(eq_eigen_all$values)/sum(eq_eigen_all$values),xlab = "PC", ylab = "Proportion of variance explained")
        abline(h = 0.9, lty = 2)
      })
    }
  })

  # When the submit button is clicked, it will obtain the input and compare to the answer.
  output$outputMult1 <- renderText({ input$inputMult1 })
  answerMult1 <- eventReactive(input$submitMult1, {
    if (input$inputMult1 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult1 <- renderText({ answerMult1() })

  output$outputMult2 <- renderText({ input$inputMult2 })
  answerMult2 <- eventReactive(input$submitMult2, {
    if (input$inputMult2 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })
  output$resultMult2 <- renderText({ answerMult2() })

  output$outputMult3 <- renderText({ input$inputMult3 })
  answerMult3 <- eventReactive(input$submitMult3, {
    if (input$inputMult3 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult3 <- renderText({ answerMult3() })

  output$outputMult4 <- renderText({ input$inputMult4 })
  answerMult4 <- eventReactive(input$submitMult4, {
    if (input$inputMult4 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult4 <- renderText({ answerMult4() })

  output$outputMult5 <- renderText({ input$inputMult5 })
  answerMult5 <- eventReactive(input$submitMult5, {
    if (input$inputMult5 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })
  output$resultMult5 <- renderText({ answerMult5() })

  output$outputMult6 <- renderText({ input$inputMult6 })
  answerMult6 <- eventReactive(input$submitMult6, {
    if (input$inputMult6 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult6 <- renderText({ answerMult6() })

  output$outputMult7 <- renderText({ input$inputMult7 })
  answerMult7 <- eventReactive(input$submitMult7, {
    if (input$inputMult7 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult7 <- renderText({ answerMult7() })

  output$outputMult8 <- renderText({ input$inputMult8 })
  answerMult8 <- eventReactive(input$submitMult8, {
    if (input$inputMult8 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })
  output$resultMult8 <- renderText({ answerMult8() })

  output$outputMult9 <- renderText({ input$inputMult9 })
  answerMult9 <- eventReactive(input$submitMult9, {
    if (input$inputMult9 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult9 <- renderText({ answerMult9() })

  output$outputMult10 <- renderText({ input$inputMult10 })
  answerMult10 <- eventReactive(input$submitMult10, {
    if (input$inputMult10 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })
  output$resultMult10 <- renderText({ answerMult10() })

  output$outputMult11 <- renderText({ input$inputMult11 })
  answerMult11 <- eventReactive(input$submitMult11, {
    if (input$inputMult11 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })
  output$resultMult11 <- renderText({ answerMult11() })

  output$outputMult12 <- renderText({ input$inputMult12 })
  answerMult12 <- eventReactive(input$submitMult12, {
    if (input$inputMult12 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult12 <- renderText({ answerMult12() })

  output$outputMult13 <- renderText({ input$inputMult13 })
  answerMult13 <- eventReactive(input$submitMult13, {
    if (input$inputMult13 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult13 <- renderText({ answerMult13() })

  output$outputMult14 <- renderText({ input$inputMult14 })
  answerMult14 <- eventReactive(input$submitMult14, {
    if (input$inputMult14 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult14 <- renderText({ answerMult14() })

  output$outputMult15 <- renderText({ input$inputMult15 })
  answerMult15 <- eventReactive(input$submitMult15, {
    if (input$inputMult15 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult15 <- renderText({ answerMult15() })

  output$outputMult16 <- renderText({ input$inputMult16 })
  answerMult16 <- eventReactive(input$submitMult16, {
    if (input$inputMult16 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult16 <- renderText({ answerMult16() })

  output$outputMult17 <- renderText({ input$inputMult17 })
  answerMult17 <- eventReactive(input$submitMult17, {
    if (input$inputMult17 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })
  output$resultMult17 <- renderText({ answerMult17() })

  output$outputMult18 <- renderText({ input$inputMult18 })
  answerMult18 <- eventReactive(input$submitMult18, {
    if (input$inputMult18 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })
  output$resultMult18 <- renderText({ answerMult18() })

  output$outputMult19 <- renderText({ input$inputMult19 })
  answerMult19 <- eventReactive(input$submitMult19, {
    if (input$inputMult19 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult19 <- renderText({ answerMult19() })

  output$outputMult20 <- renderText({ input$inputMult20 })
  answerMult20 <- eventReactive(input$submitMult20, {
    if (input$inputMult20 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })
  output$resultMult20 <- renderText({ answerMult20() })

  output$outputMult21 <- renderText({ input$inputMult21 })
  answerMult21 <- eventReactive(input$submitMult21, {
    if (input$inputMult21 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })
  output$resultMult21 <- renderText({ answerMult21() })

  output$outputMult22 <- renderText({ input$inputMult22 })
  answerMult22 <- eventReactive(input$submitMult22, {
    if (input$inputMult22 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult22 <- renderText({ answerMult22() })

  output$outputMult23 <- renderText({ input$inputMult23 })
  answerMult23 <- eventReactive(input$submitMult23, {
    if (input$inputMult23 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult23 <- renderText({ answerMult23() })

  output$outputMult24 <- renderText({ input$inputMult24 })
  answerMult24 <- eventReactive(input$submitMult24, {
    if (input$inputMult24 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })
  output$resultMult24 <- renderText({ answerMult24() })


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
  answerFill1 <- eventReactive(input$submitFill1, {
    # Checks if the input does not contain a non-digit: AKA, if input contains only numbers.
    # The input is stored as a string, so we can't use is.numeric()
    if (!grepl("\\D", input$inputFill1)) {

      # If so, runs the code using the input.
      get_example <- function(x){
        z <- x + as.numeric(input$inputFill1) # as.numeric to convert the input string to a numeric
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
