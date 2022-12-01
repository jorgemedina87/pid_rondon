Well_Basic_WO_NW <- tabItem(tabName = "Well_Basic_WO_NW",
                      
                            sidebarPanel(width=4,
                                         column(12,
                                                shiny::hr(),
                                                div(title="", # tooltip
                                                    style = "margin-top: 10px; margin-bottom: 20px;",
                                                    radioGroupButtons("id_tipo_campo_NW",
                                                                      label= HTML("<strong>Paso 1.</strong>- Seleccione el tipo de Campo de interes"),
                                                                      choices = c("RONDON"='CANO_RONDON',
                                                                                  "CARICARE"='CARICARE'),
                                                                      checkIcon = list(yes = icon("check")),
                                                                      select='CARICARE' ,
                                                                      justified = TRUE
                                                    )),
                                                
                                                tags$script("$(\"input:radio[name='id_tipo_campo_NW'][value='CANO_RONDON']\").parent().css('background-color', '#FF5F00');"),
                                                tags$script("$(\"input:radio[name='id_tipo_campo_NW'][value='CARICARE']\").parent().css('background-color', '#808080');"),
                                                
                                                
                                         ),
                                         
                                         
                                         
                                         column(12,
                                                shiny::hr(),
                                                div(title="",
                                                    p(tags$b(" Paso 2. Selecciones el tipo de pozo analizar"))),
                                                
                                                
                                                div(title="", # tooltip
                                                    awesomeCheckbox(inputId = "v_dist_pozo3", label = "Pozo", value = FALSE,status="success")),
                                                
                                                conditionalPanel(condition = "input.v_dist_pozo3 == true",
                                                                 selectInput(inputId = "tipo_well_NW", label = strong(""),
                                                                             choices = "",
                                                                             selected = "")
                                                                 
                                                )
                                                
                                                
                                         ),
                                         
                                         column(12,
                                                shiny::hr(),
                                                div(title="",
                                                    p(tags$b(" Paso 3. Selecciones el tipo de Brent a sensibilizar."))),
                                                
                                                
                                                div(title="", # tooltip
                                                    awesomeCheckbox(inputId = "v_dist_brent_vpn_p_nw", label = "Brent", value = FALSE,status="success")),
                                                
                                                tags$style(HTML(".js-irs-1 .irs-single, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: green}")),
                                                
                                                
                                                conditionalPanel(condition = "input.v_dist_brent_vpn_p_nw == true",
                                                                 sliderInput(inputId ="id_brent3",label = strong(""), 40,100,50,step=10),
                                                                 HTML("")
                                                                 
                                                )
                                                
                                                
                                         ),
                                         
                                         column(12,
                                                shiny::hr(),
                                                div(title="",
                                                    p(tags$b(" Paso 4. Selecciones el tipo de PD."))),
                                                
                                                
                                                div(title="", # tooltip
                                                    awesomeCheckbox(inputId = "v_dist_PD_vpn_p_nw", label = "PD", value = FALSE,status="success")),
                                                
                                                tags$style(HTML(".js-irs-1 .irs-single,.js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar-edge, .js-irs-1 .irs-bar {background: green}")),
                                                
                                                
                                                conditionalPanel(condition = "input.v_dist_PD_vpn_p_nw == true",
                                                                 sliderInput(inputId ="id_PD3",label = strong(""), 0.0,0.3,0.1,step=0.1),
                                                                 HTML("")
                                                                 
                                                )
                                                
                                                
                                         ),
                                         column(12,
                                                shiny::hr(),
                                                div(title="", # tooltip
                                                    style = "margin-top: 10px; margin-bottom: 20px;",
                                                    radioGroupButtons("id_FC3",
                                                                      label= HTML("<strong>Paso 5.</strong>- Seleccione qu&eacute analisis desea explorar."),
                                                                      choices = c("Distibucion Opex"='D_opex',
                                                                                  "FC en Tiempo"='fc_t',
                                                                                  "FC Descontado"='fc_d'),
                                                                      checkIcon = list(yes = icon("check")),
                                                                      select='fc_t' ,
                                                                      justified = TRUE
                                                    )),
                                                
                                                tags$script("$(\"input:radio[name='id_FC3'][value='D_opex']\").parent().css('background-color', '#F7DB17');"),
                                                tags$script("$(\"input:radio[name='id_FC3'][value='fc_t']\").parent().css('background-color', '#CCD32A');"),
                                                tags$script("$(\"input:radio[name='id_FC3'][value='fc_d']\").parent().css('background-color', '#004236');"),
                                                
                                         ),
                                         
                                         column(12,
                                                shiny::hr(),
                                                div(title="", # tooltip
                                                    style = "margin-top: 10px; margin-bottom: 20px;",
                                                    radioGroupButtons("id_socio3",
                                                                      label= HTML("<strong>Paso 6.</strong>- Seleccione el tipo a evaluar."),
                                                                      choices = c("Sin Socio"='sin_Socio',
                                                                                  "Con socio"='con_socio'),
                                                                      checkIcon = list(yes = icon("check")),
                                                                      select='con_socio' ,
                                                                      justified = TRUE
                                                    )),
                                                
                                                tags$script("$(\"input:radio[name='id_socio3'][value='sin_Socio']\").parent().css('background-color', '#F7DB17');"),
                                                tags$script("$(\"input:radio[name='id_socio3'][value='con_socio']\").parent().css('background-color', '#CCD32A');"),
                                                
                                         ),
                                         
                                         column(12,
                                                shiny::hr(),
                                                div(title="", # tooltip
                                                    style = "margin-top: 10px; margin-bottom: 20px;", 
                                                    radioGroupButtons("id_tipo_costo_nw", 
                                                                      label= HTML("<strong>Paso 7.</strong>- Seleccione el tipo de Costo de interes"), 
                                                                      choices = c("Pesimista"='pesimista',
                                                                                  "Probable"='probable',
                                                                                  "Optimista"='optimista'),
                                                                      checkIcon = list(yes = icon("check")),
                                                                      select='optimista' ,
                                                                      justified = TRUE
                                                    )),
                                                
                                                
                                                
                                                tags$script("$(\"input:radio[name='id_tipo_costo_nw'][value='pesimista']\").parent().css('background-color', '#FF5F00');"),
                                                tags$script("$(\"input:radio[name='id_tipo_costo_nw'][value='probable']\").parent().css('background-color', '#808080');"),
                                                tags$script("$(\"input:radio[name='id_tipo_costo_nw'][value='optimista']\").parent().css('background-color', '#808080');"),
                                                
                                         ),
                            ),
                            mainPanel(width = 8,
                                      fluidRow(
                                        column(3,infoBoxOutput("users_well1_nw",width = 12)),
                                        column(3,infoBoxOutput("users_well2_nw",width = 12)),
                                        column(3,infoBoxOutput("users_well3_nw",width = 12))
                                      ),
                                      h4(textOutput("title_well_nw"), style="color: black; text-align: left"),
                                      h5(textOutput("subtitle_Well_nw"), style="color: black; text-align: left"),
                                      withSpinner(plotlyOutput("vpn_pozo_nw")),
                                      
                                      conditionalPanel(condition = "input.v_dist_pozo3 == false",
                                                       
                                                       column(12, align="center", #legend
                                                              style= "padding-bottom: 40px;",
                                                              p(column(1),
                                                                column(2, img(src="quintile1.png", height = "16px"), "1 - VPN Positivo"), 
                                                                column(1, img(src="quintile2.png", height = "16px"), "2 - VPN Negativo"),
                                                                column(1)))
                                      ),
                                      
                                      DT::dataTableOutput("table_well_nw")
                                      
                            )
)
