user.access <<- list(
  'bakti' = '123456'
)

header <- tagList(
  tags$p('this is header'),
  tags$hr()
)

footer <- tagList(
  tags$hr(),
  tags$p('this is footer')
)


# For Authentication Shiny with [Polished.tech]
# to configure the global sessions when the app initially starts up, uncomment the following code: 

# library(polished)
# polished::global_sessions_config(
#   app_name = "test1",
#   api_key = "UfB3GMTqL5EEKCmEhwJhbCUKChCYRuCwrp"
# )

