#

library(shiny)
library(ggplot2)
library(readr)

data2 = read_csv("cleanData.csv")


shinyUI(fluidPage(
  

  titlePanel("Survey Questions"),
  
  sidebarLayout(
    sidebarPanel(
       selectInput("select",
                   label = "Select a Question:",
                   choices = na.omit(unique(data2$quest)))
    ),
    
    
    mainPanel(
       plotOutput("states")
    )
  )
))


