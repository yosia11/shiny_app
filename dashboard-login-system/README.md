# Steps to add login authentication feature in Shiny

## Step 1 :

Install the following packages by using the command install.packages(package-name)
* shiny
* shinydashboard
* DT
* shinyjs
* sodium

## Step 2 : 

Run the program below: 

```
library(shiny)
library(shinydashboard)
library(DT)
library(shinyjs)
library(sodium)
```

## Step 3 : 

Run this app --> in your R evironment (console)
  
**Note**
Docker-based shinyproxy package is available for free which has an authentication feature along with some other great enterprise features.
But you need to know docker to use this package and many users find it complicated.
