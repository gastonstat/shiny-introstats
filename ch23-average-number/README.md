# Ch23 - Sample from Box

This is a Shiny app that illustrates the concept of accuracy of averages.


## Motivation

The goal is to provide a visual display for the Introduction example in 
__Statistics, Chapter 23: Accuracy of Averages__

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). 
Fourth Edition. Norton & Company.


## Data

The data consists of a box model with default tickets: 1, 2, 3, 4, 5, 6, 7.
However, the numbers in the box can be changed by the user.
The app simulates taking random samples from the box. 
There are two parameters, one is the number of draws (i.e. sample size), 
and the other is the number samples (i.e. # of repetitions).


## Plots

There are three plots: 

1. The first tab shows a histogram for the sum of draws.
2. The second tab shows a histogram for the average of draws.
3. The third tab shows a chart with the average of the box (i.e. population avg),
and the confidence intervals of the drawn samples (i.e. sample averages)


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "ch23-average-number")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/ch23-average-number")
runApp()
```
