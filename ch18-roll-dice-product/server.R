# Product of dots when rolling a pair of dice
# Chapter 18: Normal Approximation for Probability Histograms
# Pages 312-313

library(shiny)

source('helpers.R')

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$chancePlot <- renderPlot({
    set.seed(input$seed)
    total_points <- sapply(rep(2, input$reps), prod_rolls)
    # put in relative terms
    prop_points <- 100 * table(total_points) / input$reps
    ymax <- find_ymax(max(prop_points), 5)
    
    # Frequencies of products
    freq <- numeric(36)
    freq[1:36 %in% names(prop_points)] <- prop_points
    names(freq) <- 1:36
    
    # Render a barplot
    barplot(freq, space = 0, las = 1, border = "gray40",
            cex.names = 0.8, ylim = c(0, ymax),
            main = sprintf("%s Repetitions", input$reps))
  })
})
