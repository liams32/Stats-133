library(dplyr)
library(shiny)
library(ggvis)
library(tidyr)
library(readr)
library(scales)
library(rsconnect)


cleaned = read_csv("../hw6/cleaned_demographics.csv") 


shinyServer(function(input, output, session) {
  
  all_values = function(x) {
    if(is.null(x)) return(NULL)
    paste0(x[4])
  }
  
  cleaned = na.omit(cleaned)
  
  
  cleaned %>% 
    ggvis(x = ~GDP, y = ~Life_Expectancy, 
          key :=~Country,
          size =~ Pop, 
          stroke := "black", 
          opacity := 0.8) %>% 
    filter(Year == eval(
      input_slider(1800, 2015, 1800, 
                   label = "Year:",
                   animate = animationOptions(
                     interval = 250, 
                     loop = TRUE)))) %>% 
    layer_points(fill = ~Region) %>% 
    add_axis("x", title = "GDP Per Capita (Inflation-Adjusted)",
             value = c(500, 5000, 50000), 
             format = "d",
             properties = axis_props(
               title = list(fontSize = 15)
             )) %>% 
    scale_numeric("x", domain = c(300, 100000), trans = "log", expand = 0) %>% 
    add_axis("y", title = "Life Expectancy", 
             values = seq(0, 80, 25), 
             properties = axis_props(
               title = list(
                 fontSize = 15))) %>%
    scale_numeric("y", domain = c(0, 80)) %>% 
    hide_legend("size") %>% 
    scale_numeric("size", range = c(50, 2500)) %>% 
    add_tooltip(all_values, "hover") %>% 
    set_options(height = 400, width = 800) %>%
    add_legend("fill", title = "Region", 
               values = c('America', 
                          'East Asia & Pacific', 
                          'Europe & Central Asia', 
                          'Middle East & North Africa', 
                          'South Asia', 
                          'Sub-Saharan Africa')) %>%
    scale_nominal("fill", 
                  range = c("black", 
                            "yellow", 
                            "purple", 
                            "blue", 
                            "chartreuse", 
                            "red")) %>% 
    bind_shiny("ggvis", "ggvis_ui")
  
})

