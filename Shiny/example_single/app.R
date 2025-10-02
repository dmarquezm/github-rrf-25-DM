#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# This is a single file shiny because we have only one scrypt.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
# UI control how it looks
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data - Simple example"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 20,
                        value = 10)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
# Server control how it works
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        # faithful is a data from R that is open for users. Selecting column 2
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = '#ca8dfd', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application
# UI and server are reactive components, meaning that they call each other recursively.
# Also note that stop red button is always on when shiny app is open
shinyApp(ui = ui, server = server)
