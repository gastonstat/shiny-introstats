# ===================================================================
# Scatter plot with regression lines and other elements such as
# point of averages, SD line, graph of averages, regression and line
# and correlation coefficient.
# ===================================================================


library(shiny)

# reading a couple of lines just to get the names of variables
dat <- read.csv('Galton.csv', nrows = 3)
dat <- dat[ ,c("Father", "Mother", "Child")]

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Heights Data"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("xvar", "X-axis variable", 
                    choices = colnames(dat), selected = 'Father'),
        selectInput("yvar", "Y-axis variable", 
                    choices = colnames(dat), selected = 'Child'),
        sliderInput("cex", 
                    label = "Size of points",
                    min = 0, max = 3, value = 2, step = 0.1),
        checkboxInput('reg_line', label = strong('Regression line')),
        checkboxInput('point_avgs', label = strong('Point of Averages')),
        checkboxInput('sd_line', label = strong('SD line')),
        checkboxInput('sd_guides', label = strong('SD guides')),
        sliderInput("breaks", 
                    label = "Graph of Averages",
                    min = 0, max = 10, value = 0, step = 1),
        hr(),
        helpText('Correlation:'),
        verbatimTextOutput("correlation")
      ),
      
      # Create a spot for the scatterplo
      mainPanel(
        plotOutput("datPlot")  
      )
      
    )
  )
)