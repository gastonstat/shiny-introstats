library(shiny)

source('helpers.R')

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Fill in the spot we created for a plot
  output$chancePlot <- renderPlot({
    set.seed(input$seed)
    #
    if (input$choice == 1){
      total_points <- sapply(rep(input$dice, input$reps), sum_rolls)
    } else {
      total_points <- sapply(rep(input$dice, input$reps), prod_rolls)
    }
    # put in relative terms
    prop_points <- 100 * table(total_points) / input$reps
    ymax <- find_ymax(max(prop_points), 5)
    # Render a barplot
    barplot(prop_points, las = 1, border = "gray40",
            space = 0, ylim = c(0, ymax),
            main = sprintf("%s Repetitions", input$reps))
  })
})
