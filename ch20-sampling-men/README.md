# Sampling Men

This is a Shiny app that illustrates the concept of chance errors in sampling.


## Motivation

The goal is to provide a visual display for the Introduction example in 
__Statistics, Chapter 20: Chance Errors in Sampling__

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

The data consists of a box model with 6672 tickets: 3091 __1's__, and 3581 __0's__. 
The 1's tickets represent men, while the 0's represent women.
The app simulates taking samples from the box. There are two parameters, one is the sample size, and the other is the number samples (i.e. # of repetitions).


## Plots

There are two plots: 

1. The first tab shows a histogram with the number of men in the samples.
2. The second tab shows a histogram with the percentage of men in the samples.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "ch20-sampling-men")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/ch20-sampling-men")
runApp()
```
