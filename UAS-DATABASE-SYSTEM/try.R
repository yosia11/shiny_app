library(DBI)
library(RSQLite)
library(shiny)
library(shinythemes)
library(shinyWidgets)
library(shinyalert)
library(DT)
library(forecast)
library(ggplot2)
library(plotly)
library(maps)
library(leaflet)
library(odbc)
library(RMariaDB)
library(RMySQL)

db <- dbConnect(MariaDB(),
                user='root',
                password='',
                dbname='new_mariadb',
                host='localhost')

prodtype <- dbGetQuery(db, 'SELECT distinct categoryname FROM categories')
prodtype

ui <- navbarPage(
  title = 'Demo for Navigation Bar',
  windowTitle = 'Navigation Bar', 
  position = 'fixed-top', 
  collapsible = TRUE, 
  theme = shinytheme('cosmo'), 
  tabPanel(title = 'About'),
  tabPanel(title = 'Overview'),
  tabPanel(title = 'Store Info'),
  tabPanel(title = 'Sales Prediction' ,
    numericInput("nrows", "Enter the number of rows to display:", 5),
    tableOutput("tbl")
  
  )
)


server <- function(input, output, session) { 
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
  
  