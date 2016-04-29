# Residual Plot
# Regression line and residual plot using 'Ropes' data
# Chapter 11: The R.M.S. Error for Regression
# Page 187-190

library(shiny)

dat <- read.table('ropes.txt', header = TRUE, nrows = 3)
dat <- dat[ ,-c(1,2)]

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Climbing Ropes"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("xvar", "X-axis variable", 
                    choices = colnames(dat), selected = 'Weight'),
        selectInput("yvar", "Y-axis variable", 
                    choices = colnames(dat), selected = 'Diameter'),
        hr(),
        helpText('Correlation:'),
        verbatimTextOutput("correlation"),
        helpText('r.m.s. error:'),
        verbatimTextOutput("rms_error")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("datPlot"),
        plotOutput("residualPlot")
      )
      
    )
  )
)
