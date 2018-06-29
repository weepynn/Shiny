#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


library(caret)
library(randomForest)
library(ggplot2)
data(diamonds)

subsetdata <- diamonds[c(1,2,3,4,5,6,7)]
inTrain <- createDataPartition(subsetdata$price, p = 0.1, list = F)
traindata <- subsetdata[inTrain,]
testdata <- subsetdata[-inTrain, ]
#forest <- randomForest(price ~., data = traindata, method = "class")
forest <- train(price ~., traindata, method = 'rf', trControl = trainControl(method = 'cv', number = 3))
testdata$predict <- predict(forest, newdata = testdata)
g <- ggplot(aes(x=actual, y=prediction),data=data.frame(actual=testdata$price, prediction=predict(forest, testdata))) + 
geom_point() +geom_abline(color="red") +ggtitle("RandomForest Regression in R" )


DiamondPrice <- function(x){
  predict(forest, newdata = x)
}


library(shiny)
shinyServer(
  function(input, output) {
     output$prediction <- renderPrint(DiamondPrice(x = data.frame(carat=input$carat, cut=input$cut, color=input$color, 
                                                                 clarity=input$clarity, depth=input$depth, table=input$table)))
  }
)
