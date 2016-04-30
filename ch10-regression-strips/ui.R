# Regression Strips
# Regression line and vertical strips
# Chapter 10: Regression
# Page 158-178

library(shiny)

dat <- read.csv('Galton.csv', nrows = 3)
dat <- dat[ ,c("Father", "Mother", "Child")]

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Galton's Data"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("xvar", "X-axis variable", 
                    choices = colnames(dat), selected = 'Father'),
        selectInput("yvar", "Y-axis variable", 
                    choices = colnames(dat), selected = 'Child'),
        checkboxInput('reg_line', label = strong('Regression line')),
        sliderInput("cex", 
                    label = "Size of points",
                    min = 0, max = 3, value = 2, step = 0.1),
        #checkboxInput('point_avgs', label = strong('Point of Averages')),
        #checkboxInput('sd_line', label = strong('SD line')),
        #checkboxInput('sd_guides', label = strong('SD guides')),
        sliderInput("center", 
                    label = "x location",
                    min = 62, 
                    max = 78.5, 
                    value = 70, step = 0.5),
        sliderInput("width", 
                    label = "width",
                    min = 0, 
                    max = 4, 
                    value = 0, step = 0.25),
        hr(),
        helpText('Correlation:'),
        verbatimTextOutput("correlation")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("datPlot"),
        plotOutput("histogram")
      )
      
    )
  )
)