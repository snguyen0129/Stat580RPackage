#' Holds variables pertaining to the questions asked in the app
#'
#' @import shiny
#'
#'

# These are placeholder variables, will be removed when we add in actual questions/answers.
# We will add them in a separate file, probably called 'answers.R'
questions <- c("Question 1", "Question 2", "Question 3", "Question 4")
selection <- c("A) Answer 1" = "A", "B) Answer 2" = "B", "C) Answer 3" = "C", "D) Answer 4" = "D")
checkanswers <- c("A", "B")

# The following are used in the UI to create the questions

# For each sample...
# h2(): Shows question number
# h3(): Optional depending on if we need more text or not. Uncomment if need be.
# Creates the answer selection (radio buttons, checkboxes, text input, text area input)
# Shows the user's selected answer, aka outputMult/Check/Fill/Provide
# br() is a line break
# Submit buttons: submitMult/Check/Fill/Provide
# Provide isn't finished yet, because Provide requires knowing the question to code it.

# This is a multiple choice question using radio buttons. The choices are stored in variable 'selection'.
# The user's selected choice is stored in outputMult.
multChoice <- column(8, wellPanel(
  h2("Question 1"),
  radioButtons("inputMult", h3("Sample Question Multiple Choice"), choices = selection),
  p("You have selected:", style = "color:#888888;"),
  textOutput("outputMult"),
  br(),
  actionButton("submitMult", "Submit", class = "btn btn-primary")
))

# This is a fill-in-the-blank question using a textbox. Note that '\n' is a newline character.
# The user's input is stored in outputFill.
fillBlank <- column(8, wellPanel(
  h2("Question 1"),
  # h3("Sample Question Fill in the Blank"), NOTE: This line is here if we need more space for explanation
  tags$pre("get_example <- function(x){\n  z <- x + ___\n  return(z)\n}\n> get_example(2)\nOUTPUT: 3"),
  textInput("inputFill", label = 'Sample text', width = '80px'), # Fixed width depending on how much space they need
  p("Your input is:", style = "color:#888888;"),
  verbatimTextOutput("outputFill"),
  br(),
  actionButton("submitFill", "Submit", class = "btn btn-primary")
))

# This is a multiple choice question using checkboxes. The choices are stored in variable 'selection'.
# The user's selected choices are stored in outputCheck. Allows multiple answers to be selected.
checkBox <- column(8, wellPanel(
  h2("Question 1"),
  checkboxGroupInput("inputCheck", h3("Sample Question Checkbox"), choices = selection),
  p("You have selected:", style = "color:#888888;"),
  textOutput("outputCheck"),
  br(),
  actionButton("submitCheck", "Submit", class = "btn btn-primary")
))

# This is a free answer text box. However, due to the nature of this type of question, it isn't completed.
# It will take in the answer and run it as code, hoping for a specific output.
freeForm <- column(8, wellPanel(
  h2("Question 1"),
  # h3("Sample Question Provide Code"),
  textAreaInput("inputProvide", label = 'Provide code that ----- produces the following output? For this example, provide code that evaluates to 5.', width = "100%"),
  p("Your input is:", style = "color:#888888;"),
  verbatimTextOutput("outputProvide"),
  br(),
  actionButton("submitProvide", "Submit", class = "btn btn-primary")
))

# Will rename these eventually.
# Displays if they got the question correct.
q1Answer <- column(4, textOutput('resultMult'))
q2Answer <- column(4, textOutput('resultFill'))
q3Answer <- column(4, textOutput('resultCheck'))
q4Answer <- column(4, textOutput('resultProvide'))
