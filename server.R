#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
source('Model.R')

shinyServer(function(input, output) {
  
  
  output$Result <- renderText({paste("Considering the data given, the predicted number of bikes rented is: ", round(predict(train_model, newdata = data.frame(season = input$season, hr = input$hour, holiday = as.numeric(input$holiday), 
                                                                                weathersit = input$weather, temp = input$temp/41, hum = input$hum/100, 
                                                                                windspeed = input$wind/67), type = 'response'),0 )) })
    
  })
  