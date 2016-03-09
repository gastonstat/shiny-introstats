# Regression Scatterplot for Climbing Ropes data

This is a Shiny app that generates a scatter diagram to illustrate the regression method using Climbing Ropes data set.


## Motivation

The goal is to provide a visual display of some of the concepts from __Statistics, Chapter 10: Regression__ (pages 158-165):

- Point of averages
- SD line
- Graph of averages
- Regression line
- Correlation coefficient

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.

## Data

The data set is in the `ropes.txt` file which contains 101 rows and 8 columns, although the app des not uses variables: `Name` and `Brand`


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "regression-ropes")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/regression-ropes")
runApp()
```
