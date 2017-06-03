#############################################################
##                                                         ##
##  Data Science Capstone Project                          ##
##                                                         ##            
##  Karl Eiholzer                                          ##
##                                                         ##
##  Github Repo:                                           ##
##  https://github.com/mhnierhoff/CapstoneCoursera         ##
##                                                         ##
##  capstone_shiny.R                                       ##
##  Created: 30 May 2017                                   ##
##  Updated: 30 May 2017                                   ##
##                                                         ##
#############################################################


library(shiny)
library("dplyr")

source("functions.R")

#######################################################      U I       ######################################################################

ui <- fluidPage(
  # Application title
  titlePanel("Coursera Data Science - Capstone Project"),
  
  # User interface controls1
  sidebarLayout(
    sidebarPanel(
      HTML("Enter text here and hit <small><small>[ENTER] <big><big> key or click on the <i>Guess</i> button for a likely next word:"),	
      textInput(inputId="text", label = ""),
      submitButton("Guess")
      ),
    
    mainPanel(
      tabsetPanel(
        
        tabPanel("Guess", 
                 conditionalPanel(condition = "input.text != ''",
                                  htmlOutput("guess"),
                                  verbatimTextOutput("text"),
                                  htmlOutput("cleaned")             ),
              HTML(" <br><br><br> ")
        )
                 )
        )
      ),
  
  fluidRow(HTML("<hr>") ),
  fluidRow(HTML("<div style='margin-left:18px;margin-bottom:12px;margin-top:-12px;color:navy;'><strong>Email me: <a title='Thank You' 
                href='mailto:Karl.Eiholzer@gmail.com'>Karl Eiholzer</a></big></strong>&nbsp;
                or visit my <a title='LinkedIn' target='_blank' href='https://www.linkedin.com/in/karleiholzer/'> LinkedIn page</a>&nbsp;</div>") ),
  fluidRow(HTML("<div style='margin-left:18px;margin-bottom:12px;color:navy;'><strong>Creation date: May 2017</strong></div>") )
  )

#######################################################  S E R V E R   ######################################################################

server <- function(input, output, session) { 
 
  library("dplyr")
  library("stringr")
  source("functions.R")
  
  output$text <- renderText({
    paste("Input text is:", input$text)
  })
  
  observe({
    iniTime <- Sys.time()

    textCleansed <- clean(input$text)  
    if(textCleansed != " ") 
    {
      if( trimws(textCleansed) == tolower(trimws(input$text)) ) {
        textCleansedAssumed <- "I am using your text as-is" 
      } else {
        textCleansedAssumed <- paste0("I assume you meant this: <i>",word_color(textCleansed,"BA4A00"))
      }
        
      output$cleaned <- renderText({
        paste0("Note ",textCleansedAssumed)
      })
      textguessoutput <- predict_model(textCleansed)
      if (textguessoutput == "Sorry - no guesses!!") {
        textCleansedOutput <- "" 
      } else {
        textCleansedOutput <- textCleansed  
        }
      output$guess <- renderText({
        paste0("<br><big>",textCleansedOutput," <strong><big>",word_color(textguessoutput,"196F3D"), "</h1><br><br>")
      }) 
      
      textCleansed <- gsub(" \\* "," ",textCleansed)    # 
      predictWords <- predict_model(textCleansed)
      updateSelectInput(session = session, inputId = "predicts", choices = predictWords)
      
      endTime <- Sys.time()
      output$msg <- renderText({
        paste(msg, "\n", "- Total time processing = ",1000*(endTime-iniTime))
      })
      gc()
    }  
  })
}


shinyApp(ui = ui, server = server)

