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
