#' Shiny app UI: builds the visible content
#'
#' @name ui
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
    menuItem("menuitem2"))),
  dashboardBody("This is the body", tabItems(
    tabItem(tabName = "main1", "THIS IS MAIN1"),
    tabItem(tabName = "sub1", fluidRow(multChoice, q1Answer)),
    tabItem(tabName = "sub2", fluidRow(fillBlank, q2Answer)),
    tabItem(tabName = "sub3", fluidRow(checkBox, q3Answer)),
    tabItem(tabName = "sub4", fluidRow(freeForm, q4Answer))))
  )
