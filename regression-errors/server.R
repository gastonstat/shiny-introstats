library(shiny)

dat <- read.table('ropes.txt', header = TRUE)
dat <- dat[ ,-c(1,2)]

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Correlation
  output$correlation <- renderPrint({ 
    cor(dat[,input$xvar], dat[,input$yvar])
  })
  
  # r.m.s. error
  output$rms_error <- renderPrint({
    reg <- lm(dat[,input$yvar] ~ dat[,input$xvar])
    sqrt(mean((reg$residuals)^2))
  })
  
  # Fill in the spot we created for a plot
  output$datPlot <- renderPlot({
    
    # Render a scatter diagram
    plot(dat[,input$xvar], dat[,input$yvar],
         main = 'scatter diagram', type = 'n', axes = FALSE,
         xlab = input$xvar, ylab = input$yvar)
    box()
    axis(side = 1)
    axis(side = 2, las = 1)
    points(dat[,input$xvar], dat[,input$yvar],
           pch = 21, col = 'white', bg = '#4878DFaa',
           lwd = 2, cex = 2)
    # regression line
    reg <- lm(dat[,input$yvar] ~ dat[,input$xvar])
    abline(reg = reg, lwd = 3, col = '#e35a6d')
    
  })
  
  # histogram
  output$residualPlot <- renderPlot({
    reg <- lm(dat[,input$yvar] ~ dat[,input$xvar])
    # Render scatterplot
    plot(dat[,input$xvar], reg$residuals, las = 1,
         main = 'Residual plot', xlab = input$xvar,
         ylab = 'residuals', col = '#ACB6F1', type = 'n')
    abline(h = 0, col = 'gray70', lw = 2)
    points(dat[,input$xvar], reg$residuals,
           pch = 20, col = '#888888aa', cex = 2)
  })
})
