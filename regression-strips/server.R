library(shiny)

dat <- read.csv('Galton.csv')
dat <- dat[ ,c("Father", "Mother", "Child")]

source('helpers.R')

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Correlation
  output$correlation <- renderPrint({ 
    cor(dat[,input$xvar], dat[,input$yvar])
  })
  
  # Fill in the spot we created for a plot
  output$datPlot <- renderPlot({

    # Render scatterplot
    plot(dat[,input$xvar], dat[,input$yvar],
         main = 'scatter diagram', type = 'n', axes = FALSE,
         xlab = input$xvar, ylab = input$yvar)
    box()
    axis(side = 1)
    axis(side = 2, las = 1)
    points(dat[,input$xvar], dat[,input$yvar],
           pch = 21, col = 'white', bg = '#999999aa',
           lwd = 2, cex = input$cex)
    # vertical strips
    abline(v = c(input$center - input$width, input$center + input$width),
           lty = 1, lwd = 3, col = '#5A6DE3')
    # Regression line
    if (input$reg_line) {
      reg <- lm(dat[,input$yvar] ~ dat[,input$xvar])
      abline(reg = reg, lwd = 3, col = '#e35a6d')
    }
    
  })
  
  # histogram
  output$histogram <- renderPlot({
    xmin <- input$center - input$width
    xmax <- input$center + input$width
    child <- dat$Child[dat$Father >= xmin & dat$Father <= xmax]
    #child <- dat$Child[input$xvar >= xmin & input$xvar <= xmax]
    # Render scatterplot
    hist(child, main = '', col = '#ACB6F1')
  })
})
