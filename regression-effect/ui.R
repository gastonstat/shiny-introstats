library(shiny)

# reading two lines just to get the names of variables
dat <- read.csv('nba_players.csv', nrows = 2)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("NBA Points per Game"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("xvar", "X-axis variable", 
                    choices = colnames(dat[,-1]), selected = 'points_2014'),
        selectInput("yvar", "Y-axis variable", 
                    choices = colnames(dat[,-1]), selected = 'points_2015'),
        sliderInput("cex", 
                    label = "Size of points",
                    min = 0, max = 3, value = 2, step = 0.1),
        sliderInput("size", 
                    label = "Size of labels",
                    min = 0, max = 3, value = 0, step = 0.1),
        checkboxInput('reg_line', label = strong('Regression line')),
        hr(),
        helpText('Correlation:'),
        verbatimTextOutput("correlation")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("datPlot")  
      )
      
    )
  )
)
