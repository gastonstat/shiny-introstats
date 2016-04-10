# Ch17 - Roulette Wheel

This is a Shiny app that illustrates the concept of expected value simulating 
a roulette.


## Motivation

The goal is to provide a visual display for the example of section 3 in
__Statistics, Chapter 17: Expected Value and Standard Error__

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). 
Fourth Edition. Norton & Company.


## Data

The data consists of a box model with 18 tikets 1, and 20 tickets 0.
The app simulates drawing 100 tickets from the box. 
There is one parameter which is the number of draws (i.e. sample size), 


## Plot

The displayed plot shows the total gain of the specified number of draws.
The gain could be positive (more wins than losses) or negative (more losses than wins)


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "ch17-roulette-wheel")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/ch17-roulette-wheel")
runApp()
```
