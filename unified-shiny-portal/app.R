rm(list = ls())
gc()

library(shiny)
library(shinyjs)
library(glue)

# load global parameters (DB connections, login credentials, etc)
source('global.R') 
# load ui/server from each tab
source('./00_tab_login/tab.R') 
source('./01_tab_dashboard_01/tab.R')
source('./02_tab_dashboard_02/tab.R')

app.title <- 'An Unified Shiny Portal'

# ui for unified shiny portal
ui <- navbarPage(
  title = app.title, 
  id = 'tabs', 
  selected = 'Login to continue', 
  theme = 'main.css',              # defined in www/main.css
  header = header,                 # defined in global.R
  footer = footer,                 # defined in global.R
  useShinyjs(),                    # initiate javascript
  tab_login$ui,                    # ui for login page
  tab_01$ui,                       # ui for dashboard_01
  tab_02$ui                        # ui for dashboard_02
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  tab_login$server(input, output) # load login page server
  tab_01$server(input, output)    # load server of dashboard_01
  tab_02$server(input, output)    # load server of dashboard_02
}

# Run the application 
shinyApp(ui = ui, server = server)

