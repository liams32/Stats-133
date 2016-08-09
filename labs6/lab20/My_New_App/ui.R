#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI (fluidPage(
  
  titlePanel("Occupancy Rates in Berkeley"), 
  
  sidebarLayout(
    sidebarPanel(
      helpText("Upload an XML file with the Census Data to get started"),
  
  fluidRow(
    
   fileInput("file", label = h3("File input")),
    
    
    selectInput("select", label = h3("Choose the neighborhood to inspect"), 
                          choices = list("North Berkeley" = 1, "Rockridge" = 2,
                                         "Downtown Berkeley" = 3, "Berkeley Hills" = 4), selected = 1),
    
    
     sliderInput("slider1", label = h3("Number of People in Household:"), 
                          min = 0, max = 40, value = c(0,40)
           
           
           
    ))),
    
    mainPanel()
    
    
  )))


