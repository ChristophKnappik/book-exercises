# Exercise 7: using dplyr on external data

# Load the `dplyr` library
library(dplyr)

# Use the `read.csv()` function to read in the included data set. Remember to
# save it as a variable.
dat <- read.csv("data/nba_teams_2016.csv")
head(dat)
nrow(dat)

# View the data frame you loaded, and get some basic information about the 
# number of rows/columns. 
# Note the "X" preceding some of the column titles as well as the "*" following
# the names of teams that made it to the playoffs that year.


# Add a column that gives the turnovers to steals ratio (TOV / STL) for each team
dat$turn_steal <- dat$TOV/dat$STL
summary(dat$turn_steal)
  
# Sort the teams from lowest turnover/steal ratio to highest
# Which team has the lowest turnover/steal ratio?
dat <- arrange(dat, desc(turn_steal))
head(dat)


# Using the pipe operator, create a new column of assists per game (AST / G) 
# AND sort the data.frame by this new column in descending order.
dat <- dat %>% 
  mutate(ast_game = AST / G) %>% 
  arrange(desc(ast_game))
head(dat)

# Create a data frame called `good_offense` of teams that scored more than 
# 8700 points (PTS) in the season
good_offense <- filter(dat,PTS>8700)
summary(good_offense)

# Create a data frame called `good_defense` of teams that had more than 
# 470 blocks (BLK)
good_defense <- filter(dat,BLK>470)
summary(good_defense)

# Create a data frame called `offense_stats` that only shows offensive 
# rebounds (ORB), field-goal % (FG.), and assists (AST) along with the team name.
offense_stats <- select(dat,Team,ORB,FG.,AST)
head(offense_stats)

# Create a data frame called `defense_stats` that only shows defensive 
# rebounds (DRB), steals (STL), and blocks (BLK) along with the team name.
defense_stats <- select(dat,Team,DRB,STL,BLK)
head(defense_stats)

# Create a function called `better_shooters` that takes in two teams and returns
# a data frame of the team with the better field-goal percentage. Include the 
# team name, field-goal percentage, and total points in your resulting data frame


# Call the function on two teams to compare them (remember the `*` if needed)

