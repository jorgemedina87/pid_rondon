tab_wo_inc_analysis <- tabItem(tabName = "tab_wo_inc_analysis",
                               br(),
                               h4("Analysis of WOs"),
                               br(),
                               sidebarLayout(sidebarPanel(width = 3,
                                                          selectInput("ref_area", "Area", choices = c("B STAGE 1", "CIRA SOUTH", "CIRA NORTH", "CIRA EAST",
                                                                           "INFANTAS NORTH", "INFANTAS CENTRAL", "INFANTAS SOUTH"), selected = "INFANTAS NORTH"),
                                                          selectInput("id_inj_prod", "Type of well", choices = c('INJ_H2O', 'PROD_OIL')),
                                                          selectInput("ref_well", "Well", choices = "...", selected = NULL, multiple = FALSE),
                                                          br(),
                                                          br(),
                                                          tableOutput("table_summary_WO"), 
                                                          br(), br(), br(), br(),
                                                          br(), br(), br(), br(),
                                                          br(), br(), br(), br(),
                                                          br(), br(), br()),
                                             
                                             mainPanel(width = 9,
                                                       fluidRow(
                                                         column(width = 8,
                                                                box(title = "Decline and Production Oil", width = 12,
                                                                    plotOutput("plot_dec_pp", height = "800px")),
                                                                box(title = "Production / Injection", width = 12,
                                                                    plotOutput("plot_producers", height = "600px"))),
                                                         column(width = 4,
                                                                box(title = "Incremental production", width = 12,
                                                                    plotOutput("plot_inc_pp", height = "400px")),
                                                                box(title = "Cumulative Incremental production", width = 12,
                                                                    plotOutput("plot_cum_pp", height = "400px")))
                                                       )
                                             )
                               )
                               )
                               
                         