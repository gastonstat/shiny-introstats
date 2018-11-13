# Box with numbers [1, 2, 3, 4, 5, 6, 7], and 25 draws
# Sampling numbers from a box
# Chapter 23: Accuracy of Averages
# Page 409-411

library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Average Number"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        textInput("tickets", label = "Numbers in box:", 
                  value = '1, 2, 3, 4, 5, 6, 7'),
        numericInput("draws", label = "Number of Draws:", value = 25,
                     min = 5, max = 200, step = 1),
        sliderInput("reps", label = "Number of samples:", 
                    min = 10, max = 5000, value = 50, step = 5),
        sliderInput("ses", label = "Number of SEs:", 
                    min = 0, max = 4, value = 1, step = 0.05),
        numericInput("seed", label = "Random Seed:", 12345, 
                     min = 10000, max = 50000, step = 1),
        hr(),
        helpText('Sum of Draws'),
        verbatimTextOutput("sum_draws"),
        helpText('Average of Draws'),
        verbatimTextOutput("avg_draws")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Sum", plotOutput("sumPlot")),
                    tabPanel("Average", plotOutput("averagePlot")),
                    tabPanel("Estimates", plotOutput("intervalPlot"))
        )
      )
    )
  )
)
