# Tossing Coins

This is a Shiny app that generates a probability histogram when tossing
a specified number of coins.


## Motivation

The goal is to provide a visual display similar to the probability histograms
in chapter 18 of "Statistics".

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

The data computes the probabilities when tossing a specified number of coins. 
The input parameters are the number of tosses, and the chance of heads.


## Plot

The produced plot is a probability histogram.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "tossing-coins")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/tossing-coins")
runApp()
```
