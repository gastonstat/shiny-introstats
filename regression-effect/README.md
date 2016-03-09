# Regression Effect

This is a Shiny app that generates a scatter diagram to fit a regression line while illustrating the concept of the so-called "regression effect".


## Motivation

The goal is to provide a visual display of some of the concepts from __Statistics, Chapters 10-11: Regression__:

- Regression line
- Correlation coefficient
- Regression effect

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

The data set is in the `nba_players.csv` file which contains 39 NBA Point Guard for seasons 2014 and 2015. The variables are `points_2014` points per game in 2014, and `points_2015` points per game in 2015.

As you can tell from the diagram, some players score more points in 2015 compared to 2014, others scored less points in 2015 than in 2014, and some scored about the same amount of points.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "regression-effect")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/regression-effect")
runApp()
```
