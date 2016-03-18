# Rolling Dice: Product of Points

This is a Shiny app that generates empirical histograms when simulating 
rolling a pair of dice and finding the product of points.


## Motivation

The goal is to provide a visual display similar to the empirical histograms
shown in page 313 of "Statistics", chapter 18.

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

The data simulates rolling a pair of dice. The input parameters are the random seed, and 
the number of repetitions (i.e. number of rolls).


## Plot

The produced plot is an empirical histogram.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "roll-dice-product")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/roll-dice-product")
runApp()
```
