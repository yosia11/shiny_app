# server.R

server <- function(input, output, session) {
  output$user_out <- renderPrint({
    session$userData$user()
  })
  
  observeEvent(input$sign_out, {
    sign_out_from_shiny()
    session$reload()
  })
}

polished::secure_server(server)