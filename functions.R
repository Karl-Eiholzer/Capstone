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
library("data.table")

# read data files to configure the app
index_table <- as.data.table(readRDS("./data/index_table.rds"))
DT1 <- as.data.table(readRDS("./data/DT1.rds"))
DT2 <- as.data.table(readRDS("./data/DT2.rds"))
DT3 <- as.data.table(readRDS("./data/DT3.rds"))
DT4 <- as.data.table(readRDS("./data/DT4.rds"))
DT5 <- as.data.table(readRDS("./data/DT5.rds"))
DT6 <- as.data.table(readRDS("./data/DT6.rds"))

predict_words <- function ( clean_text ) {
  text_clean <- clean_text
  return(text_clean)
}


predict_model <- function ( in_text ) {
  out_text <- find_in_grams(in_text, 3)     #  set to always show last 3 words
  return(out_text)
}

set_df_sub <- function( last_words, n) { 
    # determine which data table to look in and bring back the predictions
  search_letter <- substring(capture_last_words(last_words, n),1,1)
  search_phrase <- capture_last_words(last_words, n)
  search_table <- as.character(index_table[letter==search_letter,2][[1]])
  
  if( is.null(search_table) || is.na(search_table) || length(search_table) == 0 )
  {
    dfsub <- DT1[1,]
  } else {
    if ( search_table == "DT1") {
      dfsub <- subset(DT1, grepl(search_phrase, DT1[,index_col])) 
    } else if ( search_table == "DT2") {
      dfsub <- subset(DT2, grepl(search_phrase, DT2[,index_col])) 
    } else if ( search_table == "DT3") {
      dfsub <- subset(DT3, grepl(search_phrase, DT3[,index_col])) 
    } else if ( search_table == "DT4") {
      dfsub <- subset(DT4, grepl(search_phrase, DT4[,index_col])) 
    } else if ( search_table == "DT5") {
      dfsub <- subset(DT5, grepl(search_phrase, DT5[,index_col])) 
    } else  {
      dfsub <- subset(DT6, grepl(search_phrase, DT6[,index_col])) 
    } 
  }
  return(dfsub)
}


find_in_grams <- function ( last_words, n ) { 
  
  # choose the prediction word to return - should be enhanced in future to use frequency better
  dfsub <- set_df_sub(last_words, n)
  
  if( is.null(dfsub) || is.na(dfsub) || nrow(dfsub) == 0 )  {
    text_guess <- "Sorry - no guesses!!"
    return(text_guess)
  } else {
    text_guess <- dfsub$predicted[1]
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
