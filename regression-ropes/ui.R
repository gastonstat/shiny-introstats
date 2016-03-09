
library(shiny)

ropes <- read.table('ropes.txt', header = TRUE, nrows = 3)
ropes <- ropes[ ,-c(1,2)]

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
                    choices = colnames(ropes), selected = 'Weight'),
        selectInput("yvar", "Y-axis variable", 
                    choices = colnames(ropes), selected = 'Diameter'),
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
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("ropesPlot")  
      )
      
    )
  )
)