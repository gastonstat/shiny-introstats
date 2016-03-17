# Rolling Dice

This is a Shiny app that generates empirical histograms when simulating 
rolling a pair of dice and finding the total number of spots.


## Motivation

The goal is to provide a visual display similar to the empirical histograms
shown in page 311 of "Statistics", chapter 18.

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

The data simulates rolling (by default) a pair of dice (but the user can choose between 
one and 10 dices). The input parameters are the number of dice, the random seed, and 
the number of repetitions (i.e. number of rolls).


## Plot

The produced plot is an empirical histogram.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "roll-dice")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/roll-dice")
runApp()
```
