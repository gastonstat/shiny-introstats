# Scatter diagram of a Football-shaped cloud
# Chapter 8: Correlation
# Page 120-127

library(shiny)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("Football-Shaped Cloud"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        sliderInput("num_obs", label = "Number of Points:", 500, 
                     min = 10, max = 1000, step = 10),
        numericInput("x_avg", label = "Height average:", 170, 
                     min = 1, max = 250, step = 1),
        numericInput("y_avg", label = "Weight average:", 70, 
                     min = 1, max = 200, step = 1),
        numericInput("x_sd", label = "Height standard deviation", 
                    min = 0, max = 100, value = 40, step= 1),
        numericInput("y_sd", label = "Weight standard deviation", 
                    min = 0, max = 100, value = 30, step= 1),
        sliderInput("xy_cor", label = "Correlation", 
                    min = -1, max = 1, value = 0.5, step= 0.05),
        numericInput("seed", label = "Random Seed:", 200598, 
                     step = 1)
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("scatterPlot")  
      )
      
    )
  )
)
