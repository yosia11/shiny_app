library(shiny)
library(shinydashboard)      # <-- Change this line to: library(semantic.dashboard)
# library(semantic.dashboard)

ui <- dashboardPage(
    dashboardHeader(title = "Basic dashboard"),
    dashboardSidebar(sidebarMenu(
        menuItem(tabName = "home", text = "Home", icon = icon("home")),
        menuItem(tabName = "Introduction", text = "Introduction", icon = icon("adn")),
        menuItem(tabName = "Raw Dataset", text = "Raw Dataset", icon = icon("database")),
        menuItem(tabName = "EDA", text = "EDA", icon = icon("chart-pie")),
        menuItem(tabName = "Modeling", text = "Modeling", icon = icon("bomb")),
        menuItem(tabName = "Prediction", text = "Prediction", icon = icon("snowflake")),
        menuItem(tabName = "About", text = "Another Tab", icon = icon("heart"))
    )),
    dashboardBody(
        fluidRow(
            box(plotOutput("plot1", height = 250)),
            box(
                title = "Controls",
                sliderInput("slider", "Number of observations:", 1, 100, 50)
            )
        )
    )
)

server <- function(input, output) {
    set.seed(122)
    histdata <- rnorm(500)
    output$plot1 <- renderPlot({
        data <- histdata[seq_len(input$slider)]
        hist(data)
    })
}

shinyApp(ui, server)