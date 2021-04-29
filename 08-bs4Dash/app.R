library(shiny)
library(bs4Dash)
library(ggplot2)  # for the diamonds dataset and visualization
library(DT)

    ui = bs4DashPage(enable_preloader = FALSE,
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
                                     text = "Item List 1",
                                     icon = "list",
                                     startExpanded = FALSE,
                                     bs4SidebarMenuSubItem(
                                         text = "Item 1",
                                         tabName = "item1",
                                         icon = "sitemap"
                                         ),
                                     bs4SidebarMenuSubItem(
                                         text = "Item 2",
                                         tabName = "item2",
                                         icon = "sitemap"
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
                    title = "Closable Box with some text",
                    closable = TRUE,
                    width = 12,
                    status = "warning",
                    solidHeader = FALSE,
                    collapsible = TRUE,
                    tags$h1("Intro"),
                    p("I wrote this project to make it easier for students to make shiny applications by using the bs4Dash package."),
                    tags$h2("About bs4Dash"),
                    tags$p("bs4Dash relies on the same basis as {shinydashboard}, 
                            that is the AdminLTE HTML template, except the version is higher (3.1.0 vs 2.4). 
                            The biggest difference is the dependence on Bootstrap 4, 
                            which is not natively supported by {Shiny}. 
                            That’s why elements like tabsetPanel(), actionButton(), 
                            … have been rewritten to provide full Bootstrap4 support. 
                            In addition, bs4Dash comes with extra elements that will 
                            help you to develop Shiny apps with a more professional look and feel.
                            Below is a summary of the main features:"),
                    div(img(
                        src = "https://github.com/dsciencelabs/shiny_app/blob/main/Logo.gif?raw=true",
                        width = 400,
                        height = 400,
                        align = "center"),style="text-align: center;"
                    )
                    
                )
            ),
            bs4TabItem(
                tabName = "item2",
                bs4Card(
                    title = "Examples of DataTables",
                    closable = TRUE,
                    width = 12,
                    solidHeader = TRUE,
                    status = "primary",
                    collapsible = TRUE,
                    dataTableOutput('table')
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
                    tags$h2("Dropdown Button"),
                    br(),
                    dropdown(
                        
                        tags$h3("List of Input"),
                        
                        pickerInput(inputId = 'xcol2',
                                    label = 'X Variable',
                                    choices = names(iris),
                                    options = list(`style` = "btn-info")),
                        
                        pickerInput(inputId = 'ycol2',
                                    label = 'Y Variable',
                                    choices = names(iris),
                                    selected = names(iris)[[2]],
                                    options = list(`style` = "btn-warning")),
                        
                        sliderInput(inputId = 'clusters2',
                                    label = 'Cluster count',
                                    value = 3,
                                    min = 1, max = 9),
                        
                        style = "unite", icon = icon("gear"),
                        status = "danger", width = "300px",
                        animate = animateOptions(
                            enter = animations$fading_entrances$fadeInLeftBig,
                            exit = animations$fading_exits$fadeOutRightBig
                        )
                    ),
                    
                    plotOutput(outputId = 'plot2')
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
                active = FALSE,
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
        
        # data 
        output$table <- renderDataTable(iris)
        
        # Plot 1
        output$distPlot <- renderPlot({
            
            # generate bins based on input$bins from ui.R
            x    <- faithful[, 2]
            bins <- seq(min(x), max(x), length.out = input$bins + 1)
            
            # draw the histogram with the specified number of bins
            hist(x, breaks = bins, col = 'darkgray', border = 'white')
            
        })
        
        
        # Plot 2
        selectedData2 <- reactive({
            iris[, c(input$xcol2, input$ycol2)]
        })
        
        clusters2 <- reactive({
            kmeans(selectedData2(), input$clusters2)
        })
        
        output$plot2 <- renderPlot({
            palette(c("#E41A1C", "#377EB8", "#4DAF4A",
                      "#984EA3", "#FF7F00", "#FFFF33",
                      "#A65628", "#F781BF", "#999999"))
            
            par(mar = c(5.1, 4.1, 0, 1))
            plot(selectedData2(),
                 col = clusters2()$cluster,
                 pch = 20, cex = 3)
            points(clusters2()$centers, pch = 4, cex = 4, lwd = 4)
        })
        
        
    }
    
shiny::shinyApp(ui,server)