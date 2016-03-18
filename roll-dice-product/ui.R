
library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Rolling Dice: Product"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        numericInput("seed", label = "Random Seed:", 12330, 
                     min = 10000, max = 50000, step = 1),
        sliderInput("reps", label = "Number of repetitions:", 
                    min = 100, max = 10000, value = 100, step= 100)
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("chancePlot")  
      )
      
    )
  )
)