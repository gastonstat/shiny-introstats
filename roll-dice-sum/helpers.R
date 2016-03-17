# helper functions to simulate rolling a die
# and adding the number of sposts

# roll one die
roll_die <- function(times = 1) {
  die <- 1:6
  sample(die, times, replace = TRUE)
}


# roll a pair of dice
roll_pair <- function() {
  roll_die(2)
}

# sum of spots
sum_rolls <- function(times = 1) {
  sum(roll_die(times))
}

# product of numbers
prod_rolls <- function(times = 1) {
  prod(roll_die(times))
}

# check whether 'x' is multiple of 'num'
is_multiple <- function(x, num) {
  x %% num == 0
}

# find the y-max value for ylim in barplot()
find_ymax <- function(x, num) {
  if (is_multiple(x, num)) {
    return(max(prop_points))
  } else {
    return(ymax <- num * ((x %/% num) + 1))
  }
}


# reps <- 100
# total_points <- sapply(rep(2, reps), sum_rolls)
# prop_points <- 100 * table(total_points) / reps
# barplot(prop_points, las = 1, 
#         space = 0, ylim = c(0, 30),
#         main = sprintf("%s Repetitions", reps))
