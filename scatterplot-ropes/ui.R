
library(shiny)

ropes <- read.table('dynamicropes.txt', header = TRUE, nrows = 3)
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