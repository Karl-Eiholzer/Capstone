#############################################################
##                                                         ##
##  Data Science Capstone Project                          ##
##                                                         ##            
##  Karl Eiholzer                                          ##
##                                                         ##
##  Github Repo:                                           ##
##  https://github.com/mhnierhoff/CapstoneCoursera         ##
##                                                         ##
##  functions.R                                            ##
##  Created: 30 May 2017                                   ##
##  Updated: 30 May 2017                                   ##
##                                                         ##
#############################################################


library(shiny)
library("dplyr")

# read data files to configure the app
df4 <- readRDS("./data/fourgrams.rds")


predict_words <- function ( clean_text ) {
  text_clean <- clean_text
  return(text_clean)
}


predict_model <- function ( in_text ) {
  out_text <- find_in_grams(in_text, 3)     #  set to always show last 3 words
  return(out_text)
}


find_in_grams <- function ( last_words, n ) {
  dfsub <- subset(df4, grepl(capture_last_words(last_words, n), df4$Word))
  if ( nrow(dfsub) == 0 ) {
    text_guess <- "Sorry - no guesses!!"
  } else {
    text_guess <- capture_last_words(dfsub[1,1], 1)
  }
  if ( text_guess == capture_last_words(last_words, 1) ) {
    text_guess <- "Sorry - no guesses!!"
  } 
  return(text_guess)
}


clean <- function(dirty_text) {
  cleantxt <- str_replace_all(dirty_text, "[[:punct:]]", " ")  # remove punctuation
  cleantxt <- str_replace_all(  cleantxt, "\\d"        , " ")  # remove numbers
  cleantxt <- str_replace_all(  cleantxt, "([@|#|$|%|^|&|*|(|)]|<|>)" , " ")  # remove other crap characters
  cleantxt <- str_replace_all(  cleantxt, "\\s{2,}"    , " ")  # remove extra space characters
  cleantxt <- tolower(cleantxt)
  return(cleantxt)
}


capture_last_words <- function ( input_string, n ) {
  x <- as.data.frame(strsplit(input_string, " "))
  colnames(x) <- c("words")
  len <- nrow(x)
  if(len<n) n<-len 
  lst <- paste(x[ (len-(n-1)) : len ,], collapse=" ")
  return(lst)
}

word_color <- function(precolored_text, color_code) {
  colored_word_html <- paste0("<span style=\"color: #", color_code,"\">", precolored_text, "</span>")
  return(colored_word_html)
}
