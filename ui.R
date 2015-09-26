require(shiny)
require(manipulate)
require(caret)
require(e1071)
require(randomForest)
require(ggplot2)

shinyUI(
        pageWithSidebar(
                headerPanel("Exploration and Prediction of the Iris Dataset"),
                sidebarPanel(
                        sliderInput('pl',"Petal Length",value=4,min = 1, max = 6.9,step=0.1),
                        sliderInput('pw',"Petal Width",value=1.3,min = 0.1, max = 2.5,step=0.1),
                        h3("How to make it work"),
                        p("To use the iris exploration and prediction app, simply grab the sliders to select the petal length and petal width, and let the app predict what species this iris would be. It will also graphically point where it would stand compared to the real observations.")
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Prediction",plotOutput("scatter"),
                                         h3("Predictive Model Accuracy"),
                                         verbatimTextOutput("oAcc")),
                                tabPanel("Documentation & Pitch", 
                                         h4("The Mechanics"),
                                         p("The predictions are provided thanks to a random forest model, built ontop of the iris dataset. Using the input from both sliders, it predicts the iris species from what it has learned from the dataset. As can be seen in the pitch, the petals are by far the most distinctive aspect of iris species."),
                                         h4("The Pitch"),
                                         p("http://rpubs.com/Gelinator/irisExploration"),
                                         h4("The Code"),
                                         p("https://github.com/Gelinator/MyShinyApp"),
                                         p("Sorry, tried my best to make them clickable.")
                                )
                        )
                )
        )
)