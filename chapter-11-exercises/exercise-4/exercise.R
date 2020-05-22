# Exercise 4: practicing with dplyr

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
library(nycflights13)
library(dplyr)

# The data frame `flights` should now be accessible to you.
# Use functions to inspect it: how many rows and columns does it have?
# What are the names of the columns?
# Use `??flights` to search for documentation on the data set (for what the 
# columns represent)
nrow(flights)
ncol(flights)
colnames(flights)


# Use `dplyr` to give the data frame a new column that is the amount of time
# gained or lost while flying (that is: how much of the delay arriving occured
# during flight, as opposed to before departing).
flights <- mutate(flights, delay_during_flight = arr_delay - dep_delay)
summary(flights$delay_during_flight)


# Use `dplyr` to sort your data frame in descending order by the column you just
# created. Remember to save this as a variable (or in the same one!)
flights_sorted <- arrange(flights,desc(delay_during_flight))
View(flights_sorted)


# For practice, repeat the last 2 steps in a single statement using the pipe
# operator. You can clear your environmental variables to "reset" the data frame



# Make a histogram of the amount of time gained using the `hist()` function
hist(flights_sorted$delay_during_flight, breaks=150)


# On average, did flights gain or lose time?
# Note: use the `na.rm = TRUE` argument to remove NA values from your aggregation
mean(flights_sorted$delay_during_flight, na.rm=T)


# Create a data.frame of flights headed to SeaTac ('SEA'), only including the
# origin, destination, and the "gain_in_air" column you just created
flights_SEA <- flights %>% 
  filter(dest == "SEA") %>% 
  select(origin,dest,delay_during_flight)

View(flights_SEA)


# On average, did flights to SeaTac gain or loose time?
summarize(flights_SEA, mean(delay_during_flight, na.rm=T))


# Consider flights from JFK to SEA. What was the average, min, and max air time
# of those flights? Bonus: use pipes to answer this question in one statement
# (without showing any other data)!
summary_JFK_to_SEA <- flights %>% 
  filter(origin=="JFK") %>% 
  filter(dest=="SEA") %>% 
  summarize(mean(air_time, na.rm=T), min(air_time, na.rm=T), max(air_time, na.rm=T)) %>% 
  print()

  

