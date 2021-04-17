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
  color = "#006CB5",
  company_name = "D`Sciencelabs",
  logo_top = tags$img(
    src = "Logo.gif",
    alt = "Tychobra Logo",
    style = "width: 125px; margin-top: 30px; margin-bottom: 30px;"
  ),
  logo_bottom = tags$img(
    src = "",
    alt = "Tychobra Logo",
    style = "width: 200px; margin-bottom: 15px; padding-top: 15px;"
  ),
  icon_href = "https://www.google.co.id/imgres?imgurl=https%3A%2F%2Fwww.pngkey.com%2Fpng%2Fdetail%2F367-3670351_access-login-icon.png&imgrefurl=https%3A%2F%2Fwww.pngkey.com%2Fdetail%2Fu2e6w7y3r5i1r5i1_access-login-icon%2F&tbnid=xFJqrhFrhPw6aM&vet=12ahUKEwid_Lv4x4LwAhWpR30KHb85A6wQMygbegUIARCUAg..i&docid=GJoO-6x1mYAilM&w=820&h=641&q=icon%20login&hl=en&safe=strict&ved=2ahUKEwid_Lv4x4LwAhWpR30KHb85A6wQMygbegUIARCUAg",
  background_image = "https://www.google.co.id/imgres?imgurl=https%3A%2F%2Fwww.matanauniversity.ac.id%2Fimages%2Fberita%2Fmatana.jpg&imgrefurl=https%3A%2F%2Fwww.matanauniversity.ac.id%2F%3Fly%3Dnews%26c%3Ddetail%26id%3D0000000108&tbnid=iDefB-bYfV-NtM&vet=12ahUKEwi-3rulyILwAhWSs0sFHWcqAngQMygBegUIARC9AQ..i&docid=-7qda3LIqum_8M&w=600&h=445&q=matana%20university&hl=en&safe=strict&ved=2ahUKEwi-3rulyILwAhWSs0sFHWcqAngQMygBegUIARC9AQ"
)

# secure your UI behind your custom sign in page
polished::secure_ui(
  my_ui,
  sign_in_page_ui = my_custom_sign_in_page
)

# secure_ui(my_ui)   # this code to secure your UI behind without custom sign in page.
 
