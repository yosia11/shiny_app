library(shiny)
library(shinydashboard)
library(DT)
library(DBI)
library(shinyjs)

dat<-read.csv("Orders.csv",header = TRUE,stringsAsFactors = TRUE)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    collapsed = TRUE, 
    div(htmlOutput("welcomee"), style = "padding: 20px"),
    sidebarMenu(
      menuItem("View Tables", tabName = "view_table", icon = icon("search")),
      menuItem("Create Tables", tabName = "create_table", icon = icon("plus-square")),
      menuItem("Update Tables", tabName = "update_table", icon = icon("exchange-alt")),
      menuItem("Insert Entries", tabName = "insert_value", icon = icon("edit")),
      menuItem("Delete Tables", tabName = "del_table", icon = icon("trash-alt")),
      menuItem("About", tabName = "about", icon = icon("info-circle"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "view_table", class = "active",
              fluidRow(
                box(width = 12, dataTableOutput('results'))
              )),
      tabItem(tabName = "del_table", uiOutput("tab2UI")),
      tabItem(tabName = "update_table", uiOutput("tab3UI")),
      tabItem(tabName = "create_table", uiOutput("tab4UI")),
      tabItem(tabName = "insert_value", numericInput("nrows", "Enter the number of rows to display:", 5),
              tableOutput("tbl"), shiny::onstop),
      tabItem(tabName = "about", uiOutput("tab6UI"))
    )
  )
)

server <- function(input, output) { 
  
  output$results <-  DT::renderDataTable({
    datatable(dat, options = list(autoWidth = TRUE,
                                     searching = FALSE))
  })
  
  output$tbl <- renderTable({
    conn <- dbConnect(
      drv = RMySQL::MySQL(),
      dbname = "new_mariadb",
      host = "localhost",
      username = "root",
      password = "")
    on.exit(dbDisconnect(conn), add = TRUE)
    dbGetQuery(conn, paste0(
      "SELECT * FROM categories LIMIT ", input$nrows, ";"))
  }) 
  
  }

shinyApp(ui, server)

