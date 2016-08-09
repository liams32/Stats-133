
library(dplyr)
library(shiny)
library(ggplot2)
library(readr)
library(scales)
library(rsconnect)


cleaned = read_csv("cleaned_demographics.csv")


Server = shinyServer(function(input, output) {
   
  output$Life = renderPlot({
    
    a = "Pop"
    b = "GDP"
    c = "Life_Expectancy"
    d = "Region"
    
   
    cleaned = cleaned %>% 
      filter(Year %in% input$years) %>% 
      na.omit()
    
    
    ggplot(cleaned) + 
      geom_point(aes_string(x = b, 
                              y = c, 
                              fill = d, 
                              size = a), 
      color = "black", alpha = 0.7, shape = 21) + labs(title = input$years, 
                          x = "GDP Per Capita (Inflation-Adjusted)", 
                          y = "Life Expectancy at Birth") + 
      scale_x_log10(limits = c(500, 50000), breaks = c(500, 5000, 50000),
                         labels = dollar_format(prefix = "$")) + 
      scale_y_continuous(limits = c(20,80), breaks = seq(25,75,25), 
                         labels = c("25 \nyears", "50 \nyears", "75 \nyears")) +
      guides(size = FALSE, alpha = FALSE) + 
      scale_size_area(max_size = 20) + 
      scale_fill_manual(values = c("green", "red", "yellow", "purple", "black", "blue")) +
      theme(axis.text.x = element_text(size = 12), 
            axis.text.y = element_text(size = 12),
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(size = 15),
            plot.title = element_text(size = 20)
            )

    
  })
  
})
