# Exercise 1: creating data frames

# Create a vector of the number of points the Seahawks scored in the first 4 games
# of the season (google "Seahawks" for the scores!)
seahawks_points <- c(17,23,21,28)


# Create a vector of the number of points the Seahwaks have allowed to be scored
# against them in each of the first 4 games of the season
seahawks_points_against <- c(9,28,20,26)


# Combine your two vectors into a dataframe called `games`
games <- data.frame(seahawks_points,seahawks_points_against)


# Create a new column "diff" that is the difference in points between the teams
# Hint: recall the syntax for assigning new elements (which in this case will be
# a vector) to a list!
games$diff <- games$seahawks_points-games$seahawks_points_against


# Create a new column "won" which is TRUE if the Seahawks won the game
games$won <- games$seahawks_points > games$seahawks_points_against


# Create a vector of the opponent names corresponding to the games played
opp_names <- c("Philadelphia", "Green Bay", "Cincinatti", "Pittsburg")


# Assign your dataframe rownames of their opponents
row.names(games) <- opp_names


# View your data frame to see how it has changed!
print(games)
