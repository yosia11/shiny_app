# global.R 

library(shiny)
library(polished)

# configure the global sessions when the app initially starts up.
polished::global_sessions_config(
  app_name = "test",
  api_key = "UfB3GMTqL5EEKCmEhwJhbCUKChCYRuCwrp"
)