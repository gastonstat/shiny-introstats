# Box with two types of tickets [# 1's, # 0's]
# Drawing tickets from the box
# Chapter 21: Accuracy of Percentages

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
        fluidRow(
          column(5, 
                 numericInput("tickets1", "# Tickets 1", 5,
                              min = 1, max = 100, step = 1)),
          column(5,
                 numericInput("tickets0", "# Tickets 0", 5,
                              min = 1, max = 200, step = 1))
        ),
        helpText('Sum of Box'),
        verbatimTextOutput("avg_box"),
        helpText('SD of Box'),
        verbatimTextOutput("sd_box"),
        hr(),
        numericInput("draws", label = "Number of Draws:", value = 25,
                     min = 5, max = 200, step = 1),
        sliderInput("reps", label = "Number of samples:", 
                    min = 10, max = 1000, value = 50, step = 10),
        numericInput("seed", label = "Random Seed:", 12345, 
                     min = 10000, max = 50000, step = 1)
      ),
      
      # Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Sum", plotOutput("sumPlot")),
                    tabPanel("Percentage", plotOutput("percentPlot")),
                    tabPanel("Estimates", plotOutput("intervalPlot"))
        )
      )
    )
  )
)
