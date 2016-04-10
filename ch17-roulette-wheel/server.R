# Plays on a Roulette Wheel
# Box with numbers [18 1's, 20  0's], and 100 draws
# Sampling numbers from a box
# Chapter 17: Expected Value and Standard Error
# Page 295-296

library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  wins <- reactive({
    set.seed(input$seed)
    draws <- input$draws
    wins <- rbinom(n = draws, 1, prob = 18 / 38)
    wins[wins == 0] <- -1
    wins
  })
    
  # Proportion of heads
  output$gain <- renderPrint({ 
    sum(wins())
  })
  
  # Fill in the spot we created for a plot
  output$chancePlot <- renderPlot({
    # Render a barplot
    plot(1:input$draws, cumsum(wins()), 
         col = '#627fe2', type = 'l', lwd = 3,
         xlab = 'Number of draws',
         ylab = 'Gain or Loss',
         axes = FALSE, main = 'Roulette Gain')
    abline(h = 0, col = '#888888aa', lwd = 3)
    axis(side = 1)
    axis(side = 2, las = 1)
  })
})
