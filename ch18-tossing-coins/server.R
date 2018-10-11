# tossing coins

library(shiny)

# check whether 'x' is multiple of 'num'
is_multiple <- function(x, num) {
  x %% num == 0
}

# find the y-max value for ylim in barplot()
find_ymax <- function(x, num) {
  if (is_multiple(x, num)) {
    return(max(prop_points))
  } else {
    return(ymax <- num * ((x %/% num) + 1))
  }
}

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$chancePlot <- renderPlot({
    probs <- 100 * dbinom(0:input$tosses, 
                          size = input$tosses, 
                          prob = input$chance)

    # put in relative terms
    ymax <- find_ymax(max(probs), 2)
    # Render probability histogram as a barplot
    barplot(probs, las = 1, border = "gray40", 
            ylim = c(0, ymax), 
            ylab = "probability of heads (%)",
            xlab = "number of heads",
            space = 0, names.arg = 0:input$tosses,
            main = sprintf("Probability Histogram\n %s Tosses", 
                           input$tosses))
  })
})
