my_ui <- fluidPage(
  shinyFeedback::useShinyFeedback(),
  shinyjs::useShinyjs(),
  # Application Title
  titlePanel(
    h1("Shiny CRUD Application", align = 'center'),
    windowTitle = "Shiny CRUD Application"
  ),
  actionButton(
    "sign_out",
    "Sign Out",
    icon = icon("sign-out"),
    class = "pull-right"
  ),
  cars_table_module_ui("cars_table")
)


# customize your sign in page UI with logos, text, and colors.
my_custom_sign_in_page <- sign_in_ui_default(
  color = "#006CB3",
  company_name = "D`Sciencelabs",
  logo_top = tags$img(
    src = "Picture2.png",
    alt = "D`Sciencelabs Logo",
    style = "width: 130px; margin-top: 30px; margin-bottom: 30px;"
  ),
  logo_bottom = tags$img(
    src = "bottom-logo.png",
    alt = "D`Sciencelabs Logo",
    style = "width: 130px; margin-bottom: 15px; padding-top: 15px;"
  ),
  icon_href = "https://github.com/dsciencelabs/shiny_app/blob/main/03-shiny_crud/03_traditional_polished/shiny_app/www/background.jpg",
  background_image = "background"
)

# secure your UI behind your custom sign in page
polished::secure_ui(
  my_ui,
  sign_in_page_ui = my_custom_sign_in_page
)

# secure_ui(my_ui)   # this code to secure your UI behind without custom sign in page.
 
