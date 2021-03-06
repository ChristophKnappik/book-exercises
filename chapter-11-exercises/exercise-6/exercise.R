# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

head(flights)
head(airports)

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
avg_arrival_delay <- flights %>% 
  group_by(dest) %>% 
  summarize(arr_delay = mean(arr_delay, na.rm = T))

head(avg_arrival_delay)

avg_arrival_delay_comp <- left_join(avg_arrival_delay, airports, by = c("dest" = "faa"))
head(avg_arrival_delay_comp)

avg_arrival_delay_comp %>% filter(arr_delay==max(arr_delay, na.rm = T)) %>% select(name)


# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

avg_arr_delay_airline <- flights %>% 
  group_by(carrier) %>% 
  summarise(arr_delay = mean(arr_delay, na.rm = T)) %>% 
  left_join(airlines, by = "carrier") %>% 
  filter(arr_delay == min(arr_delay, na.rm = T)) %>% 
  select(name) %>% 
  print()

head(avg_arr_delay_airline)
head(airlines)
  filter(arr_delay == min(arr_delay, na.rm = T)) %>% 
  select(name)

head(avg_arr_delay_airline)