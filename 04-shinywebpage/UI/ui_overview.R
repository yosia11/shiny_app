
page_overview <- dashboardPage(
  title   = "Overview",
  header  = dashboardHeader(disable = TRUE),
  sidebar = dashboardSidebar(disable = TRUE),
  body    = dashboardBody(fluidRow(fluidRow(uiOutput("box_caseEvolution"))))
)