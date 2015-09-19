require(shiny)
require(manipulate)
require(caret)

shinyUI(pageWithSidebar(
        headerPanel("Header"),
        sidebarPanel(
                h3('Sidebar text'),
                numericInput("id1",'Numeric input',0,min=-100,max=100,step=10),
                checkboxGroupInput("id2","Checkbox",
                                   c("Value 1"="1",
                                     "Value 2"="2",
                                     "Value 3"="3")
                ),
                dateInput("date","Date:")
        ),
        mainPanel(
                h3('Main Panel text'),
                code(432/3),
                p("text"),
                h4("you entered"),
                verbatimTextOutput("oid1"),
                h4("you entered"),
                verbatimTextOutput("oid2"),
                h4("You dated"),
                verbatimTextOutput("odate")
        )
)
)