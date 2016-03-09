# Regression Scatterplot for Galton's Height data

This is a Shiny app that generates a scatter diagram to illustrate the regression method using Galton's heights data set.


## Motivation

The goal is to provide a visual display of some of the concepts from __Statistics, Chapter 10: Regression__ (pages 158-165):

- Point of averages
- SD line
- Graph of averages
- Regression line
- Correlation coefficient

Reference: "Statistics" by David Freedman, Robert Pisani and Roger Purves (2007). Fourth Edition. Norton & Company.


## Data

This app uses the Galton's Height Data as described in [Galton's Height Data](http://www.math.uah.edu/stat/data/Galton.html). The data is in the `Galton.csv` file which contains 898 rows and 6 columns: 

- `Family`: The family that the child belongs to, labeled by the numbers from 1 to 204 and 136A
- `Father`: The father's height, in inches
- `Mother`: The mother's height, in inches
- `Gender`: The gender of the child, male (M) or female (F)
- `Height`: The height of the child, in inches
- `Kids`: The number of kids in the family of the child

The app only uses variables: `Father, Mother, Child`

Original source: [http://www.math.uah.edu/stat/data/Galton.csv](http://www.math.uah.edu/stat/data/Galton.csv)


## How to run it?

There are many ways to download the app and run it:

```R
library(shiny)

# Easiest way is to use runGitHub
runGitHub("shiny-introstats", "gastonstat", subdir = "regression-galton")
```

Or you can [clone](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/shiny-introstats, first go to that directory, then use runApp().
setwd("~/shiny-introstats/regression-galton")
runApp()
```
