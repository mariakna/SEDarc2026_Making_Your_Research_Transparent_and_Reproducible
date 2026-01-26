## Variable names ##

# create a data frame
x <- c("Rob", "Jane", "Julie")
y <- c("Andrews", "Hill", "Johnstone")
dd <- data.frame(cbind(x,y))

# for-loop that prints the first and last name of each candidate
# listed in the data frame dd created above
for (i in 1:nrow(dd)){
  print(paste0("Candidate ", i, " is ", dd$x[i], " ", dd$y[i]))
}

# change the code above to use meaningful variable names
first_name <- c("Rob", "Jane", "Julie")
last_name <- c("Andrews", "Hill", "Johnstone")
candidates_df <- data.frame(cbind(first_name,last_name))

for (i in 1:nrow(candidates_df)){
  print(paste0("Candidate ", i, " is ", candidates_df$first_name[i], " ", 
               candidates_df$last_name[i]))
}

## Function names ##

# function to count number of letters in a string
count_letters <- function(string, letter) {
  sum(strsplit(string, NULL)[[1]] == letter)
}

# function to check if a column contains NAs
are_missing_values_present <- function(data, column) {
  any(is.na(data[[column]]))
}

## One-liners ##

# create a variable which is the result of many operations,
# all happening in one line of code
result <- mean(sort(log(sqrt(abs(rnorm(100, mean = 5, sd = 2)^2 + 1)))[1:10]))

# break the above down to show what happens step by step
generate_norm_data <- rnorm(100, mean = 5, sd = 2)
square_and_add <- generate_norm_data^2 + 1
take_abs_values <- abs(square_and_add)
take_square_root <- sqrt(take_abs_values)
take_log <- log(take_square_root)
sort_asc <- sort(take_log)
take_first_10 <- sort_asc[1:10]
compute_mean <- mean(take_first_10)

# improved version, with comments:

# generate 100 random Normal numbers
raw_data <- rnorm(100, mean = 5, sd = 2)
# transform data: square, add 1, take absolute, square root, then log
processed_data <- log(sqrt(abs(raw_data^2 + 1)))
# compute mean of the smallest 10 transformed values
result <- mean(sort(processed_data)[1:10])

## Use consistent formatting ##

first_name <- c("Rob", "Jane", "Julie")
LastName<-c("Andrews","Hill","Johnstone")

# demontsrate how to run a linter on a script
# install.packages("lintr) # uncomment if not yet installed
library("lintr")
lint("bad_style.R")

## Error management ##

# write a basic function to count elements in a vector
count_obs_in_vector <- function(vec) {
  n <- length(vec)
  return(n)
}

# imagine that the vector cannot have more than 10 elements,
# and throw an error if a user is applying the function to a vector
# with more elements
count_obs_in_vector <- function(vec) {
  n <- length(vec)
  if (n > 10) {
    stop(paste("Error: vector exceeds the maximum length of", 10, 
               "as it containts", n, "elements."))
  }
  return(n)
}

# use tryCatch() to catch the error
count_obs_in_vector <- function(vec) {
  tryCatch({
    n <- length(vec)
    if (n > 10) {
      stop(paste("Vector exceeds the maximum length of 10 as it contains", 
                 n, "elements."))
    }
    return(n)
  }, error = function(e) {
    message("Caught an error: ", e$message)
    return(NA)
  })
}

vec <- c(1:100)
count_obs_in_vector(vec)

# demonstrate how to create a doctring for the function above
# install.packages(c("devtools", "roxygen2")) # uncomment if not yet installed
devtools::create("ExamplePackage")
# save the below in "ExamplePackage/R/count_obs_in_vector.R"

#############################################################
#' Count observations in a vector with less than 10 elements
#'
#' This function returns the number of elements in `vec`. 
#' It throws an error if the length exceeds 10,
#' returning NA and printing an error message.
#'
#' @param vec A vector whose length will be counted.
#' @return Integer length of `vec` if ≤ 10; otherwise NA.
#' @examples
#' count_obs_in_vector(1:5)   # returns 5
#' count_obs_in_vector(1:15)  # returns NA with error message
#' @export
count_obs_in_vector <- function(vec) {
  tryCatch({
    n <- length(vec)
    if (n > 10) {
      stop(paste("Vector exceeds the maximum length of 10 as it contains", 
                 n, "elements."))
    }
    return(n)
  }, error = function(e) {
    message("Caught an error: ", e$message)
    return(NA)
  })
}
#############################################################

library("devtools")
# create documentation
document()
# install & load package
install.packages("ExamplePackage")
library("ExamplePackage")
# call help
?count_obs_in_vector

## Dependencies ##

# install.packages("renv") # uncomment if not yet installed
# activate
renv::init()
# load contents 
renv::restore()
