#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  titlePanel("Make a Diamond Plot Yo"),
  sidebarLayout(
    sidebarPanel(
  
      
      selectInput("select", label = ("Select box"), 
      choices = list("depth", "table", "carat" ), selected = "carat"),
      

      checkboxGroupInput("Color", label = "Select a Color", 
      choices = list("E", "I", "J", "H", "F", "G", "D"), selected = "E"),
      
      checkboxGroupInput("Cut", label = "Select a Cut", 
      choices = list("Ideal", "Premium", "Good", "Very Good", "Fair"), selected = "Ideal")
      
      
    ),
    
  mainPanel(
    
    plotOutput("plot")
    
  )

  )))
