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
shinyUI(fluidPage(
  titlePanel("Predicting the number of bikes rented at Washington D.C at any given hour"),
  
  sidebarLayout(
    sidebarPanel(helpText("Input values for each of the predictors below"), 
                 selectInput("season", label = h5("What is the current season?"), 
                             choices = list("Spring" = 1, "Summer" = 2, "Fall" = 3, "Winter" = 4), selected = 1),
                 numericInput("hour", label = h5("What hour is it?"), value = 12, min = 0, max = 23, step = 1 ),
                 checkboxInput("holiday", label = "Is it a holiday?", value = FALSE),
                 selectInput("weather", label = h5("How is the weather?"), 
                             choices = list("Clear / Partly cloudly" = 1, "Mist / Mist and cloudy" = 2, "Light Rain / Light Snow" = 3, "Heavy rain / Ice Pallets" = 4), selected = 1),
                 sliderInput("temp", label = h5("How is the temperature (In celsius)?"), min = 0, 
                             max = 41, value = 20),
                 sliderInput("hum", label = h5("How humid is the air?"), min = 0, 
                             max = 100, value = 62),
                 sliderInput("wind", label = h5("How fast is the wind?"), min = 0, 
                            max = 67, value = 12)
    ),
    mainPanel(textOutput("Result"))
    
  )
))
