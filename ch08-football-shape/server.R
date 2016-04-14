# Scatter diagram of a Football-shaped cloud
# Chapter 8: Correlation
# Page 120-127

library(shiny)
library(MASS)

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
  output$scatterPlot <- renderPlot({

    x_var <- input$x_sd^2
    y_var <- input$y_sd^2
    
    # how to compute covariance based on correlation?
    xy_cov <- input$x_sd * input$y_sd * input$xy_cor
    
    n <- input$num_obs
    mu <- c(input$x_avg, input$y_avg)
    Sigma <- matrix(c(x_var, xy_cov, xy_cov, y_var), 2)
    set.seed(input$seed)
    cloud = mvrnorm(n, mu, Sigma)
    
    plot(cloud[,1], cloud[,2],
         axes = FALSE, xlab = 'height (cms)', ylab = 'weight (kgs)',
         type = 'n')
    axis(side = 1)
    axis(side = 2, las = 1)
    points(cloud[,1], cloud[,2], pch = 21, cex=0.75, col = "white",
           bg = "#555555AA", lwd = 1)
  })
})
