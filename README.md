# Shiny Apps for STAT 2, 20, 21, 131A

This is a collcetion of Shiny apps for introductory statistics courses based on the classic textbook __Statistics__ by David Freedman, Robert Pisani, and Roger Purves (2007). Fourth Edition. Norton & Company.

I originally developed these apps for the course [Stat 2](http://gastonsanchez.com/stat2), and refined them for [Stat 20 / Stat 131A](https://github.com/ucb-introstat/introstat-spring-2017), at UC Berkeley. The main motivation behind the apps is to have teaching materials (in the form of interactive graphics) that I can use for living demos during lecture.

The apps are not specifically intended for Stat 2, 20 or 131A. They can be used for any of the introductory Statistics courses at UC Berkeley: STAT 2, STAT 20, STAT 21, STAT W21, STAT 131A, etc. And pretty much in any statistics introductory course in general.


## Running the apps

The required software is __[R](https://www.r-project.org/)__ and __[RStudio](https://www.rstudio.com/)__ (preferably a recent version).

Both R and RStudio are free, and are available for Mac OS X, Windows, and Linux. 	

- R for Mac: [https://cran.cnr.berkeley.edu/bin/macosx/](https://cran.cnr.berkeley.edu/bin/macosx/)
- R for Windows: [https://cran.cnr.berkeley.edu/bin/windows/](https://cran.cnr.berkeley.edu/bin/windows/)
- RStudio Desktop version [https://www.rstudio.com/products/rstudio/download/](https://www.rstudio.com/products/rstudio/download/)


Assuming that you have both R and RStudio, the other thing you need is the R package "shiny". In case of doubt, run:

```R
install.packages("shiny")
```

The easiest way to run an app is with the `runGitHub()` function from the `"shiny"` package. For instance, to run the app contained in the [regression-galton](/regression-galton) folder, run the following code in R:

```R
library(shiny)

# Run an app from a subdirectory in the repo
runGitHub("shiny-introstats", "gastonstat", subdir = "regression-galton")
```

Another way to run the apps is by [cloning](http://stackoverflow.com/questions/651038/how-do-you-clone-a-git-repository-into-a-specific-folder) the git repository, then use `runApp()`:

```R
# First clone the repository with git. If you have cloned it into
# ~/regression-galton, first go to that directory, then use runApp().
setwd("~/regression-galton")
runApp()
```

-----

### License

This work is licensed under a <a rel="license" href="https://opensource.org/licenses/BSD-2-Clause">FreeBSD License</a>.

Author: [Gaston Sanchez](https://www.gastonsanchez.com)
