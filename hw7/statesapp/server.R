
#
library(shiny)
library(ggplot2)
library(readr)
library(ggmap)
library(tidyr)
library(dplyr)
library(mapdata)
library(stringr)

data2 = read_csv("cleanData.csv")

shinyServer(function(input, output) {
   
  output$states <- renderPlot({
    
    data2 = data2 %>% 
      filter(quest %in% input$select) 
 
    ggplot(data2) + 
      coord_fixed(1.3) +
      geom_polygon(aes(x =long, y = lat, group = group, fill = ans), color = "black") +
      labs(title = str_wrap(input$select), x = "", y = "") + 
      scale_x_discrete(labels = "none") + 
      scale_y_discrete(labels = "none") + 
      theme(axis.title.x = element_blank(), axis.title.y = element_blank()) + 
      theme_void() +
      scale_fill_discrete(labels = str_wrap(levels(factor((data2$ans))), width = 20),
                          name = "Answer")
        

  })
  
})
