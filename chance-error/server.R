library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {

  seed <- reactive({
    input$seed
  })
  tosses <- reactive({
    input$tosses
  })
  
  # Proportion of heads
  output$num_heads <- renderPrint({ 
    #set.seed(input$seed)
    #tosses <- input$tosses
    set.seed(seed())
    flips <- rbinom(n = tosses(), 1, prob = 0.5)
    sum(flips)
  })

    # Proportion of heads
  output$prop_heads <- renderPrint({ 
    #set.seed(input$seed)
    #tosses <- input$tosses
    set.seed(seed())
    flips <- rbinom(n = tosses(), 1, prob = 0.5)
    round(100 * sum(flips) / tosses(), 2)
  })
  
  # Fill in the spot we created for a plot
  output$chancePlot <- renderPlot({
    set.seed(input$seed)
    tosses <- input$tosses
    flips <- rbinom(n = tosses, 1, prob = 0.5)
    num_heads <- cumsum(flips)
    prop_heads <- (num_heads / 1:tosses)
    num_tosses <- seq(1, tosses, by = 100)
    if (tosses <= 200) {
      num_tosses <- seq(2, tosses, by = 2)
    } else if (tosses < 1000) {
      num_tosses <- seq(2, tosses, by = 10)
    } else if (tosses < 5000) {
      num_tosses <- seq(2, tosses, by = 50)
    }
    # Render a barplot
    difference <- num_heads[num_tosses] - (num_tosses / 2)
    proportion <- prop_heads[num_tosses]
    if (input$error == 1) {
      plot(num_tosses, difference, 
           col = '#627fe2', type = 'l', lwd = 3,
           xlab = "Number of tosses",
           ylab = '# of heads - 1/2 # of tosses',
           axes = FALSE, main = 'Chance Error')
      abline(h = 0, col = '#888888aa', lwd = 3)
    } else {
      plot(num_tosses, proportion, ylim = c(0, 1),
           col = '#627fe2', type = 'l', lwd = 3,
           xlab = 'Number of tosses',
           ylab = 'Proportion of heads',
           axes = FALSE, main = 'Percent Error')
      abline(h = 0.5, col = '#888888aa', lwd = 3)
    }
    axis(side = 1)
    axis(side = 2, las = 1)
  })
})