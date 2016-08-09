#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
UI = shinyUI(fluidPage(
  
  # Application title
  titlePanel("Life Expectancy and Income"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       sliderInput("years",
                   "Year",
                   min = 1800,
                   max = 2015,
                   value = 1800,
                   step = 1, animate = animationOptions(interval = 250, loop = TRUE))
    ),
    
    
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("Life")
    )
  )
))
