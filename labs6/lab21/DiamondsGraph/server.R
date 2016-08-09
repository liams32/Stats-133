#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$plot = renderPlot({ 
  
    select_color = input$Color
    select_cut = input$Cut 
  
  diamonds %>% 
    filter(cut %in% input$Cut, color %in% input$Color) %>% 
  
  
  ggplot() + 
    geom_point(aes_string(x = input$select, y = "price"))
  
  })
})
