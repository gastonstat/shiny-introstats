# Chance error when tossing a coin (based on John Kerrich's)
# Chapter 16: The Law of Averages
# Pages 275-278

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
        numericInput("seed", label = "Random Seed:", 12345, 
                     min = 10000, max = 50000, step = 1),
        sliderInput("tosses", label = "Number of tosses:", 
                    min = 100, max = 10000, value = 100, step= 100),
        radioButtons("error", label = "Display",
                     choices = list("Chance error" = 1, 
                                    "Percent error" = 2), 
                     selected = 1),
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