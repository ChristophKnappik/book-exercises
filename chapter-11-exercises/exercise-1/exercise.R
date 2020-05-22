# Exercise 1: working with data frames (review)

# Install devtools package: allows installations from GitHub
install.packages("devtools")

# Install "fueleconomy" dataset from GitHub
devtools::install_github("hadley/fueleconomy")

# Use the `libary()` function to load the "fueleconomy" package
library(fueleconomy)

# You should now have access to the `vehicles` data frame
# You can use `View()` to inspect it
View(vehicles)


# Select the different manufacturers (makes) of the cars in this data set. 
# Save this vector in a variable
makes_overview <- levels(as.factor(vehicles$make))


# Use the `unique()` function to determine how many different car manufacturers
# are represented by the data set
length(unique(vehicles$make))


# Filter the data set for vehicles manufactured in 1997
vehicles_1997 <- vehicles[vehicles$year==1997,]


# Arrange the 1997 cars by highway (`hwy`) gas milage
# Hint: use the `order()` function to get a vector of indices in order by value
# See also:
# https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
vehicles_1997_by_hwy <- vehicles_1997[order(vehicles_1997$hwy),]
View(vehicles_1997_by_hwy)

# Mutate the 1997 cars data frame to add a column `average` that has the average
# gas milage (between city and highway mpg) for each car
vehicles_1997$avg_gas_mileage <- (vehicles_1997$hwy+vehicles_1997$cty)/2


# Filter the whole vehicles data set for 2-Wheel Drive vehicles that get more
# than 20 miles/gallon in the city. 
# Save this new data frame in a variable.
levels(as.factor(vehicles$drive))
vehicles_2wheel_20_mpg_city <- vehicles[vehicles$drive=="2-Wheel Drive" & vehicles$cty>20,]
View(vehicles_2wheel_20_mpg_city)
Summary(vehicles_2wheel_20_mpg_city)
is.data.frame(vehicles_2wheel_20_mpg_city)

# Of the above vehicles, what is the vehicle ID of the vehicle with the worst 
# hwy mpg?
# Hint: filter for the worst vehicle, then select its ID.
vehicles_2wheel_20_mpg_city$id[vehicles_2wheel_20_mpg_city$hwy==min(vehicles_2wheel_20_mpg_city$hwy)]

# Write a function that takes a `year_choice` and a `make_choice` as parameters, 
# and returns the vehicle model that gets the most hwy miles/gallon of vehicles 
# of that make in that year.
# You'll need to filter more (and do some selecting)!
best_hwy_make <- function(year_choice, make_choice){
  vehicles$model[vehicles$year==year_choice & vehicles$make==make_choice & vehicles$hwy==max(vehicles$hwy[vehicles$year==year_choice & vehicles$make==make_choice])]
}

# What was the most efficient Honda model of 1995?
best_hwy_make(1995,"Honda")
test_df <- vehicles[vehicles$year==1995 & vehicles$make=="Honda",]

