# Plot of Residuals for Climbing Ropes data

This is a Shiny app that generates a scatter diagram to fit a regression line using Climbing Ropes data set, and then show the plot of residuals.


## Motivation

The goal is to provide a visual display of some of the concepts from __Statistics, Chapter 11: The R.M.S. for Regression__:

- Regression line
- Plot of Residuals

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.

## Data

The data set is in the `ropes.txt` file which contains 101 rows and 8 columns, although the app des not uses variables: `Name` and `Brand`


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "ch11-regression-errors")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/ch11-regression-errors")
runApp()
```
