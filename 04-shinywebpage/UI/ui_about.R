body_about <- dashboardBody(
  fluidRow(
    fluidRow(
      column(
        box(title = div("About this project", style = "padding-left: 20px", class = "h2"),
          column(
            h3("The Background of COVID-19 Dashboard"),
            "This Dashboard was build from Shiny packages and developed by Bakti Siregar, M.Sc (Professional Data Science and Lectuter at Matana University)",
            tags$br(),
            h3("Words of Wisdom"),
            "The soul of spirit must be equally kept clean. 
            Because we know that the key to overcome this crisis is patience, courage, self-discipline, adaptation and alertness.",
            tags$br(),
            h3("Disclaimer"),
            "This App is for educational purposes only.",
            tags$br(),
            h3(" "),
            width = 12),
          width = 12,
),
        width = 12,
        style = "padding: 15px"
      )
    )
  )
)


page_about <- dashboardPage(
  title = "About",
  header = dashboardHeader(disable = TRUE),
  sidebar = dashboardSidebar(disable = TRUE),
  body = body_about
)