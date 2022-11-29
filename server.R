
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
#bd_prueba_c <-  read.csv(file.path("data/bd_prueba_c.csv"))
#bd_prueba_fc <- read.csv(file.path("data/bd_fc.csv"))

bd_prueba_b_pp <-  read.csv(file.path("data/bd_prueba_b_pp.csv"))
bd_prueba_fc <- read.csv(file.path("data/bd_fc.csv"))

bd_prueba_bi_bw <-read.csv(file.path("data/bd_prueba_bi_bw.csv"))
bd_fc_bi_bw <- read.csv(file.path("data/bd_fc_bi_bw.csv"))


bd_prueba_bi_bw_nw <-read.csv(file.path("data/bd_prueba_bi_bw_nw.csv"))
bd_fc_bi_bw_nw <-read.csv(file.path("data/bd_fc_bi_bw_nw.csv"))



names(bd_prueba_bi_bw)


id_campo <-bd_perfil_pozo_ %>%
  select(well,CAMPO)%>%
  unique()



# SERVER ------------------------------------------------------------------



server <- function(input, output, session) {

   source("modules/server_perfil.R", local = TRUE)
   #source("modules/server_wo_inc.R", local = TRUE)
  #source("modules/server_VPN_Basic.R", local = TRUE)
  #source("modules/server_VPN_Basic_WO.R", local = TRUE)
  #source("modules/server_VPN_Basic_WO_NW.R", local = TRUE)
  #source("modules/server_Well_Well_Basic.R", local = TRUE)
  source("modules/server_Well_Basic_WO.R", local = TRUE)
  #source("modules/server_Well_Basic_WO_NW.R", local = TRUE)
}


