tab_perfil <- tabItem(tabName = "tab_perfil",
                      sidebarPanel(width=4,
                                  column(12,
                                          div(title="Select what aspect of inequality you want to explore.", # tooltip
                                              style = "margin-top: 10px; margin-bottom: 20px;", 
                                              radioGroupButtons("id_perf", 
                                                                label= shiny::HTML("Paso 1.- Seleccione qu&eacute analisis desea explorar.<br/><br/>"), 
                                                                choices = c("Aceite"='Oil',
                                                                            "Agua"='Water',
                                                                            "Gas"='gas'),
                                                                checkIcon = list(yes = icon("check")),
                                                                select='Oil' ,
                                                                justified = TRUE
                                              )),
                                          
                                          
                                          tags$script("$(\"input:radio[name='id_perf'][value='Oil']\").parent().css('background-color', '#F7DB17');"),
                                          tags$script("$(\"input:radio[name='id_perf'][value='Water']\").parent().css('background-color', '#CCD32A');"),
                                          tags$script("$(\"input:radio[name='id_perf'][value='gas']\").parent().css('background-color', '#004236');"),
                                          
                                   ),
                                   
                                   div(title="",
                                       awesomeRadio("activo_perfil", label =shiny::HTML("Paso 2. Selecciones el tipo de analisis:<br/><br/>"), #br required to try and keep alignment across columns
                                                    choices = list("General"= 1, "Activo" = 2), 
                                                    selected = 1, inline=TRUE, checkbox=TRUE, status="success")),
                                   
                                   conditionalPanel(condition = "input.activo_perfil == 2 ", 
                                                    div(title="", # tooltip
                                                        style = "margin-top: 10px; margin-bottom: 20px;", 
                                                        radioGroupButtons("id_perf_activo", 
                                                                          label= HTML("Paso 2a.- Seleccione el campo de interes"), 
                                                                          choices = c("COSECHA"='COSECHA',
                                                                                      "RONDON"='RONDON'), #campo cambiado CANO_RONDO
                                                                          checkIcon = list(yes = icon("check")),
                                                                          select='RONDON' ,
                                                                          justified = TRUE
                                                        )),
                                                    
                                                    tags$script("$(\"input:radio[name='id_perf_activo'][value='COSECHA']\").parent().css('background-color', '#FF5F00');"),
                                                    tags$script("$(\"input:radio[name='id_perf_activo'][value='RONDON']\").parent().css('background-color', '#808080');")
                                   ),
                                   
                                   div(title="",
                                       awesomeRadio("tipo_perfil", label =shiny::HTML("Paso 3. Selecciones el tipo de analisis:<br/><br/>"), #br required to try and keep alignment across columns
                                                    choices = list("General"=1, "Basica"= 2, "Incremental" = 3), 
                                                    selected = 1, inline=TRUE, checkbox=TRUE, status="success")),
                                   
                                   column(12,
                                          shiny::hr(),
                                          shiny::HTML("Paso 4. Selecciones el tipo de campo analizar:<br/><br/>"),
                                          
                                          div(title="", # tooltip
                                              awesomeCheckbox(inputId = "v_perf_campo_v", label = "Campo", value = FALSE, status="success")),
                                          
                                          conditionalPanel(condition = "input.v_perf_campo_v == true",
                                                           selectInput(inputId = "perf_campo_v", label = strong(""),
                                                                       choices = "",
                                                                       selected = "",
                                                                       multiple = TRUE)
                                                           
                                                           
                                                           
                                          )
                                          
                                          
                                   ),
                                   
                                   column(12,
                                          shiny::hr(),
                                          shiny::HTML("Paso 5. Selecciones el tipo de trabajo analizar:<br/><br/>"),
                                          
                                          
                                          div(title="", # tooltip
                                              awesomeCheckbox(inputId = "v_perf_trabajo_v", label = "Trabajo", value = FALSE,status="success")),
                                          
                                          conditionalPanel(condition = "input.v_perf_trabajo_v == true",
                                                           selectInput(inputId = "perf_trabajo_v", label = strong(""),
                                                                       choices = "",
                                                                       selected = "",
                                                                       multiple = TRUE)
                                                           
                                          )
                                          
                                          
                                   ),     
                                   
                                   
                                   
                                   
                                   column(12,
                                          shiny::hr(),
                                          shiny::HTML("Paso 6. Selecciones el tipo de pozo analizar:<br/><br/>"),
                                          
                                          
                                          div(title="", # tooltip
                                              awesomeCheckbox(inputId = "v_perf_pozo_v", label = "pozo", value = FALSE,status="success")),
                                          
                                          conditionalPanel(condition = "input.v_perf_pozo_v == true",
                                                           selectInput(inputId = "perf_pozo_v", label = strong(""),
                                                                       choices = "",
                                                                       selected = "",
                                                                       multiple = TRUE)
                                                           
                                                           
                                                           
                                          )
                                          
                                          
                                   ), 
                                   
                                   
                                   div(title="",
                                       awesomeRadio("clasificacion_perf_v", label =shiny::HTML("Paso 7. Selecciones la clasificaci&oacuten:"), #br required to try and keep alignment across columns
                                                    choices = list("General"= "General","Ampliaci&oacuten Minima"= "Ampliacion Minima", "No requerida" = "No Requerida"), 
                                                    selected = "General", inline=TRUE, checkbox=TRUE, status="success")),
                                   
                                   
                                   
        ),
        
        
        
        mainPanel(width = 8, #Main panel
                  
                  fluidRow(column(6,
                                  withSpinner(plotlyOutput("perf_plot"))),
                           column(6,
                                  withSpinner(plotlyOutput("perf_plot_b"))),
                  ),
                  
                  fluidRow(column(4,
                                  withSpinner(plotlyOutput("perf_plot_2"))),
                           column(4,
                                  withSpinner(tableOutput("table"))),
                           column(4,
                                  
                                  withSpinner(plotlyOutput("perf_plot_b3"))),
                  ),
        )
        
            
                      
)
