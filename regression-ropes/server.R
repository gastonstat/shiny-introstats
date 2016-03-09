library(shiny)

ropes <- read.table('ropes.txt', header = TRUE)
ropes <- ropes[ ,-c(1,2)]

source('helpers.R')

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Correlation
  output$correlation <- renderPrint({ 
    cor(ropes[,input$xvar], ropes[,input$yvar])
  })
  
  # Fill in the spot we created for a plot
  output$ropesPlot <- renderPlot({
    # standard deviations
    sdx <- sd(ropes[,input$xvar])
    sdy <- sd(ropes[,input$yvar])
    avgx <- mean(ropes[,input$xvar])
    avgy <- mean(ropes[,input$yvar])
    
    # Render scatterplot
    plot(ropes[,input$xvar], ropes[,input$yvar],
         main = 'scatter diagram', type = 'n', axes = FALSE,
         xlab = input$xvar, ylab = input$yvar)
    box()
    axis(side = 1)
    axis(side = 2, las = 1)
    points(ropes[,input$xvar], ropes[,input$yvar],
           pch = 21, col = 'white', bg = '#999999aa',
           lwd = 2, cex = input$cex)
    # Point of Averages
    if (input$point_avgs) {
      points(avgx, avgy, 
             pch = 21, col = 'white', bg = 'tomato',
             lwd = 2, cex = 3)
    }
    # SD line
    if (input$sd_line) {
      cor_xy <- cor(ropes[,input$xvar], ropes[,input$yvar])
      if (cor_xy >= 0) {
        sd_line <- line_equation(avgx - sdx, avgy - sdy, avgx + sdx, avgy + sdy)
        abline(a = sd_line$intercept, b = sd_line$slope, 
               lwd = 3, lty = 2, col = 'orange')
      } else {
        sd_line <- line_equation(avgx + sdx, avgy - sdy, avgx - sdx, avgy + sdy)
        abline(a = sd_line$intercept, b = sd_line$slope, 
               lwd = 3, lty = 2, col = 'orange')
      }
    }
    # SD guides
    if (input$sd_guides) {
      abline(v = c(avgx - sdx, avgx + sdx), 
             h = c(avgy - sdy, avgy + sdy), 
             lty = 2, col = 'orange')
    }
    # Graph of averages
    if (input$breaks > 1) {
      graph_avgs <- averages(ropes[,input$xvar], ropes[,input$yvar],
                             breaks = input$breaks)
      points(graph_avgs$x, graph_avgs$y, pch = "+",
             col = 'orange', cex = 2)
    }    
    # Regression line
    if (input$reg_line) {
      reg <- lm(ropes[,input$yvar] ~ ropes[,input$xvar])
      abline(reg = reg, lwd = 3, col = '#4878DF')
    }
     
  })
})
