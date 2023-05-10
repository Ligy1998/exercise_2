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



income_s <- sort(income) #This sorts the income vector in ascending order (升序) and assigns the sorted vector to income_s.
group <- c("Lower 1%", "Lower 50%", "Top 10%", "Top 1%") #This creates a vector called group with four categories for income groups: Lower 1%, Lower 50%, Top 10%, and Top 1%.3
p <- c(.1, .5, .9, .99) #This creates a vector called p with four percentile values: 10%, 50%, 90%, and 99%.

boundary <- round(income_s[p*n], 0) 
#This calculates the income threshold for each group by taking the percentile values 
#from p and multiplying by the number of observations (n) in the income vector. 
#The resulting values are used as indices to select the corresponding income values from the sorted income_s vector. 
#The round() function is used to round the threshold values to the nearest integer.

low10_m <- mean( income_s[c(1:(.1*n))] ) 
#This calculates the mean income for the Lower 1% group by selecting the first 10% of the sorted income_s vector and computing their mean.
low50_m <- mean( income_s[c(1:(.5*n))] )
top10_m <- mean( income_s[c((.9*n):n)] )
top1_m <- mean( income_s[c((.99*n):n)] )

means <-  round( c(low10_m, low50_m, top10_m, top1_m) , 0)

income_summary <- data.frame(group, boundary, means)
#This creates a data frame called income_summary with three columns: group, boundary, and means. 
#The group column contains the four income group labels, the boundary column contains the income thresholds for each group, 
#and the means column contains the rounded mean incomes for each group.
income_summary

library(dplyr)
library(ggplot2)
library(plotly)
library(echarts4r)

ggplot(data=mtcars) +
  geom_point(aes(x = disp,
                 y = mpg)) +
  geom_smooth(aes(x = disp,
                  y = mpg))

#################################################################################################
#Exercise 3: Working with data frames

#1.Create a data frame with 5 variables and 5 rows.
#2.Computes the arithmetic mean of each variable in the data set and store all 5 means in one vector.
#3.Bonus: If you copied and pasted the code for each variable, try to come up with a solution, 
#that omits copy and pasting and does the entire operation in one line. 
#Make sure that the output shows only the computed names and not also the respective variable names.

#################################################################################################
# R 3.2.1 Generative simulation
sim_rides <- function(N, p){
  sample(c("L","0"), size=N, replace=TRUE, prob=c(p, 1-p))
}
sim_rides(10, .5)
obs <- sim_rides(1000, .5)
sum(obs == "L")/length(obs)

# R 3.2.2 Statistical model (estimator)
compute_post <- function(obs, poss){
  L <- sum(obs=="L") #obs: observation; poss: possibility
  O <- sum(obs=="O")
  ways <- sapply(poss, function(q) (q*4)^L * ((1-q)*4)^O)
  # an anonymous function defined using function(q)) to each element of the poss vector, and returns a vector of the results.
  #The anonymous function calculates the ways for that value of q using the formula (q*4)^L * ((1-q)*4)^O, and returns the result. 
  #The sapply function then assembles all of the results into a vector, which is assigned to the variable ways.
  
  post <-ways/sum(ways)
  data.frame(poss, ways, post=round(post,3))
}
data <- c("L", "O", "L")
compute_post(obs = data, poss=seq(0,1,0.25))

# R 3.2.3 Integrate prior knowledge
data <- c("L", "O", "L")
prior <- compute_post(obs = data, poss=seq(0,1,0.25))
new <- compute_post(obs = "O", poss=seq(0,1,0.25))
prior$ways * new$ways #extracts the ways column from the prior data frame.
round((prior$post * new$post)/sum(prior$post * new$post), 2) #relative




