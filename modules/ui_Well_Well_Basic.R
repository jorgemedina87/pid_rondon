
Well_Well_Basic <- tabItem(tabName = "Well_Well_Basic", 
                 
                   
                           sidebarPanel(width=4,
                                        column(12,
                                               shiny::hr(),
                                               div(title="", # tooltip
                                                   style = "margin-top: 10px; margin-bottom: 15px;", 
                                                   radioGroupButtons("id_D_Dec", 
                                                                     label= HTML("<strong>Paso 1.</strong>- Seleccione qu&eacute analisis desea explorar."), 
                                                                     choices = c("Perfil"='Perfil',
                                                                                 "N pozo"='n_well',
                                                                                 "Sin Costo F"='sin_fijo'),
                                                                     checkIcon = list(yes = icon("check")),
                                                                     select='Perfil' ,
                                                                     justified = TRUE
                                                   )),
                                       tags$script("$(\"input:radio[name='id_D_Dec'][value='Perfil']\").parent().css('background-color', '#F7DB17');"),
                                       tags$script("$(\"input:radio[name='id_D_Dec'][value='n_well']\").parent().css('background-color', '#CCD32A');"),
                                       tags$script("$(\"input:radio[name='id_D_Dec'][value='sin_fijo']\").parent().css('background-color', '#004236');"),
                                       
                                ),
                                
                                
                                column(12,
                                       shiny::hr(),
                                       div(title="", # tooltip
                                           style = "margin-top: 10px; margin-bottom: 20px;",
                                           radioGroupButtons("id_tipo_campo",
                                                             label= HTML("<strong>Paso 2.</strong>- Seleccione el tipo de Campo de interes"),
                                                             choices = c("RONDON"='RONDON',
                                                                         "CARICARE"='CARICARE'),
                                                             checkIcon = list(yes = icon("check")),
                                                             select='CARICARE' ,
                                                             justified = TRUE
                                           )),
                                       
                                       tags$script("$(\"input:radio[name='id_tipo_campo'][value='RONDON']\").parent().css('background-color', '#FF5F00');"),
                                       tags$script("$(\"input:radio[name='id_tipo_campo'][value='CARICARE']\").parent().css('background-color', '#808080');"),
                                       
                                       
                                ),
                                
                                
                                
                                column(12,
                                       shiny::hr(),
                                       div(title="",
                                           p(tags$b(" Paso 3. Selecciones el tipo de pozo analizar"))),
                                       
                                       
                                       div(title="", # tooltip
                                           awesomeCheckbox(inputId = "v_dist_pozo", label = "Pozo", value = FALSE,status="success")),
                                       
                                       conditionalPanel(condition = "input.v_dist_pozo == true",
                                                        selectInput(inputId = "tipo_well", label = strong(""),
                                                                    choices = "",
                                                                    selected = "")
                                                        
                                       )
                                       
                                       
                                ),
                                column(12,
                                       shiny::hr(),
                                       div(title="", # tooltip
                                           style = "margin-top: 10px; margin-bottom: 20px;",
                                           radioGroupButtons("id_tipo_reserva1", 
                                                             label= HTML("<strong>Paso 4.</strong>- Seleccione el tipo de reserva"), 
                                                             choices = c("PDP"='PDP',
                                                                         "PRBP"='PRBP',
                                                                         "PSP"='PSP'),
                                                             checkIcon = list(yes = icon("check")),
                                                             select='PDP' ,
                                                             justified = TRUE
                                                              
                                           )),
                                       tags$script("$(\"input:radio[name='id_tipo_reserva1'][value='PDP']\").parent().css('background-color', '#FF5F00');"),
                                       tags$script("$(\"input:radio[name='id_tipo_reserva1'][value='PRBP']\").parent().css('background-color', '#808080');"),
                                       tags$script("$(\"input:radio[name='id_tipo_reserva1'][value='PSP']\").parent().css('background-color', '#808080');"),
                                       
                                ),
                                
                                
                                
                                column(12,
                                       shiny::hr(),
                                       div(title="",
                                           p(tags$b(" Paso 5. Selecciones el tipo de Brent a sensibilizar."))),
                                       
                                       
                                       div(title="", # tooltip
                                           awesomeCheckbox(inputId = "v_dist_brent_vpn_p", label = "Brent", value = FALSE,status="success")),
                                       
                                       tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: green}")),
                                       
                                       
                                       conditionalPanel(condition = "input.v_dist_brent_vpn_p == true",
                                                        sliderInput(inputId ="id_brent1",label = strong(""), 40,100,50,step=10),
                                                        HTML("")
                                                        
                                       )
                                       
                                       
                                ),
                                
                                
                                column(12,
                                       shiny::hr(),
                                       div(title="", # tooltip
                                           style = "margin-top: 10px; margin-bottom: 20px;",
                                           radioGroupButtons("id_FC1",
                                                             label= HTML("<strong>Paso 6.</strong>- Seleccione qu&eacute analisis desea explorar."),
                                                             choices = c("Distibucion Opex"='D_opex',
                                                                         "FC en Tiempo"='fc_t',
                                                                         "FC Descontado"='fc_d'),
                                                             checkIcon = list(yes = icon("check")),
                                                             select='fc_t' ,
                                                             justified = TRUE
                                           )),
                                       
                                       tags$script("$(\"input:radio[name='id_FC1'][value='D_opex']\").parent().css('background-color', '#F7DB17');"),
                                       tags$script("$(\"input:radio[name='id_FC1'][value='fc_t']\").parent().css('background-color', '#CCD32A');"),
                                       tags$script("$(\"input:radio[name='id_FC1'][value='fc_d']\").parent().css('background-color', '#004236');"),
                                       
                                ),
                                
                                column(12,
                                       shiny::hr(),
                                       div(title="", # tooltip
                                           style = "margin-top: 10px; margin-bottom: 20px;",
                                           radioGroupButtons("id_socio1",
                                                             label= HTML("<strong>Paso 7.</strong>- Seleccione el tipo a evaluar."),
                                                             choices = c("Sin Socio"='sin_Socio',
                                                                         "Con socio"='con_socio'),
                                                             checkIcon = list(yes = icon("check")),
                                                             select='con_socio' ,
                                                             justified = TRUE
                                           )),
                                       
                                       tags$script("$(\"input:radio[name='id_socio1'][value='sin_Socio']\").parent().css('background-color', '#F7DB17');"),
                                       tags$script("$(\"input:radio[name='id_socio1'][value='con_socio']\").parent().css('background-color', '#CCD32A');"),
                                       
                                ),

                   ),
                   mainPanel(width = 8, #Main panel
                             bsModal("mod_defs_pozo", HTML("Definici&oacuten"), "defs_pozo", htmlOutput('defs_text_pozo')),
                             fluidRow(
                               column(3,infoBoxOutput("users_vpn1p",width = 12)),
                               column(3,infoBoxOutput("users_vpn2p",width = 12)),
                               column(3,infoBoxOutput("users_vpn3p",width = 12))
                             ),
                             h4(textOutput("title_well"), style="color: black; text-align: left"),
                             h5(textOutput("subtitle_Well"), style="color: black; text-align: left"),
                             withSpinner(plotlyOutput("vpn_pozo_basica")),
                             conditionalPanel(condition = "input.v_dist_pozo == false",
                                              
                                              column(12, align="center", #legend
                                                     style= "padding-bottom: 40px;",
                                                     p(column(1),
                                                       column(2, img(src="quintile1.png", height = "16px"), "1 - VPN Positivo"), 
                                                       column(1, img(src="quintile2.png", height = "16px"), "2 - VPN Negativo"),
                                                       column(1)))
                             ),
                             
                             DT::dataTableOutput("table_vpn_t_p")
                             
                   )
)
