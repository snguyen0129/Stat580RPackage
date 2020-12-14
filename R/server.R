#' Shiny app Server
#'
#' Obtains info and returns data
#'
#' @import shiny MASS hexbin corrplot
#'
#' @param input provided by shiny
#' @param output provided by shiny
#'
#'

server <- function(input, output) {

  # Examples
  # Output that displays the user's input back to them
  output$outputFill1 <- renderPrint({ input$inputFill1 })
  output$outputFill2 <- renderPrint({ input$inputFill2 })
  output$outputFill3 <- renderPrint({ input$inputFill3 })
  output$outputFill4 <- renderPrint({ input$inputFill4 })
  output$outputFill5 <- renderPrint({ input$inputFill5 })
  output$outputFill6 <- renderPrint({ input$inputFill6 })
  output$outputFill7 <- renderPrint({ input$inputFill7 })
  output$outputFill8 <- renderPrint({ input$inputFill8 })

  # Observes if the submit button has been pressed. If so, then it checks if the user input
  # matches the expected input.
  # If it matches, it will run the code that the example says it will run. If not, it does nothing.
  answerFill1 <- observeEvent(input$submitFill1, {
    if (tolower(input$inputFill1) == "sturges") {
      output$resultFill1 <- renderPlot({
        hist(fire$problem_count, xlim = (c(0,800)), breaks = "Sturges", xlab = "Problem count", main = "Sturges")
      })
    }
    else if (tolower(input$inputFill1) == "scott") {
      output$resultFill1 <- renderPlot({
        hist(fire$problem_count, xlim = (c(0,800)), breaks = "Scott", xlab = "Problem count", main = "Scott")
      })
    }
    else if (tolower(input$inputFill1) == "fd" | input$submitFill1 == "freedman-diaconis") {
      output$resultFill1 <- renderPlot({
        hist(fire$problem_count, xlim = (c(0,800)), breaks = "FD", xlab = "Problem count", main = "Freedman-Diaconis")
      })
    }
  })

  answerFill2 <- observeEvent(input$submitFill2, {
    if (tolower(input$inputFill2) == "gaussian") {
      output$resultFill2 <- renderPlot({
        getKernel <- density(fire$problem_count, kernel = "gaussian")
        plot(getKernel, lwd = 2, col = "black", main = "KDEs for Month Response")
      })
    }
    else if (tolower(input$inputFill2) == "rectangular") {
      output$resultFill2 <- renderPlot({
        getKernel <- density(fire$problem_count, kernel = "rectangular")
        plot(getKernel, lwd = 2, col = "black", main = "KDEs for Month Response")
      })
    }
    else if (tolower(input$inputFill2) == "triangular") {
      output$resultFill2 <- renderPlot({
        getKernel <- density(fire$problem_count, kernel = "triangular")
        plot(getKernel, lwd = 2, col = "black", main = "KDEs for Month Response")
      })
    }
  })

  # Uses hexbin package
  answerFill3 <- observeEvent(input$submitFill3, {
    if (tolower(input$inputFill3) == "hexbin") {
      output$resultFill3 <- renderPlot({
        plot(hexbin(fire$month_response, fire$problem_count, xbins = 15), xlab = "Month Response", ylab = "Problem Count")
      })
    }
  })

  # Uses MASS package
  answerFill4 <- observeEvent(input$submitFill4, {
    if (input$inputFill4 == "MASS") {
      output$resultFill4 <- renderPlot({
        dens <- kde2d(fire$month_response, fire$problem_count, n = 100, h = c(4,3000))
        image(dens, xlab = "Month Response", ylab = "Problem Count")
      })
    }
  })

  answerFill5 <- observeEvent(input$submitFill5, {
    if (tolower(input$inputFill5) == "pairs") {
      output$resultFill5 <- renderPlot({ pairs(fire[, c("problem_count", "month_response","year_response")])
      })
    }
  })

  # Uses corrplot package
  answerFill6 <- observeEvent(input$submitFill6, {
    if (tolower(input$inputFill6) == "cor") {
      output$resultFill6 <- renderPlot({
        corr_fire <- cor(fire[,c("problem_count", "month_response","year_response")])
        corrplot(corr_fire)
      })
    }
  })

  # Renders a table instead of a plot
  answerFill7 <- observeEvent(input$submitFill7, {
    if (tolower(input$inputFill7) == "scale") {
      output$resultFill7 <- renderTable({
        fire2 <- fire[,c("problem_count", "month_response","year_response")]
        fire_scale <- scale(fire2)

        P <- eigen(cov(fire_scale))$vectors
        lambda <- eigen(cov(fire_scale))$values
        eq_pc <- prcomp(fire_scale)
        eq_pc$rotation
      })
    }
  })

  answerFill8 <- observeEvent(input$submitFill8, {
    fire2 <- fire[,c("problem_count", "month_response","year_response")]
    fire_scale <- scale(fire2)

    if (tolower(input$inputFill8) == "cumsum") {
      output$resultFill8 <- renderPlot({
        eq_eigen_all <- eigen(cov(fire_scale))
        plot(cumsum(eq_eigen_all$values)/sum(eq_eigen_all$values),xlab = "PC", ylab = "Proportion of variance explained")
        abline(h = 0.9, lty = 2)
      })
    }
  })

  # Multiple Choice Questions
  # Output that displays the user's input back to them
  output$outputMult1 <- renderText({ input$inputMult1 })
  output$outputMult2 <- renderText({ input$inputMult2 })
  output$outputMult3 <- renderText({ input$inputMult3 })
  output$outputMult4 <- renderText({ input$inputMult4 })
  output$outputMult5 <- renderText({ input$inputMult5 })
  output$outputMult6 <- renderText({ input$inputMult6 })
  output$outputMult7 <- renderText({ input$inputMult7 })
  output$outputMult8 <- renderText({ input$inputMult8 })
  output$outputMult9 <- renderText({ input$inputMult9 })
  output$outputMult10 <- renderText({ input$inputMult10 })
  output$outputMult11 <- renderText({ input$inputMult11 })
  output$outputMult12 <- renderText({ input$inputMult12 })
  output$outputMult13 <- renderText({ input$inputMult13 })
  output$outputMult14 <- renderText({ input$inputMult14 })
  output$outputMult15 <- renderText({ input$inputMult15 })
  output$outputMult16 <- renderText({ input$inputMult16 })
  output$outputMult17 <- renderText({ input$inputMult17 })
  output$outputMult18 <- renderText({ input$inputMult18 })
  output$outputMult19 <- renderText({ input$inputMult19 })
  output$outputMult20 <- renderText({ input$inputMult20 })
  output$outputMult21 <- renderText({ input$inputMult21 })
  output$outputMult22 <- renderText({ input$inputMult22 })
  output$outputMult23 <- renderText({ input$inputMult23 })
  output$outputMult24 <- renderText({ input$inputMult24 })

  # A reaction that occurs when the submit button is pressed. If the user choice matches the
  # expected answer, it will assign text that states it was correct. If not, it will assign
  # text that will state it was incorrect, and show the correct answer as well.
  # NOTE: This DOES NOT display the text yet.

  answerMult1 <- eventReactive(input$submitMult1, {
    if (input$inputMult1 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  answerMult2 <- eventReactive(input$submitMult2, {
    if (input$inputMult2 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })

  answerMult3 <- eventReactive(input$submitMult3, {
    if (input$inputMult3 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult4 <- eventReactive(input$submitMult4, {
    if (input$inputMult4 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult5 <- eventReactive(input$submitMult5, {
    if (input$inputMult5 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })

  answerMult6 <- eventReactive(input$submitMult6, {
    if (input$inputMult6 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  answerMult7 <- eventReactive(input$submitMult7, {
    if (input$inputMult7 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  answerMult8 <- eventReactive(input$submitMult8, {
    if (input$inputMult8 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })

  answerMult9 <- eventReactive(input$submitMult9, {
    if (input$inputMult9 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult10 <- eventReactive(input$submitMult10, {
    if (input$inputMult10 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })

  answerMult11 <- eventReactive(input$submitMult11, {
    if (input$inputMult11 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })

  answerMult12 <- eventReactive(input$submitMult12, {
    if (input$inputMult12 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  answerMult13 <- eventReactive(input$submitMult13, {
    if (input$inputMult13 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  answerMult14 <- eventReactive(input$submitMult14, {
    if (input$inputMult14 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  answerMult15 <- eventReactive(input$submitMult15, {
    if (input$inputMult15 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult16 <- eventReactive(input$submitMult16, {
    if (input$inputMult16 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult17 <- eventReactive(input$submitMult17, {
    if (input$inputMult17 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })

  answerMult18 <- eventReactive(input$submitMult18, {
    if (input$inputMult18 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })

  answerMult19 <- eventReactive(input$submitMult19, {
    if (input$inputMult19 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult20 <- eventReactive(input$submitMult20, {
    if (input$inputMult20 == 'A') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is A.'
    }
  })

  answerMult21 <- eventReactive(input$submitMult21, {
    if (input$inputMult21 == 'D') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is D.'
    }
  })

  answerMult22 <- eventReactive(input$submitMult22, {
    if (input$inputMult22 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })

  answerMult23 <- eventReactive(input$submitMult23, {
    if (input$inputMult23 == 'B') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is B.'
    }
  })
  output$resultMult23 <- renderText({ answerMult23() })

  answerMult24 <- eventReactive(input$submitMult24, {
    if (input$inputMult24 == 'C') {
      'Correct'
    }
    else {
      'Incorrect. Correct answer is C.'
    }
  })

  # Displays the output that is obtained from answerMult

  output$resultMult1 <- renderText({ answerMult1() })
  output$resultMult2 <- renderText({ answerMult2() })
  output$resultMult3 <- renderText({ answerMult3() })
  output$resultMult4 <- renderText({ answerMult4() })
  output$resultMult5 <- renderText({ answerMult5() })
  output$resultMult6 <- renderText({ answerMult6() })
  output$resultMult7 <- renderText({ answerMult7() })
  output$resultMult8 <- renderText({ answerMult8() })
  output$resultMult9 <- renderText({ answerMult9() })
  output$resultMult10 <- renderText({ answerMult10() })
  output$resultMult11 <- renderText({ answerMult11() })
  output$resultMult12 <- renderText({ answerMult12() })
  output$resultMult13 <- renderText({ answerMult13() })
  output$resultMult14 <- renderText({ answerMult14() })
  output$resultMult15 <- renderText({ answerMult15() })
  output$resultMult16 <- renderText({ answerMult16() })
  output$resultMult17 <- renderText({ answerMult17() })
  output$resultMult18 <- renderText({ answerMult18() })
  output$resultMult19 <- renderText({ answerMult19() })
  output$resultMult20 <- renderText({ answerMult20() })
  output$resultMult21 <- renderText({ answerMult21() })
  output$resultMult22 <- renderText({ answerMult22() })
  output$resultMult23 <- renderText({ answerMult23() })
  output$resultMult24 <- renderText({ answerMult24() })

  # Obtains image files from the /images folder and places in a variable to be rendered.
  # $pcatable and $pcatable2 use the same images because it did not allow us to use the same
  # variable twice.
  output$pcatable <- renderImage({
    filename <- normalizePath(file.path('./images', 'pcatable.png'))
    list(src = filename)}, deleteFile = FALSE)

  output$pcatable2 <- renderImage({
    filename <- normalizePath(file.path('./images', 'pcatable.png'))
    list(src = filename)}, deleteFile = FALSE)

  output$screeplot <- renderImage({
    filename <- normalizePath(file.path('./images', 'screeplot.png'))
    list(src = filename)}, deleteFile = FALSE)

  # UNUSED CHECKBOX QUESTIONS
  #answerCheck3 <- eventReactive(input$submitCheck3, {
  #  if (isTRUE(all.equal(input$inputCheck3, checkanswers))) {
  #    'Correct'
  #  }
  #  else {
  #    'Incorrect. Correct answer is A, B.'
  #  }
  #})

  # Saves the output from above into a variable that is then displayed to the user through the UI.
  # EX: Might save 'Correct' or 'Incorrect. Correct answer is A.'
  #output$resultCheck3 <- renderText({ answerCheck3() })
}
