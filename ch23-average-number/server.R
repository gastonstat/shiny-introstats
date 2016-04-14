# Box with numbers [1, 2, 3, 4, 5, 6, 7], and 25 draws
# Sampling numbers from a box
# Chapter 23: Accuracy of Averages
# Page 409-411

library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  tickets <- reactive({
    tickets <- gsub(' ', '', input$tickets)
    tickets <- unlist(strsplit(tickets, ','))
    as.numeric(tickets)
  })
  
  sum_draws <- reactive({
    set.seed(input$seed)
    samples <- 1:input$reps
    for (i in 1:input$reps) {
      samples[i] <- sum(sample(tickets(), size = input$draws, replace = TRUE))
    }
    samples
  })
  
  # Sum of draws
  output$sum_draws <- renderPrint({ 
    mean(sum_draws())
  })
  
  # Average of draws
  output$avg_draws <- renderPrint({ 
    mean(sum_draws() / input$draws)
  })
  
  # Plot with sum of draws
  output$sumPlot <- renderPlot({
    # Render a barplot
    barplot(table(sum_draws()), 
            space = 0, las = 1,
            xlab = 'Sum',
            ylab = '',
            main = 'Sum of the Draws')
  })
  
  # Plot with average of draws
  output$averagePlot <- renderPlot({
    # Render a barplot
    avg_draws <- round(sum_draws() / input$draws, 1)
    barplot(table(avg_draws), 
            space = 0, las = 1,
            xlab = 'Average',
            ylab = '',
            main = 'Average of the Draws')
  })

  # Plot with confidence intervals
  output$intervalPlot <- renderPlot({
    draws <- 25
    avg_box <- mean(tickets())
    n <- length(tickets())
    sd_box <- sqrt((n-1)/n) * sd(tickets())
    se_sum <- sqrt(input$draws) * sd_box
    se_avg <- se_sum / input$draws
    
    # Render plot
    samples <- sum_draws() / input$draws
    a <- samples - se_avg
    b <- samples + se_avg
    covers <- (a <= avg_box & avg_box <= b)
    ci_cols <- rep('#ff000088', input$reps)
    ci_cols[covers] <- '#0000ff88'
    
    xlim <- c(min(samples) - se_avg, max(samples) + se_avg)
    plot(samples, 1:length(samples), axes = FALSE,
         col = '#444444', pch = 21, cex = 0.5,
         xlim = c(2.5, 5.5), ylab = 'Number of samples',
         xlab = "Confidence Intervals",
         main = "Average of Draws")
    axis(side = 1)
    axis(side = 2, las = 1)
    abline(v = avg_box, col = '#FF0000dd', lwd = 2.5)
    segments(x0 = samples - se_avg,
             x1 = samples + se_avg,
             y0 = 1:length(samples),
             y1 = 1:length(samples),#col = "#555555bb"
             col = ci_cols)
  })
  
})
