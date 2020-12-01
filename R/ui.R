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
  dashboardSidebar(h3("Navigation", align = "center"), sidebarMenu(
    menuItem("Introduction", tabName = "intro"),
    menuItem("Visualization in Single Dimensions", tabName = "singleVis"),
    menuSubItem("subitem1", tabName = "sub1"),
    menuSubItem("subitem2", tabName = "sub2"),
    menuSubItem("subitem3", tabName = "sub3"),
    menuSubItem("subitem4", tabName = "sub4"),
    menuSubItem("subitem5", tabName = "sub5"),
    menuItem("Visual in Double Dimensions", tabName = "doubleVis"),
    menuSubItem("subitem6", tabName = "sub6"),
    menuSubItem("subitem7", tabName = "sub7"),
    menuSubItem("subitem8", tabName = "sub8"),
    menuSubItem("subitem9", tabName = "sub9"),
    menuSubItem("subitem10", tabName = "sub10"),
    menuItem("Correlation Visualization", tabName = "corrVis"),
    menuSubItem("subitem11", tabName = "sub11"),
    menuSubItem("subitem12", tabName = "sub12"),
    menuSubItem("subitem13", tabName = "sub13"),
    menuItem("Principal Component Analysis", tabName = "prinComp"),
    menuSubItem("subitem16", tabName = "sub16"),
    menuSubItem("subitem17", tabName = "sub17"),
    menuSubItem("subitem18", tabName = "sub18")
    )),
  dashboardBody(
    tabItems(
      tabItem(tabName = "intro",
        h1("Introduction"),
        fluidRow(
          column(12, wellPanel(
            h4(introText, style = "line-height: 1.5;")
          )))),

      tabItem(tabName = "singleVis",
        h1("Visualization in Single Dimensions"),
        fluidRow(column(12, wellPanel(
          h4(single1, style = "line-height: 1.5;"),
          h4(single2, style = "line-height: 1.5;"),
          h4(single3, style = "line-height: 1.5;"),
          h4(single4, style = "line-height: 1.5;"),
          h4(single5, style = "line-height: 1.5;"),
          h4(single6, style = "line-height: 1.5;"),
          h4(single7, style = "line-height: 1.5;")))),
        fluidRow(
          box(plotOutput("singleSturges")),
          box(plotOutput("singleScott")),
          box(plotOutput("singleFreedman"))
        ),
        fluidRow(column(12, wellPanel(
          h4(single8, style = "line-height: 1.5;"),
          h4(single9, style = "line-height: 1.5;"))))),
      tabItem(tabName = "sub1",
        fluidRow(do.call(multChoice, q1Question), q1Answer)),
      tabItem(tabName = "sub2",
        fluidRow(do.call(multChoice, q2Question), q2Answer)),
      tabItem(tabName = "sub3"),
      tabItem(tabName = "sub4"),
      tabItem(tabName = "sub5"),

      tabItem(tabName = "doubleVis",
        h1("Visualization in Double Dimensions"),
        fluidRow(column(12, wellPanel(
          h4(double1, style = "line-height: 1.5;"),
          h4(double2, style = "line-height: 1.5;"),
          h4(double3, style = "line-height: 1.5;"),
          h4(double4, style = "line-height: 1.5;"),
          h4(double5, style = "line-height: 1.5;"))))),

      tabItem(tabName = "corrVis",
        h1("Correlation Visualization"),
        fluidRow(column(12, wellPanel(
          h4(corr1, style = "line-height: 1.5;"),
          h4(corr2, style = "line-height: 1.5;"),
          h4(corr3, style = "line-height: 1.5;"),
          h4(corr4, style = "line-height: 1.5;"))))),

      tabItem(tabName = "prinComp",
        h1("Principal Component Analysis"),
        fluidRow(column(12, wellPanel(
          h4(prin1, style = "line-height: 1.5;"),
          h4(prin2, style = "line-height: 1.5;"),
          h4(prin3, style = "line-height: 1.5;"),
          h4(prin4, style = "line-height: 1.5;"),
          h4(prin5, style = "line-height: 1.5;")))))
      )
    )
  )

#  fluidRow(fillBlank(2, "get_example <- function(x){\n  z <- x + ___\n  return(z)\n}\n> get_example(2)\nOUTPUT: 3"), q2Answer)),
#  fluidRow(checkBox(3, "Sample Check Box", "Answer 1", "Answer 2", "Answer 3", "Answer 4"), q3Answer)),
#  fluidRow(freeForm(4, 'Provide code that evaluates to 5.'), q4Answer)),
#  fluidRow(do.call(multChoice, binQuestion), binAnswer)),

