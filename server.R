require(shiny)
require(caret)
require(randomForest)
require(manipulate)
require(e1071)
require(ggplot2)
#loading data
data("iris")

shinyServer(
        function(input,output) {
                set.seed(543)
                rf <- train(Species ~ Petal.Length+Petal.Width,iris,method="rf",ntree=500,"pca")
                output$scatter <- renderPlot({
                        plot <- qplot(Petal.Length,Petal.Width,data=iris,color=Species,geom="jitter")
                        
                        PL <- input$pl
                        PW <- input$pw
                        
                        df <- data.frame(Petal.Length=PL,Petal.Width=PW)
                        plot + geom_vline(xintercept=PL) + geom_hline(yintercept=PW) + annotate("text",x=2,y=2.5,label=paste("Prediction = ", predict(rf,df))) + annotate("text",x=2,y=2.4,label=paste("Petal Length = ", PL)) + annotate("text",x=2,y=2.3,label=paste("Petal Width = ", PW))
                }
                )
                output$oAcc <- renderPrint({rf$results$Accuracy})
        }
)