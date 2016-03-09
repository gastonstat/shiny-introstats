library(shiny)

dat <- read.csv('nba_players.csv')

source('helpers.R')

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Correlation
  output$correlation <- renderPrint({ 
    cor(dat[,input$xvar], dat[,input$yvar])
  })
  
  # Fill in the spot we created for a plot
  output$datPlot <- renderPlot({
    # standard deviations
    sdx <- sd(dat[,input$xvar])
    sdy <- sd(dat[,input$yvar])
    avgx <- mean(dat[,input$xvar])
    avgy <- mean(dat[,input$yvar])
    
    # Render scatterplot
    plot(dat[,input$xvar], dat[,input$yvar],
         main = 'Points per Game of Point Guard Players', 
         type = 'n', axes = FALSE,
         xlab = input$xvar, ylab = input$yvar)
    box()
    axis(side = 1)
    axis(side = 2, las = 1)
    points(dat[,input$xvar], dat[,input$yvar],
           pch = 21, col = 'white', bg = '#999999aa',
           lwd = 2, cex = input$cex)
    # Size of labels
    if (input$size) {
      text(dat[,input$xvar], dat[,input$yvar], xpd = TRUE,
           labels = dat$player, cex = input$size)
    }
    # Regression line
    if (input$reg_line) {
      reg <- lm(dat[,input$yvar] ~ dat[,input$xvar])
      abline(reg = reg, lwd = 3, col = '#4878DF')
    }
    
  }, height = 650, width = 650)
})
