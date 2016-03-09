# ===================================================================
# Scatter plot with regression lines and other elements such as
# point of averages, SD line, graph of averages, regression and line
# and correlation coefficient.
# ===================================================================

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
    # standard deviations
    sdx <- sd(dat[,input$xvar])
    sdy <- sd(dat[,input$yvar])
    avgx <- mean(dat[,input$xvar])
    avgy <- mean(dat[,input$yvar])
    
    # Render scatterplot
    plot(dat[,input$xvar], dat[,input$yvar],
         main = 'scatter diagram', type = 'n', axes = FALSE,
         xlab = paste(input$xvar, " height (in)"), 
         ylab = paste(input$yvar, "height (in)"))
    box()
    axis(side = 1)
    axis(side = 2, las = 1)
    points(dat[,input$xvar], dat[,input$yvar],
           pch = 21, col = 'white', bg = '#999999aa',
           lwd = 2, cex = input$cex)
    # Point of Averages
    if (input$point_avgs) {
      points(avgx, avgy, 
             pch = 21, col = 'white', bg = 'tomato',
             lwd = 3, cex = 3)
    }
    # SD line
    if (input$sd_line) {
      cor_xy <- cor(dat[,input$xvar], dat[,input$yvar])
      if (cor_xy >= 0) {
        sd_line <- line_equation(avgx - sdx, avgy - sdy, avgx + sdx, avgy + sdy)
        abline(a = sd_line$intercept, b = sd_line$slope, 
               lwd = 4, lty = 2, col = 'orange')
      } else {
        sd_line <- line_equation(avgx + sdx, avgy - sdy, avgx - sdx, avgy + sdy)
        abline(a = sd_line$intercept, b = sd_line$slope, 
               lwd = 4, lty = 2, col = 'orange')
      }
    }
    # SD guides
    if (input$sd_guides) {
      abline(v = c(avgx - sdx, avgx + sdx), 
             h = c(avgy - sdy, avgy + sdy), 
             lty = 1, lwd = 3, col = '#FFA600aa')
    }
    # Graph of averages
    if (input$breaks > 1) {
      graph_avgs <- averages(dat[,input$xvar], dat[,input$yvar],
                             breaks = input$breaks)
      points(graph_avgs$x, graph_avgs$y, pch = "+",
             col = '#ff6700', cex = 2)
    }    
    # Regression line
    if (input$reg_line) {
      reg <- lm(dat[,input$yvar] ~ dat[,input$xvar])
      abline(reg = reg, lwd = 4, col = '#4878DF')
    }
     
  }, height = 650, width = 650)
})
