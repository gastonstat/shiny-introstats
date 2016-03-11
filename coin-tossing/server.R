library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  # Proportion of heads
  output$num_heads <- renderPrint({ 
    set.seed(input$seed)
    tosses <- input$tosses
    flips <- rbinom(n = tosses, 1, prob = 0.5)
    sum(flips)
  })

    # Proportion of heads
  output$prop_heads <- renderPrint({ 
    set.seed(input$seed)
    tosses <- input$tosses
    flips <- rbinom(n = tosses, 1, prob = 0.5)
    round(100 * sum(flips) / input$tosses, 2)
  })
  
  # Fill in the spot we created for a plot
  output$chancePlot <- renderPlot({
    set.seed(input$seed)
    tosses <- input$tosses
    flips <- rbinom(n = tosses, 1, prob = 0.5)
    num_heads <- cumsum(flips)
    num_tosses <- seq(1, tosses, by = 100)
    # Render a barplot
    difference <- num_heads[num_tosses] - (num_tosses / 2)
    plot(num_tosses, difference, type = 'l', lwd = 2,
         xlab = "Number of tosses",
         ylab = '# heads - half # of tosses',
         axes = FALSE)
    axis(side = 1)
    axis(side = 2, las = 1)
    abline(h = 0, col = 'gray50')
  })
})