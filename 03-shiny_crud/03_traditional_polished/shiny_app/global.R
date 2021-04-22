# Library in packages used in this application
library(shiny)
library(DT)
library(DBI)
library(RSQLite)
library(shinyjs)
library(shinycssloaders)
library(lubridate)
library(shinyFeedback)
library(dplyr)
library(dbplyr)
library(polished)

db_config <- config::get()$db

# Create database connection
conn <- dbConnect(
  RSQLite::SQLite(),
  dbname = db_config$dbname
)

# # https://polished.tech/docs/01-get-started
# polished::global_sessions_config(
#   app_name = "crud_polished",
#   api_key = "qovar1GnvQZsx4yTgVGzWPuQWsUxVM2nDd",
#   firebase_config = list(
#     apiKey = "AIzaSyB18BY-msp5MuN1Kw0nFNUYJuw1vVQJGcE",
#     authDomain = "shiny-c596a.firebaseapp.com",
#     projectId = "shiny-c596a"
#   ),
#   sign_in_providers = c("facebook", "email")
# )

global_sessions_config(
  app_name = "crud_polished",
  api_key = "qovar1GnvQZsx4yTgVGzWPuQWsUxVM2nDd"
)

# Stop database connection when application stops
shiny::onStop(function() {
  dbDisconnect(conn)
})

# Turn off scientific notation
options(scipen = 999)

# Set spinner type (for loading)
options(spinner.type = 8)
