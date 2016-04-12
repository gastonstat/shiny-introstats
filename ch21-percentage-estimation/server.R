# Box with numbers [1, 2, 3, 4, 5, 6, 7], and 25 draws
# Sampling numbers from a box
# Chapter 23: Accuracy of Averages
# Page 409-411

library(shiny)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  tickets <- reactive({
    tickets <- c(rep(1, input$tickets1), rep(0, input$tickets0))
  })
  
  sum_draws <- reactive({
    set.seed(input$seed)
    samples <- 1:input$reps
    for (i in 1:input$reps) {
      samples[i] <- sum(sample(tickets(), size = input$draws, replace = TRUE))
    }
    samples
  })
  
  # Sum of box (# of ticket 1's)
  output$avg_box <- renderPrint({ 
    sum(tickets())
  })
  
  # SD of box
  output$sd_box <- renderPrint({
    total <- input$tickets1 + input$tickets0
    sqrt((input$tickets1 / total) * (input$tickets0 / total))
  })
  
  # Plot with sum of draws
  output$sumPlot <- renderPlot({
    # Render a barplot
    barplot(table(sum_draws()), 
            space = 0, las = 1,
            xlab = 'Sum',
            ylab = '',
            main = sprintf('Sum of Box for %s Draws', input$draws))
  })
  
  # Plot with percentage of draws
  output$percentPlot <- renderPlot({
    # Render a barplot
    avg_draws <- round(sum_draws() / input$draws, 1)
    barplot(table(avg_draws), 
            space = 0, las = 1,
            xlab = 'Percentage',
            ylab = '',
            main = "Percentage of 1's")
  })
  
  # Plot with confidence intervals
  output$intervalPlot <- renderPlot({
    avg_box <- mean(tickets())
    n <- length(tickets())
    sd_box <- sqrt((n-1)/n) * sd(tickets())
    se_sum <- sqrt(input$draws) * sd_box
    se_perc <- se_sum / input$draws
    
    # Render plot
    samples <- sum_draws() / input$draws
    
    a <- samples - se_perc
    b <- samples + se_perc
    covers <- (a <= avg_box & avg_box <= b)
    ci_cols <- rep('#ff000088', input$reps)
    ci_cols[covers] <- '#0000ff88'
    
    xlim <- c(min(samples) - se_perc, max(samples) + se_perc)
    plot(samples, 1:length(samples), axes = FALSE,
         col = '#444444', pch = 21, cex = 0.5,
         xlim = c(0, 1), ylab = 'Number of samples',
         xlab = "Confidence Intervals",
         main = "Percentage of 1's")
    axis(side = 1, at = seq(0, 1, 0.1))
    axis(side = 2, las = 1)
    abline(v = avg_box, col = '#0000FFdd', lwd = 2.5)
    segments(x0 = samples - se_perc,
             x1 = samples + se_perc,
             y0 = 1:length(samples),
             y1 = 1:length(samples),#col = "#555555bb"
             col = ci_cols)
  })
  
})
