# Steps to add login authentication feature in shinydashboard

## Step 1 :

Install the following packages by using the command install.packages(package-name)
* shiny
* shinydashboard
* DT
* shinyjs
* sodium

## Step 2 : 

Run the program below in your R Console (If you haven't install it before): 

```
install.packages("shiny")
install.packages("shinydashboard")
install.packages("DT")
install.packages("shinyjs")
install.packages("sodium")
```

## Step 3 : 

Run this app --> https://github.com/dsciencelabs/shiny_app/blob/main/dashboard-login-system/app.R  


# How to customize the program

1.  In the above program, two user names and passwords are defined:

Username : myuser  --> Password : mypass 
Username : myuser1 --> Password : mypass1. 

To change them, you can edit the following code in R program.

```
credentials = data.frame(
  username_id = c("myuser", "myuser1"),
  passod   = sapply(c("mypass", "mypass1"),password_store),
  permission  = c("basic", "advanced"), 
  stringsAsFactors = F
  )
```

2. In order to modify sidebar section, you can edit the following section of code.

```
if (USER$login == TRUE ){ 
  sidebarMenu(
    menuItem("Main Page", tabName = "dashboard", icon = icon("dashboard"))
      )
   }
```

3.  In order to edit main body of the app, you can make modification in the following section of code.

```
if (USER$login == TRUE ) {
  tabItem(tabName ="dashboard", class = "active",
    fluidRow(
    box(width = 12, dataTableOutput('results'))
    )
  )
    }
    else {
      loginpage
    }
```

4.  Suppose you want to show multiple tabs if permission level is set "advanced". Otherwise show a single tab. If you login with credentials **Username : myuser1 Password : mypass1**, you would find two tabs. Else it would show only one tab named "Main Page". Replace renderUI function of output$sidebarpanel and output$body with the following script.

```
output$sidebarpanel <- renderUI({
    if (USER$login == TRUE ){ 
      if (credentials[,"permission"][which(credentials$username_id==input$userName)]=="advanced") {
        sidebarMenu(
        menuItem("Main Page", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("About Page", tabName = "About", icon = icon("th"))
        )
      }
      else{
        sidebarMenu(
          menuItem("Main Page", tabName = "dashboard", icon = icon("dashboard"))
        )
        
      }
    }
  })
  
  
  output$body <- renderUI({
    if (USER$login == TRUE ) {
    if (credentials[,"permission"][which(credentials$username_id==input$userName)]=="advanced") {
    tabItems(
              tabItem(
               tabName ="dashboard", class = "active",
               fluidRow(
                box(width = 12, dataTableOutput('results'))
              ))
        ,
          tabItem(
            tabName ="About",
            h2("This is second tab")
              )
    )
    } 
      else {
        tabItem(
          tabName ="dashboard", class = "active",
          fluidRow(
            box(width = 12, dataTableOutput('results'))
          ))
        
      }
    
    }
    else {
      loginpage
    }
  })
```
  
**Note**
Docker-based shinyproxy package is available for free which has an authentication feature along with some other great enterprise features.
But you need to know docker to use this package and many users find it complicated.
