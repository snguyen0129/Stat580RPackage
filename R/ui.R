#' Shiny app UI
#'
#' Builds the visible content
#'
#' @import shiny
#' @import shinydashboard
#'
#'

ui <- dashboardPage(
  dashboardHeader(title = "Our dashboard title here", titleWidth = 500),
  dashboardSidebar("This is the side bar", sidebarMenu(
    menuItem("menuitem1", tabName = "main1"),
    menuSubItem("subitem1", tabName = "sub1"),
    menuSubItem("subitem2", tabName = "sub2"),
    menuSubItem("subitem3", tabName = "sub3"),
    menuSubItem("subitem4", tabName = "sub4"),
    menuSubItem("subitem5", tabName = "sub5"),
    menuItem("menuitem2"))),
  dashboardBody("This is the body", tabItems(
    tabItem(tabName = "main1", "THIS IS MAIN1"),
    tabItem(tabName = "sub1", fluidRow(do.call(multChoice, sampleQuestion), sampleAnswer)),
    tabItem(tabName = "sub2", fluidRow(fillBlank(2, "get_example <- function(x){\n  z <- x + ___\n  return(z)\n}\n> get_example(2)\nOUTPUT: 3"), q2Answer)),
    tabItem(tabName = "sub3", fluidRow(checkBox(3, "Sample Check Box", "Answer 1", "Answer 2", "Answer 3", "Answer 4"), q3Answer)),
    tabItem(tabName = "sub4", fluidRow(freeForm(4, 'Provide code that evaluates to 5.'), q4Answer)),
    tabItem(tabName = "sub5", fluidRow(do.call(multChoice, binQuestion), binAnswer))
    ))
  )

