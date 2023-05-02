x <- runif(100, 1, 100)
mean_x <- round(mean(x), 2)
#Here's a breakdown of the code:
# runif(100, 1, 100) generates 100 random numbers between 1 and 100. 
#The first argument 100 specifies the number of random numbers to generate, and the second and third arguments 1 and 100 specify the range of values for the random numbers. 
#The function returns a vector of 100 random numbers.
# mean(x) calculates the mean of the vector x.
# round(mean(x), 2) rounds the mean of x to two decimal places using the round() function and assigns it to the variable mean_x.

x <- 1:1000
x <- seq(from = 1, to = 1000, by = 1)
# Generate a vector x that entails all integers between 1 and 1000.

y <- rep(1000, length(x)) - x
# Generate a vector y such that the output of x + y returns a vector that only contains 1000s.

total_money <- sum(x) + sum(y)
# Assume x and y contain the amounts in dollars that 2000 different people possess. How much money do all people possess together?

#The following code draws 10,000 random values from a beta distribution with the shape parameters a = 4 and b = 4 and multiplies them by a scale parameter scale = 15,000.
n <- 1e4
scale <- 1.5e4
income <- round( rbeta(n=n, shape1=2, shape2=12) * scale, 2)

# Let’s assume these simulated values represent the gross income in US$ of 10,000 people. 
# The following lines of code plot a histogram, which displays the counts of people that obtain an income in the respective range.
library(ggplot2) # only load (run) once

# Plot the resulting curve
ggplot(data.frame(x = income), aes(x=x)) + #The aes() function is used to map the "x" variable to the x-axis of the plot.
  geom_histogram(color = "#0065BD", fill = "#0065BD", alpha=0.5, bins = 100) +
  scale_x_continuous(breaks = seq(0, scale, 1e3)) + #This sets the breaks (i.e., tick marks) on the x-axis to go from 0 to some maximum value specified by the variable scale, in increments of 1000.
  labs(x = "Gross income", 
       y = "Counts") + 
  theme_minimal() #This applies a minimal theme to the plot, which removes the background gridlines and axes tick marks.

# Compute the total income of all people
total_income <- sum(income)
income_share <- 100*(income / total_income)



income_s <- sort(income)
group <- c("Lower 1%", "Lower 50%", "Top 10%", "Top 1%")
p <- c(.1, .5, .9, .99)

boundary <- round(income_s[p*n], 0)

low10_m <- mean( income_s[c(1:(.1*n))] )
low50_m <- mean( income_s[c(1:(.5*n))] )
top10_m <- mean( income_s[c((.9*n):n)] )
top1_m <- mean( income_s[c((.99*n):n)] )

means <-  round( c(low10_m, low50_m, top10_m, top1_m) , 0)

income_summary <- data.frame(group, boundary, means)
income_summary

##       group boundary means
## 1  Lower 1%      618   398
## 2 Lower 50%     1865  1073
## 3   Top 10%     4014  4979
## 4    Top 1%     6125  6737






