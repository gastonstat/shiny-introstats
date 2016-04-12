# Ch21 - Percent Estimation

This is a Shiny app that illustrates the concept of accuracy of percentages.
In other words, confidence intervals when esitmating a percentage.


## Motivation

The goal is to provide a visual display for the various examples in 
__Statistics, Chapter 21: Accuracy of Percentages__

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). 
Fourth Edition. Norton & Company.


## Data

The data consists of a box model with two types of tickets: 0's and 1's.
The user can specify the nummber of both types of tickets (# of 1's, # of 0's).
The app simulates drawing tickets from the box. 
There are two parameters, one is the number of draws (i.e. sample size), 
and the other is the number samples (i.e. # of repetitions).


## Plots

There are three plots: 

1. The first tab shows a histogram for the sum of draws.
2. The second tab shows a histogram for the percentage of tickets 1's.
3. The third tab shows a chart with the percentage of the box (i.e. population percentage),
and the confidence intervals of the drawn samples.


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "ch21-percentage-estimation")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/ch21-percentage-estimation")
runApp()
```
