library(shiny)
library(bs4Dash)

shiny::shinyApp(
    ui = bs4DashPage(enable_preloader = F,
    navbar = bs4DashNavbar(skin = "light",
                           status = NULL,
                           border = TRUE,
                           sidebarIcon = "bars",
                           compact = FALSE,
                           controlbarIcon = "th",
                           leftUi = actionButton("goButton", "Home", class = "btn-success"),
                           rightUi = actionButton("goButton", "Profle", class = "btn-success")
                           ),
    sidebar = bs4DashSidebar(inputId = NULL,
                             disable = FALSE,
                             title = "D`Sciencelabs",
                             skin = "dark",
                             status = "danger",
                             brandColor = NULL,
                             url = "https://rpubs.com/dsciencelabs/",
                             src = "https://github.com/dsciencelabs/shiny_app/blob/main/Logo.gif?raw=true",
                             elevation = 4,
                             opacity = 0.8,
                             expand_on_hover = TRUE,
                bs4SidebarMenu(
                    bs4SidebarMenuItem(
                            text = "Menu1",
                        bs4SidebarMenuSubItem(
                            tabName = "subtab1",
                            text = "Tab 1"),
                        bs4SidebarMenuSubItem(
                            tabName = "subtab2",
                            text = "Tab 2")
                        )
                    )
                ),
                
    controlbar = bs4DashControlbar(),
    footer = bs4DashFooter(),
    title = "test",
    body = bs4DashBody(
        fluidRow(
            column(
                width = 6,
                bs4Card(
                    title = "Closable Box with dropdown", 
                    closable = TRUE, 
                    width = 12,
                    status = "warning", 
                    solidHeader = FALSE, 
                    collapsible = TRUE,
                    labelText = 1,
                    labelStatus = "danger",
                    labelTooltip = "Hi Bro!",
                    dropdownIcon = "wrench",
                    dropdownMenu = dropdownItemList(
                        dropdownItem(url = "http://www.google.com", name = "Link to google"),
                        dropdownItem(url = "#", name = "item 2"),
                        dropdownDivider(),
                        dropdownItem(url = "#", name = "item 3")
                    ),
                    p("Box Content")
                )
            ),
            column(
                width = 6, 
                bs4Card(
                    title = "Closable Box with gradient", 
                    closable = TRUE, 
                    width = 12,
                    status = "warning", 
                    solidHeader = FALSE, 
                    gradientColor = "success",
                    collapsible = TRUE,
                    p("Box Content")
                )
            )
        ),
        fluidRow(
            bs4Card(
                title = "Closable Box with solidHeader", 
                closable = TRUE, 
                width = 6,
                solidHeader = TRUE, 
                status = "primary",
                collapsible = TRUE,
                p("Box Content")
            ),
            bs4Card(
                title = "Maximizable Card", 
                width = 6,
                status = "warning", 
                closable = FALSE,
                maximizable = TRUE, 
                collapsible = FALSE,
                sliderInput("obs", "Number of observations:",
                            min = 0, max = 1000, value = 500
                ),
                plotOutput("distPlot")
            )
        )
    )
    ),
    server = function(input, output) {}
)