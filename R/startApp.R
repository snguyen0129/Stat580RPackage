#' Launches the created shiny app
#'
#' @import shiny
#'
#' @export startApp
#'
#' @return shiny application object
#'
#' @examples \dontrun {startApp()}
#'
#'

# Wrapper for shiny::shinyApp()
# The user just has to type startApp() to start it

startApp <- function() {
  shinyApp(ui = ui, server = server)
}
