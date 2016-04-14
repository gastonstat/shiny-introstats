# Football-Shaped Cloud

This is a Shiny app that generates a scatter diagram with a football-shaped cloud of points.


## Motivation

The goal is to provide a visual display similar to the scatter diagrams 
in chapter 8 of "Statistics".

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

This apps simulates two variables: _Height_ and _Weight_. 
_Height_ corresponds to the X-axis, and 
_Weight_ corresponds to the y-axis.
The user can specify values for the average and standard deviation 
of each variable, as well as their correlation coefficient.

With the input data, the app generates a random multivariate 
joint-distribution, and this data is used to plot the scatter diagram.


## Plot

The produced plot is a scatter-plot with a possibly football-shaped form.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "ch08-football-shape")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/ch08-football-shape")
runApp()
```
