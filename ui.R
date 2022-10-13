

library(shiny)
library(shinydashboard)

source("modules/ui_tab_perfil.R")


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
      menuItem(HTML("<b> VPN +</b>"),  icon = icon("dollar-sign"),
               menuSubItem("Basic", tabName = "tab_basic_vpn", icon = icon("fas fa-poll-h")),
               menuSubItem("Basic + WO", tabName = "tab_basic_wo_vpn", icon = icon("fas fa-chart-area")),
               menuSubItem("Basic + WO + NW", tabName = "tab_basic_wo_nw_vpn", icon = icon("fas fa-file-export"))
               ),
      menuItem(HTML("<b> Well by Well + </b>"), icon = icon("dollar-sign"),
               menuSubItem("Basic", tabName = "tab_basic_profile", icon = icon("fas fa-poll-h")),
               menuSubItem("Basic + WO", tabName = "tab_basic_wo_profile", icon = icon("fas fa-chart-area")),
               menuSubItem("Basic + WO + NW", tabName = "tab_basic_wo_nw_profile", icon = icon("fas fa-file-export"))
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
      tab_perfil

    )
   
  )
  
  
)
