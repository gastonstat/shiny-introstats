# Plays on a Roulette Wheel
# Box with numbers [18 1's, 20  0's], and 100 draws
# Sampling numbers from a box
# Chapter 17: Expected Value and Standard Error
# Page 295-296

library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Roulette Wheel"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        numericInput("seed", label = "Random Seed:", 12345, 
                     min = 10000, max = 50000, step = 1),
        sliderInput("draws", label = "Number of draws:", 
                    min = 1, max = 1000, value = 100, step= 1),
        hr(),
        helpText('Total Gain:'),
        verbatimTextOutput("gain")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("chancePlot")  
      )
      
    )
  )
)