# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
glimpse(flights)
glimpse(airports)

dep_delay_by_month <- flights %>% 
  group_by(month) %>% 
  select(month, dep_delay) %>% 
  summarize(mean(dep_delay, na.rm = T)) %>% 
  rename(dep_delay = "mean(dep_delay, na.rm = T)")
dep_delay_by_month


# Which month had the greatest average departure delay?
month_max_avg_dep_delay <- dep_delay_by_month %>% 
  filter(dep_delay == max(dep_delay)) %>% 
  select(month) %>% 
  print()
  


# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)


# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
head(flights)
dest_max_arr_delay <- flights %>% 
  group_by(dest) %T>% print() %>% 
  summarise(mean_arr_delay = mean(arr_delay, na.rm = T)) %T>% print() %>% 
  filter(mean_arr_delay == max(mean_arr_delay, na.rm = T)) %T>% print() %>% 
  select(dest)

print(dest_max_arr_delay)


# You can look up these airports in the `airports` data frame!
left_join(dest_max_arr_delay,airports,by = c("dest" = "faa"))
head(airports)

# Which city was flown to with the highest average speed?
dest_max_avg_speed <- flights %>% 
  mutate(speed = distance / air_time) %>% 
  group_by(dest) %>% 
  summarize(avg_speed = mean(speed, na.rm = T)) %>% 
  filter(avg_speed == max(avg_speed, na.rm = T)) %>% 
  select(dest)

print(dest_max_avg_speed)
left_join(dest_max_avg_speed,airports,by = c("dest" = "faa"))
  

