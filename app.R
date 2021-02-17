#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(redditsuite)
library(redditapp)

ui <- fluidPage(
    plotOutput("plot", click = "plot_click")
)

server <- function(input, output) {
    output$plot <- renderPlot({
        data <- submission_plot()
        ggplot(data) +
            aes(x = submission_collected, y = n) +
            geom_line()
    }, res = 96)


}

# Run the application
shinyApp(ui = ui, server = server)
