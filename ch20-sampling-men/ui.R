# Sampling Men
# Chapter 20: Chance Errors in Sampling
# Page 355-359

library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Sampling Men"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        numericInput("seed", label = "Random Seed:", 12345, 
                     min = 10000, max = 50000, step = 1),
        numericInput("size", label = "Sample Size:", value = 100,
                     min = 10, max = 1500, step = 1),
        sliderInput("reps", label = "Number of samples:", 
                    min = 50, max = 2000, value = 100, step = 50),
        hr(),
        helpText('Number average'),
        verbatimTextOutput("num_avg"),
        helpText('Percent average'),
        verbatimTextOutput("perc_avg")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Number", plotOutput("numberPlot")),
                    tabPanel("Percentage", plotOutput("percentPlot"))
                    )
      )
    )
  )
)
