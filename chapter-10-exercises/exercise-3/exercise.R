# Exercise 3: working with built-in data sets

# Load R's "USPersonalExpenditure" dataset using the `data()` function
# This will produce a data frame called `USPersonalExpenditure`
data("USPersonalExpenditure")


# The variable `USPersonalExpenditure` is now accessible to you. Unfortunately,
# it's not a data frame (it's actually what is called a matrix)
# Test this using the `is.data.frame()` function
is.data.frame(USPersonalExpenditure)


# Luckily, you can pass the USPersonalExpenditure variable as an argument to the
# `data.frame()` function to convert it a data farm. Do this, storing the
# result in a new variable
data_frame <- data.frame(USPersonalExpenditure)


# What are the column names of your dataframe?
colnames(data_frame)


## Consider: why are they so strange? Think about whether you could use a number 
## like 1940 with dollar notation!


# What are the row names of your dataframe?
rownames(data_frame)


# Add a column "category" to your data frame that contains the rownames
data_frame$category <- rownames(data_frame)


# How much money was spent on personal care in 1940?
data_frame$X1940[data_frame$category=="Personal Care"]


# How much money was spent on Food and Tobacco in 1960?
data_frame$X1960[data_frame$category=="Food and Tobacco"]


# What was the highest expenditure category in 1960?
data_frame$category[data_frame$X1960==max(data_frame$X1960)]


# Define a function `lowest_category` that takes in a year as a parameter, and
# returns the lowest spending category of that year
lowest_category <- function(categories,spendings){
  categories[spendings==min(spendings)]
}
lowest_category(data_frame$category,data_frame$X1950)

testvec <- data_frame$X1950
testvec[4] <- testvec[5]
lowest_category(data_frame$category,testvec)  


# Using your function, determine the lowest spending category of each year
# Hint: use the `sapply()` function to apply your function to a vector of years
 
