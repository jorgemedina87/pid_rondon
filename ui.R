
##Packages ----
############################.
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)
library(plotly)
library(shiny)
library(shinyBS) #modals
library(shinythemes) # layouts for shiny
library(dplyr) # data manipulation
library(ggplot2) #data visualization
library (DT) # for data tables
library(leaflet) #javascript maps
library(plotly) #interactive graphs
library(shinyWidgets) # for extra widgets
library(tibble) # rownames to column in techdoc
library(shinyBS) #modals
library(shinyjs)
library(shinydashboard) #for valuebox on techdoc tab
library(sp)
library(lubridate) #for automated list of dates in welcome modal
library(shinycssloaders) #for loading icons, see line below
library(rmarkdown)
library(webshot) #to download plotly charts
library(rintrojs) # for help intros
library(tidyr)
library(stringr)
library(purrr)
library(rvest)

source("modules/ui_tab_perfil.R")
#source("modules/ui_VPN_Basic.R", local = TRUE)
source("modules/ui_VPN_total.R", local = TRUE)
source("modules/ui_Well_Well_Basic.R", local = TRUE)
source("modules/ui_VPN_WO.R", local = TRUE)
source("modules/ui_VPN_NW.R", local = TRUE)




ui <- dashboardPage(
  skin="green",
  title = "PID RONDON",
  # HEADER ------------------------------------------------------------------
  dashboardHeader(title = "PID RONDON"), 
  
  # SIDEBAR -----------------------------------------------------------------
  
  dashboardSidebar(
    br(),
    sidebarMenu(
      menuItem(HTML("<b> Profile </b>"), tabName = "tab_perfil", icon = icon("area-chart")),
      menuItem(HTML("<b> VPN Total +</b>"),  icon = icon("dollar-sign"),
               menuSubItem("Total", tabName = "VPN_total", icon = icon("fas fa-chart-area"))
               ),
       menuItem(HTML("<b> Well by Well + </b>"),  icon = icon("dollar-sign"),
       menuSubItem("Basic", tabName = "Well_Well_Basic", icon = icon("fas fa-chart-area")),
       menuSubItem("WO", tabName = "VPN_WO", icon = icon("fas fa-chart-area")),
              menuSubItem("NW", tabName = "VPN_NW", icon = icon("fas fa-file-export"))
               ),
     
      br(),
      br(),
      hr(),
      menuItem(HTML("<b>Help</b>"), tabName = "tab_help", icon = icon("life-ring"), selected=TRUE)),
    
    br(),
    br(),
    br(),
    br(),
    br(),
    br(),
    div(img(src = "logo.png",width = "200", height = "100"), style = "text-align: center;")

    ),

  
  # BODY --------------------------------------------------------------------
 
  
  dashboardBody(
   
    tabItems(
      tab_perfil,
      VPN_total,
      
      Well_Well_Basic,
      VPN_WO,
      VPN_NW 
    )
   
  )

)


  

