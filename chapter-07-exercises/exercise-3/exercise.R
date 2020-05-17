# Exercise 3: vector practice

# Create a vector `words` of 6 (or more) words.
# You can Google for a "random word generator" if you wish!
words <- c("Elefant", "Ameise", "Kolibri","Aligator","Meise","Hund")


# Create a vector `words_of_the_day` that is your `words` vector with the string
# "is the word of the day!" pasted on to the end.
# BONUS: Surround the word in quotes (e.g., `'data' is the word of the day!`)
# Note that the results are more obviously correct with single quotes.
words_of_the_day <- paste("'",words,"' is the word of the day!",sep="")

# Create a vector `a_f_words` which are the elements in `words` that start with 
# "a" through "f"
# Hint: use a comparison operator to see if the word comes before "f" alphabetically!
# Tip: make sure all the words are lower-case, and only consider the first letter
# of the word!
first_letters <- tolower(substr(words,1,1))
a_f_words <- words[match(first_letters, letters[1:26]) <= match("f", letters[1:26])]


# Create a vector `g_m_words` which are the elements in `words` that start with 
# "g" through "m"
g_m_words <- words[(match(first_letters, letters[1:26]) <= match("m", letters[1:26])) & (match(first_letters, letters[1:26]) >= match("g", letters[1:26]))]


# Define a function `word_bin` that takes in three arguments: a vector of words, 
# and two letters. The function should return a vector of words that go between 
# those letters alphabetically.
word_bin <- function(word_list, first_letter, second_letter){
  word_list_first_letters <- tolower(substr(word_list,1,1))
  word_list[(match(word_list_first_letters, letters[1:26]) >= match(first_letter, letters[1:26])) & 
              (match(word_list_first_letters, letters[1:26]) <= match(second_letter, letters[1:26]))]
}


# Use your `word_bin` function to determine which of your words start with "e" 
# through "q"
word_bin(words,"e","q")
