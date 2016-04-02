# Sampling Men example
# Chapter 20: Chance Errors in Sampling
# Page 355-359

library(shiny)

tickets <- rep(c(1, 0), c(3091, 3581))

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  num_men <- reactive({
    set.seed(input$seed)
    size <- input$size
    samples <- 1:input$reps
    for (i in 1:input$reps) {
      samples[i] <- sum(sample(tickets, size = size))
    }
    samples
  })

  # Number of men
  output$num_avg <- renderPrint({ 
    round(mean(num_men()), 2)
  })
  
  # Percentage of men
  output$perc_avg <- renderPrint({ 
    round(100 * mean(num_men() / input$size), 2)
  })
  
  # Plot with number of men in samples
  output$numberPlot <- renderPlot({
    # Render a barplot
    barplot(table(num_men()), 
            space = 0, las = 1,
            xlab = 'Number of men',
            ylab = '',
            main = 'Sample Men')
  })

  # Plot with percentage of men in samples
  output$percentPlot <- renderPlot({
    # Render a barplot
    percentage_men <- round(100 * num_men() / input$size)
    barplot(table(percentage_men) / length(num_men()), 
            space = 0, las = 1,
            xlab = 'Percentage of men',
            ylab = 'Proportion',
            main = 'Sample Men')
  })
})
