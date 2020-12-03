#' Question List
#'
#' Holds variables for use in building questions
#'
#' @import shiny
#'
#'

q1Question <- list(1, "Which of the following methods for computing optimal bin widths involves both minimizing the Mean-Squared Error formula and doubling the Interquartile Range?", "Sturge's Rule", "Scott’s Normal Reference Rule", "Freedman-Diaconis Rule", "Rizzo's Rule")
q1Answer <- column(4, textOutput('resultMult1'))

q2Question <- list(2, "Which of the following is the default for the “break” argument of the hist() function in R?", "Sturges", "Scott", "Freedman-Diaconis", "None of the above.")
q2Answer <- column(4, textOutput('resultMult2'))

q3Question <- list(3, "According to Rizzo, a narrow bin width may _____ the data, presenting too much detail, while wider bin widths may _____ the data, obscuring important features.", "Oversmooth, undersmooth", "Undersmooth, oversmooth", "Oversmooth, oversmooth", "Undersmooth, undersmooth")
q3Answer <- column(4, textOutput('resultMult3'))

q4Question <- list(4, "_____ tends to oversmooth the data.", "Scott’s rule", "Sturges rule", "Freedman-Diaconis", "All of the above.")
q4Answer <- column(4, textOutput('resultMult4'))

q5Question <- list(5, "Which of the methods allows us to calculate the probability for intervals using the density() function in R?", "Doing a histogram.", "Doing a Frequency Polygon Density Estimation", "Doing an average shifted histogram", "Doing a Kernel Density Estimation")
q5Answer <- column(4, textOutput('resultMult5'))

q6Question <- list(6, "Which of the following is the default kernel used by the R function density()?", "Rectangular", "Triangular", "Gaussian", "Epanechnikov")
q6Answer <- column(4, textOutput('resultMult6'))

q7Question <- list(7, "In R, what is the smoothing parameter of the density() function?", "x", "adjust", "bw", "Kernel")
q7Answer <- column(4, textOutput('resultMult7'))

q8Question <- list(8, "What are the benefits to making the hexbin histogram?", "You can see how strong or weak each of the variables in certain areas of the count.", "It provides many information between how variables in the data should be interpreted.", "The code for doing the hexbin is easy to use.", "All of the above.")
q8Answer <- column(4, textOutput('resultMult8'))

q9Question <- list(9, "When looking at a hexbin graph, what does it mean when there is a darker region in parts of the graph?", "The darker regions of the graph usually mean that there is a negative correlation between two of the variables.", "The darker regions of the graph usually mean that there is a strong correlation between two variables.", "The darker regions of the graph usually mean that there is a weak correlation between two variables.", "The darker regions of the graph usually mean that there is a positive correlation between two of the variables.")
q9Answer <- column(4, textOutput('resultMult9'))

q10Question <- list(10, "When trying to make a kernel density estimated graph, if you wanted to use the function: kde2D(), which package would you draw from?", "MASS", "Lattice", "Rgl", "Hexbin")
q10Answer <- column(4, textOutput('resultMult10'))

q11Question <- list(11, "When trying to analyze the kernel density estimated graph, what is important that goes into analyzing it?", "The Correct Bandwidth", "The Observation of the Data", "The Visual and it’s Scale", "All of the Above")
q11Answer <- column(4, textOutput('resultMult11'))

q12Question <- list(12, "What are the limitations to 2D Scatterplots?", "We cannot display a matrix to compare for a certain amount of variables in an array.", "We cannot provide multiple features of a 2D scatter plot for analysis, such as color, labels, etc.", "For Datasets with multiple variables, you can’t tell data points are either compacted or sparse for certain types of graphs.", "The only choices that exist for 2D scatterplots are the Contour plots and 2D histogram.")
q12Answer <- column(4, textOutput('resultMult12'))

q13Question <- list(13, "A scatterplot matrix will produce visualizations which explain what?", "Correlation between only two variables maximum", "Correlation between each variable and the dataset as a whole", "Correlation between all variables", "None of the above.")
q13Answer <- column(4, textOutput('resultMult13'))

q14Question <- list(14, "When looking at a correlation matrix, the _____ circles correspond to _____ correlation while the _____ circles correspond to _____ correlation.", "Large, low, small, high.", "Small, low, large, high.", "Large, high, small, low.", "Small, high, large, low.")
q14Answer <- column(4, textOutput('resultMult14'))

q15Question <- list(15, "Strong negative correlations mean there is almost no correlation.", "True", "False")
q15Answer <- column(4, textOutput('resultMult15'))

q16Question <- list(16, "Standardizing variables using the scale() function in R before proceeding with PCA is rarely required.", "True", "False")
q16Answer <- column(4, textOutput('resultMult16'))

q17Question <- list(17, "Principal Component Analysis (PCA) is a dimension  ____ method.", "Reduction", "Maximization", "Minimization", "None of the above.")
q17Answer <- column(4, textOutput('resultMult17'))

q18Question <- list(18, "Which of the following functions do we NOT use for the Principal Component Analysis?", "prcomp()", "princomp()", "eigen()", "pca()")
q18Answer <- column(4, textOutput('resultMult18'))

q19Question <- list(19, "PC1 is the one-dimensional representation of the data that captures the ____ amount of variability.", "Least", "Largest", "Median", "None of the above.")
q19Answer <- column(4, textOutput('resultMult19'))

q20Question <- list(20, "After computing PCA  of your data, you get this table. What does the first column of numbers represent?", "PC1", "PC2", "PC3", "PC4")
q20Answer <- column(4, textOutput('resultMult20'))

q21Question <- list(21, "Using the table above, which variable(s) most strongly correlate with PC2?", "Median_age", "Population", "Children_proportion", "Both a and c")
q21Answer <- column(4, textOutput('resultMult21'))

q22Question <- list(22, "A scree plot shows how many __ account for a certain amount of variability.", "Variables", "PC’s", "Datapoints", "All of the above.")
q22Answer <- column(4, textOutput('resultMult22'))

q23Question <- list(23, "What are the x and y axes when doing a scree plot?", "The x-axis and y-axis are the variables within the dataset.", "The x-axis is the numeric value of the PC and y-axis is the proportion of variance explained in the scree plot.", "The x-axis is the representation of the PC and y-axis is the simple height of the scree plot.", "The x-axis is the length of the variable and y-axis is the expected value of the scree plot.")
q23Answer <- column(4, textOutput('resultMult23'))

q24Question <- list(24, "Using the scree plot below, how many PC’s are necessary to capture at least 90% of the variability?", "4", "8", "6", "3")
q24Answer <- column(4, textOutput('resultMult24'))

checkanswers <- c("A", "B") # This is the answers for the sample checkbox question

#q2Answer <- column(4, textOutput('resultFill2'))
#q3Answer <- column(4, textOutput('resultCheck3'))
#q4Answer <- column(4, textOutput('resultProvide4'))
