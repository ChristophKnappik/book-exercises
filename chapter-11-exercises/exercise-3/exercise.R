# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
#install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
#install.packages('devtools')
#devtools::install_github("hadley/fueleconomy")
library("fueleconomy")

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)


# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)


# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)



### Bonus

# Write 3 functions, one for each approach.  Then,
# Test how long it takes to perform each one 1000 times

test_data <- vehicles %>% 
  filter(year==2015) %>% 
  filter(make=="Acura")
View(test_data)

solution_temp_vars <- function(vehicle_data=vehicles){
  vehicle_data_2015 <- filter(vehicle_data, year==2015)
  vehicle_data_2015_Acura <- filter(vehicle_data_2015,make=="Acura")
  vehicle_data_2015_Acura_best_hwy <- filter(vehicle_data_2015_Acura,hwy==max(hwy))
  best_model <- select(vehicle_data_2015_Acura_best_hwy,model)
}

solution_nested <- function(vehicle_data=vehicles){
  best_model <- select(filter(vehicle_data, year == 2015 & make == "Acura" & hwy == max(select(filter(vehicle_data,year==2015 & make=="Acura"),hwy))),model)
}

solution_piping <- function(vehicle_data=vehicles){
  best_model <- vehicle_data %>% 
    filter(year == 2015) %>% 
    filter(make == "Acura") %>% 
    filter(hwy == max(hwy)) %>% 
    select(model)
}

solution_temp_vars()
solution_nested()
solution_piping()

stopwatch <- function(fun1, fun2, fun3){
  starttime <- Sys.time()
  for(i in 1:1000) fun1
  endtime <- Sys.time()
  print(paste("Zeit für temp. Variablen:",round(endtime-starttime,3),sep=""))
  
  starttime <- Sys.time()
  for(i in 1:1000) fun2
  endtime <- Sys.time()
  print(paste("Zeit für nested functions:",round(endtime-starttime,3),sep=""))
  
  starttime <- Sys.time()
  for(i in 1:1000) fun3
  endtime <- Sys.time()
  print(paste("Zeit für piping:",round(endtime-starttime,3),sep=""))
}

stopwatch(solution_temp_vars(),solution_nested(),solution_piping())

