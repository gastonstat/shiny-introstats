library(shiny)

ropes <- read.table('dynamicropes.txt', header = TRUE)
ropes <- ropes[ ,-c(1,2)]

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Correlation
  output$correlation <- renderPrint({ 
    cor(ropes[,input$xvar], ropes[,input$yvar])
  })
    
  
  # Fill in the spot we created for a plot
  output$ropesPlot <- renderPlot({
    
    # Render a barplot
    plot(ropes[,input$xvar], ropes[,input$yvar],
         main = 'scatter diagram', type = 'n', axes = FALSE,
         xlab = input$xvar, ylab = input$yvar)
    box()
    axis(side = 1)
    axis(side = 2, las = 1)
    points(ropes[,input$xvar], ropes[,input$yvar],
           pch = 21, col = 'white', bg = '#4878DFaa',
           lwd = 2, cex = 2)
  })
})