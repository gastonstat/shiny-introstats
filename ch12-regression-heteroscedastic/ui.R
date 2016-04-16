# Scatter diagram for several variables
# Data: Dynamic Ropes
# Chapter 12: Regression Line
# Page 120-127

library(shiny)

dat <- read.table('ropes.txt', header = TRUE)
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
