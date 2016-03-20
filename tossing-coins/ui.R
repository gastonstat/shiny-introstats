
library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Tossing Coins"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        numericInput("tosses", label = "Number of tosses:", 2, 
                     min = 1, max = 100, step = 1),
        sliderInput("chance", label = "Chance of heads", 
                    min = 0, max = 1, value = 0.5, step= 0.1)
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("chancePlot")  
      )
      
    )
  )
)
