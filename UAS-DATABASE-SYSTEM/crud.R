library(shiny)
library(shinydashboard)

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
      tabItem(tabName = "view_table", uiOutput("tab1UI")),
      tabItem(tabName = "del_table", uiOutput("tab2UI")),
      tabItem(tabName = "update_table", uiOutput("tab3UI")),
      tabItem(tabName = "create_table", uiOutput("tab4UI")),
      tabItem(tabName = "insert_value", uiOutput("tab5UI")),
      tabItem(tabName = "about", uiOutput("tab6UI"))
    )
  )
)

server <- function(input, output) { }

shinyApp(ui, server)

