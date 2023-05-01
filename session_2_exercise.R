x <- runif(100, 1, 100)
mean_x <- round(mean(x), 2)
#Here's a breakdown of the code:
# runif(100, 1, 100) generates 100 random numbers between 1 and 100. 
#The first argument 100 specifies the number of random numbers to generate, and the second and third arguments 1 and 100 specify the range of values for the random numbers. 
#The function returns a vector of 100 random numbers.
# mean(x) calculates the mean of the vector x.
# round(mean(x), 2) rounds the mean of x to two decimal places using the round() function and assigns it to the variable mean_x.
