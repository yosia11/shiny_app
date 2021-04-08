# ui.R

ui <- fluidPage(
  fluidRow(
    column(
      6,
      h1("Hello Shiny!")
    ),
    column(
      6,
      br(),
      actionButton(
        "sign_out",
        "Sign Out",
        icon = icon("sign-out-alt"),
        class = "pull-right"
      )
    ),
    column(
      12,
      verbatimTextOutput("user_out")
    )
  )
)

polished::secure_ui(ui)