#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Price Predictor"),
  
  # Sidebar with options selectors 
  sidebarLayout(
    sidebarPanel(
      h3(helpText("Select Characteristics:")),
      numericInput("carat", label = h4("Carats (0.2 to 5)"), step = 0.1, value =2, min = 0.2, max = 5),
    selectInput("cut", label = h4("Cut"), 
                  choices = list("Fair" = "Fair", "Good" = "Good",
                                 "Very Good" = "Very Good", "Premium" = "Premium", "Ideal" = "Ideal")),
    #selectInput("cut", label = h4("Cut"), c('Fair', 'Good', 'Very Good', 'Premium', 'Ideal')),
    selectInput("color", label = h4("Color"), choices = list("D" = "D", "E" = "E", "F" = "F", "G" = "G", "H" = "H", "I" = "I", "J" = "J")),
    #selectInput("Color", label = h4("Label"), c('D', 'E', 'F', 'G', 'H', 'I', 'J')),
    selectInput("clarity", label = h4("Clarity"), choices = list("I1" = "I1", "SI2" = "SI2", "SI1" = "SI1", "VS2" = "VS2", "VS1" = "VS1",
                "VVS2" = "VVS2", "VVS1" = "VVS1", "IF" = "IF" )),
    #selectInput("clarity", label = h4("Clarity"), c('SI1', 'VS2', 'VS1', 'VVS2', 'VVS1', 'IF')),
    numericInput("depth", label = h4("Depth Percentage (40 to 80)"), step = 1, value =60, min = 40, max = 80),
    numericInput("table", label = h4("Table (40 to 95)"), step = 1, value =55, min = 40, max = 95),
    submitButton('Submit')
    ),
    
    mainPanel(
      h3("According to your inputs, the price of the diamond in USD is"),
      verbatimTextOutput("prediction")
    )
  )
  
))