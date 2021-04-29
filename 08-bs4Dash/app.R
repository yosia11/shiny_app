library(shiny)
library(bs4Dash)

    ui = bs4DashPage(enable_preloader = FALSE,
                     controlbar_collapsed = FALSE,
                     controlbar_overlay = FALSE,
    navbar = bs4DashNavbar(skin = "light", 
                           status = NULL,
                           border = TRUE,
                           sidebarIcon = "bars",
                           compact = FALSE,
                           controlbarIcon = "th",
                           leftUi = actionButton("goButton", "Left UI", class = "btn-success"),
                           rightUi = actionButton("goButton", "Right UI", class = "btn-success")
                           ),
    sidebar = bs4DashSidebar(inputId = NULL,
                             disable = FALSE,
                             title = "D`Sciencelabs",
                             skin = "dark",
                             status = "primary",
                             brandColor = NULL,
                             url = "https://rpubs.com/dsciencelabs/",
                             src = "https://github.com/dsciencelabs/shiny_app/blob/main/Logo.gif?raw=true",
                             elevation = 4,
                             opacity = 0.8,
                             expand_on_hover = TRUE,
                             bs4SidebarMenu(
                                 # bs4SidebarHeader("List of items 1"),
                                 bs4SidebarMenuItem(
                                     text = "Item List",
                                     icon = "bars",
                                     startExpanded = TRUE,
                                     bs4SidebarMenuSubItem(
                                         text = "Item 1",
                                         tabName = "item1",
                                         icon = "circle-thin"
                                         ),
                                     bs4SidebarMenuSubItem(
                                         text = "Item 2",
                                         tabName = "item2",
                                         icon = "circle-thin"
                                         )
                                 ),
                                # bs4SidebarHeader("List of items 2"),
                                 bs4SidebarMenuItem(
                                     text = "Item List 2",
                                     icon = "bars",
                                     startExpanded = FALSE,
                                     bs4SidebarMenuSubItem(
                                         text = "Item 3",
                                         tabName = "item3",
                                         icon = "circle-thin"
                                     ),
                                     bs4SidebarMenuSubItem(
                                         text = "Item 4",
                                         tabName = "item4",
                                         icon = "circle-thin"
                                     )
                                 )
                             )
                ),
                
    body = bs4DashBody(
        bs4TabItems(
            bs4TabItem(
                tabName = "item1",
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
            bs4TabItem(
                tabName = "item2",
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
            ),
            bs4TabItem(
                tabName = "item3",
                bs4Card(
                    title = "Closable Box with solidHeader",
                    closable = TRUE,
                    width = 12,
                    solidHeader = TRUE,
                    status = "primary",
                    collapsible = TRUE,
                    p("Box Content")
                )
            ),
            bs4TabItem(
                tabName = "item4",
                bs4Card(
                    title = "Maximizable Card",
                    width = 12,
                    status = "warning",
                    closable = TRUE,
                    collapsible = TRUE,
                    maximizable = TRUE,
                    sliderInput("bins",
                                "Number of bins:",
                                min = 1,
                                max = 50,
                                value = 30),
                    plotOutput("distPlot")
                )
            )
        )
        
    ),
    
    controlbar = bs4DashControlbar(
        bs4DashControlbarMenu(
            id = "tabcard",
            side = "left",
            bs4DashControlbarItem(
                tabName = "Tab1", 
                active = FALSE,
                "Content 1"
            ),
            bs4DashControlbarItem(
                tabName = "Tab2", 
                active = TRUE,
                "Content 2"
            ),
            bs4DashControlbarItem(
                tabName = "Tab3", 
                active = FALSE,
                "Content 3"
            )
        )
    ),
    
    footer = bs4DashFooter(Sys.Date(), 
                           copyrights = "@d'sciencelabs", 
                           right_text = "by Bakti Siregar, M.Sc")
    
    )
    
    server = function(input, output) {
    
        output$distPlot <- renderPlot({
            
            # generate bins based on input$bins from ui.R
            x    <- faithful[, 2]
            bins <- seq(min(x), max(x), length.out = input$bins + 1)
            
            # draw the histogram with the specified number of bins
            hist(x, breaks = bins, col = 'darkgray', border = 'white')
            
        })
        
        
        
        
    }
    
shiny::shinyApp(ui,server)