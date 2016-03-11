
library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Coin Tossing Experiment"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        numericInput("seed", "Random Seed:", 12345, 
                     min = 10000, max = 50000, step = 1),
        sliderInput("tosses", "Number of tosses:", 
                    min = 100, max = 10000, value = 1000, step= 100),
        hr(),
        helpText('Total number of heads:'),
        verbatimTextOutput("num_heads"),
        helpText('Proportion of heads:'),
        verbatimTextOutput("prop_heads")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("chancePlot")  
      )
      
    )
  )
)