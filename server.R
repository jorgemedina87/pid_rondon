
options(shiny.reactlog = TRUE)

# Read Pins ---------------------------------------------------------------
# library(pins)
# library(rsconnect)
###pat
library(patchwork)
library(lubridate)
library(shiny)
library(shinydashboard)
library(kableExtra)
library(waterfalls)
library(dplyr)
library(ggplot2)
library(readxl)
library(plotly)
library (DT) # for data tables
library(tidyr)

bd_perfil_pozo_v <- read_excel(file.path("data/bd_cr_c_nf_nn.xlsx"), sheet = "Sheet1")
bd_perfil_pozo_ <- read_excel(file.path("data/bd_perfil_pozo_.xlsx"), sheet = "Sheet1")
bd_prueba_c <-  read.csv(file.path("data/bd_prueba_c.csv"))
bd_prueba_fc <- read.csv(file.path("data/bd_fc.csv"))



id_campo <-bd_perfil_pozo_ %>%
  select(well,CAMPO)%>%
  unique()



# SERVER ------------------------------------------------------------------



server <- function(input, output, session) {

   #source("modules/server_perfil.R", local = TRUE)
   #source("modules/server_wo_inc.R", local = TRUE)
  # source("modules/server_wo_exp.R", local = TRUE)
  # 
}


