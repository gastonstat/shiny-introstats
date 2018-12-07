# Title: Histograms with NBA Players Data
# Description: this app uses data of NBA players to show various histograms
# Author: Gaston Sanchez

library(shiny)

# data set
nba <- read.csv('../../data/nba_players.csv', header = TRUE)

# quantitative variables
quantitative <- c(
  "height","weight","salary","experience","age","games",
  "minutes","points3","points2","points")

# select just quantitative variables
dat <- nba[ ,quantitative]


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("NBA Players"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("variable", "Select a Variable", 
                    choices = colnames(dat), selected = 'height'),
        
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 10),
         
         checkboxInput('density', label = strong('Use density scale'))
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("histogram")
      )
   )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$histogram <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- na.omit(dat[ ,input$variable])
      bins <- seq(min(x), max(x), length.out = input$bins + 1)

      histogram <- hist(x, breaks = bins, 
           probability = input$density,
           col = 'gray80', border = 'white', las = 1, 
           axes = FALSE, xlab = "",
           main = paste("Histogram of", input$variable))
      axis(side = 2, las = 1)
      axis(side = 1, at = bins, labels = round(bins, 2))
      
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

