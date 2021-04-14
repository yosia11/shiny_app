# server 


server <- function(input, output) {
  tab_login$server(input, output) # load login page server
  tab_01$server(input, output)    # load server of dashboard_01
  tab_02$server(input, output)    # load server of dashboard_02
}



# polished::secure_server(server)  # run this, if you want to use polished authentication



