#' Shiny app UI
#'
#' Builds the visible content
#'
#' @import shiny
#' @import shinydashboard
#'
#'

ui <- dashboardPage(
  dashboardHeader(title = "STAT580 Visualization and Kernel Density Estimation", titleWidth = 500),
  dashboardSidebar(h3("Navigation", align = "center"), sidebarMenu(
    # Navigation sidebar tabs
    menuItem("Introduction", tabName = "intro"),
    menuItem("Visualization in Single Dimensions", tabName = "singleVis"),
    menuSubItem("Histograms Q1", tabName = "sub1"),
    menuSubItem("Histograms Q2", tabName = "sub2"),
    menuSubItem("Histograms Q3", tabName = "sub3"),
    menuSubItem("Histograms Q4", tabName = "sub4"),
    menuSubItem("Density Q5", tabName = "sub5"),
    menuSubItem("Density Q6", tabName = "sub6"),
    menuSubItem("Density Q7", tabName = "sub7"),
    menuItem("Visualization in Two Dimensions", tabName = "doubleVis"),
    menuSubItem("Hexbin Q8", tabName = "sub8"),
    menuSubItem("Hexbin Q9", tabName = "sub9"),
    menuSubItem("Kde2d Q10", tabName = "sub10"),
    menuSubItem("Kde2d Q11", tabName = "sub11"),
    menuItem("Correlation Visualization", tabName = "corrVis"),
    menuSubItem("Scatterplots Q12", tabName = "sub12"),
    menuSubItem("Scatterplots Q13", tabName = "sub13"),
    menuSubItem("Corrplot Q14", tabName = "sub14"),
    menuSubItem("Corrplot Q15", tabName = "sub15"),
    menuItem("Principal Component Analysis", tabName = "prinComp"),
    menuSubItem("PCA Q16", tabName = "sub16"),
    menuSubItem("PCA Q17", tabName = "sub17"),
    menuSubItem("PCA Q18", tabName = "sub18"),
    menuSubItem("PCA Q19", tabName = "sub19"),
    menuSubItem("PCA Q20", tabName = "sub20"),
    menuSubItem("Scree Plot Q21", tabName = "sub21"),
    menuSubItem("Scree Plot Q22", tabName = "sub22"),
    menuSubItem("Scree Plot Q23", tabName = "sub23"),
    menuSubItem("Scree Plot Q24", tabName = "sub24")
  )),
  dashboardBody(
    tabItems(
      # Introduction page
      # Check textList.R for variables that hold all the text
      tabItem(tabName = "intro",
              h1("Introduction"),
              fluidRow(
                column(12, wellPanel(
                  h4(introText, style = "line-height: 1.5;")
                ))),
              h3("NOTE: Maximize the window for a better experience."),
              h3("Examples may take a few seconds to render your input.")),
      # Visualization in Single Dimensions page
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
              # Example 1: Histogram
              fluidRow(do.call(fillBlank, getHist), answerHist),
              fluidRow(column(12, wellPanel(
                h4(single8, style = "line-height: 1.5;"),
                h4(single9, style = "line-height: 1.5;")))),
              # Example 2: Density
              fluidRow(do.call(fillBlank, getDens), answerDens)),
      # Single Dimension questions (7 total)
      tabItem(tabName = "sub1",
              fluidRow(do.call(multChoice, q1Question), q1Answer)),
      tabItem(tabName = "sub2",
              fluidRow(do.call(multChoice, q2Question), q2Answer)),
      tabItem(tabName = "sub3",
              fluidRow(do.call(multChoice, q3Question), q3Answer)),
      tabItem(tabName = "sub4",
              fluidRow(do.call(multChoice, q4Question), q4Answer)),
      tabItem(tabName = "sub5",
              fluidRow(do.call(multChoice, q5Question), q5Answer)),
      tabItem(tabName = "sub6",
              fluidRow(do.call(multChoice, q6Question), q6Answer)),
      tabItem(tabName = "sub7",
              fluidRow(do.call(multChoice, q7Question), q7Answer)),
      # Visualization in Double Dimensions page
      tabItem(tabName = "doubleVis",
              h1("Visualization in Double Dimensions"),
              fluidRow(column(12, wellPanel(
                h4(double1, style = "line-height: 1.5;"),
                h4(double2, style = "line-height: 1.5;")))),
              # Example 3: Hexbin
              fluidRow(do.call(fillBlank, getHex), answerHex),
              fluidRow(column(12, wellPanel(
                h4(double3, style = "line-height: 1.5;"),
                h4(double4, style = "line-height: 1.5;"),
                h4(double5, style = "line-height: 1.5;")))),
              # Example 4: KDE2D
              fluidRow(do.call(fillBlank, getKde2d), answerKde2d)),
      # Double Dimension questions (4 total)
      tabItem(tabName = "sub8",
              fluidRow(do.call(multChoice, q8Question), q8Answer)),
      tabItem(tabName = "sub9",
              fluidRow(do.call(multChoice, q9Question), q9Answer)),
      tabItem(tabName = "sub10",
              fluidRow(do.call(multChoice, q10Question), q10Answer)),
      tabItem(tabName = "sub11",
              fluidRow(do.call(multChoice, q11Question), q11Answer)),
      # Correlation Visualization page
      tabItem(tabName = "corrVis",
              h1("Correlation Visualization"),
              fluidRow(column(12, wellPanel(
                h4(corr1, style = "line-height: 1.5;"),
                h4(corr2, style = "line-height: 1.5;")))),
              # Example 5: Scatter
              fluidRow(do.call(fillBlank, getScatter), answerScatter),
              fluidRow(column(12, wellPanel(
                  h4(corr3, style = "line-height: 1.5;"),
                  h4(corr4, style = "line-height: 1.5;")))),
              # Example 6: Correlation Plots
              fluidRow(do.call(fillBlank, getCorr), answerCorr)),
      # Correlation Visualization questions (4 total)
      tabItem(tabName = "sub12",
              fluidRow(do.call(multChoice, q12Question), q12Answer)),
      tabItem(tabName = "sub13",
              fluidRow(do.call(multChoice, q13Question), q13Answer)),
      tabItem(tabName = "sub14",
              fluidRow(do.call(multChoice, q14Question), q14Answer)),
      tabItem(tabName = "sub15",
              fluidRow(do.call(multChoice, q15Question), q15Answer)),
      # Principal Component Analysis page
      tabItem(tabName = "prinComp",
              h1("Principal Component Analysis"),
              fluidRow(column(12, wellPanel(
                h4(prin1, style = "line-height: 1.5;"),
                h4(prin2, style = "line-height: 1.5;"),
                h4(prin3, style = "line-height: 1.5;")))),
              # Example 7: PCA
              fluidRow(do.call(fillBlank, getPCA), answerPCA),
              fluidRow(column(12, wellPanel(
                h4(prin4, style = "line-height: 1.5;"),
                h4(prin5, style = "line-height: 1.5;")))),
              # Example 8: Scree Plots
              fluidRow(do.call(fillBlank, getScree), answerScree)),
      # Principal Component Analysis questions (9 questions)
      tabItem(tabName = "sub16",
              fluidRow(do.call(multChoice, q16Question), q16Answer)),
      tabItem(tabName = "sub17",
              fluidRow(do.call(multChoice, q17Question), q17Answer)),
      tabItem(tabName = "sub18",
              fluidRow(do.call(multChoice, q18Question), q18Answer)),
      tabItem(tabName = "sub19",
              fluidRow(do.call(multChoice, q19Question), q19Answer)),
      tabItem(tabName = "sub20",
              fluidRow(do.call(multChoice, q20Question), q20Answer),
              imageOutput("pcatable")),
      tabItem(tabName = "sub21",
              fluidRow(do.call(multChoice, q21Question), q21Answer),
              imageOutput("pcatable2")), # Same image, but couldn't output it unless it was a new var
      tabItem(tabName = "sub22",
              fluidRow(do.call(multChoice, q22Question), q22Answer)),
      tabItem(tabName = "sub23",
              fluidRow(do.call(multChoice, q23Question), q23Answer)),
      tabItem(tabName = "sub24",
              fluidRow(do.call(multChoice, q24Question), q24Answer),
              imageOutput("screeplot"))
    )
  )
)
