

observe({
  
  if(input$v_perf_campo_v== FALSE){
    
    list_v <-0
    
    
  }else if (input$activo_perfil==2 & input$v_perf_campo_v== TRUE) {
    
    list_v<-bd_perfil_pozo_v %>%
      filter(activo==input$id_perf_activo)%>%
      select(campo)%>%
      unique()
    
  }else {
    
    list_v<-bd_perfil_pozo_v %>%
      select(campo)%>%
      unique()
    
    
    
  }
  updateSelectInput(session, "perf_campo_v", choices =list_v)
  
  
}) 




################# 

observe({
  
  
  if(input$v_perf_trabajo_v== FALSE){
    
    list_v2 <-0
    
  }else if (input$activo_perfil==2 & input$v_perf_trabajo_v== TRUE) {
    
    list_v2<-bd_perfil_pozo_v %>%
      filter(activo==input$id_perf_activo)%>%
      select(Trabajo)%>%
      unique()
    
  }else {
    
    list_v2<-bd_perfil_pozo_v %>%
      select(Trabajo)%>%
      unique()
    
  }
  
  updateSelectInput(session, "perf_trabajo_v", choices =list_v2)
  
  
  
}) 




observe({
  
  
  if(input$v_perf_pozo_v== FALSE){
    
    list_v3 <-0
    
    
    
  }else if (input$activo_perfil==2 & input$v_perf_campo_v== TRUE &
            input$v_perf_trabajo_v== TRUE & input$v_perf_pozo_v== TRUE) {
    
    list_v3<-bd_perfil_pozo_v %>%
      filter(activo==input$id_perf_activo)%>%
      filter(campo %in% input$perf_campo_v)%>%
      filter(Trabajo %in% input$perf_trabajo_v)%>%
      select(pozo)%>%
      unique()
    
  }else {
    
    list_v3<-bd_perfil_pozo_v %>%
      select(pozo)%>%
      unique()
    
    
  }
  
  updateSelectInput(session, "perf_pozo_v", choices =list_v3)
  
  
  
  
  
}) 

###################solo graficos 


perf_data <- reactive({ 
  
  BD <- bd_perfil_pozo_v
  ###################################################################################### Filtro General, Cosecha, Rondo
  if (input$activo_perfil==2){
    BD <- BD %>% filter(activo==input$id_perf_activo) 
  }else {}
  ###################################################################################### Filtro Campo
  ifelse(input$v_perf_campo_v== TRUE,BD <- BD %>% filter(campo %in% input$perf_campo_v) ,BD <- BD)
  ###################################################################################### Filtro Tipo
  ###################################################################################### Filtro General, Basico, Incremental
  if (input$tipo_perfil==2){
    BD <- BD %>% filter(Tipo == 'Basica')
  }else if (input$tipo_perfil==3){
    BD <- BD %>% filter(Tipo == 'Incremental')
  }else{BD <- BD}
  ###################################################################################### Filtro Trabajo
  ifelse(input$v_perf_trabajo_v== TRUE,BD <- BD %>% filter(Trabajo %in% input$perf_trabajo_v) ,BD <- BD)
  ###################################################################################### Filtro Pozo
  ifelse(input$v_perf_pozo_v== TRUE,BD <- BD %>% filter(pozo %in% input$perf_pozo_v) ,BD <- BD)
  ###################################################################################### Filtro Clasificacion
  ifelse(input$clasificacion_perf_v== 'General', BD <- BD, BD <- BD %>% filter(clasificacion==input$clasificacion_perf_v))
  
  BD <- BD %>%
    select(Date,input$id_perf,Tipo)%>%
    group_by(Date,Tipo)%>%
    dplyr::rename(sum_p=input$id_perf) %>%
    summarise(sum_=sum(sum_p))
  
  
  
  
  
  
})
#####################.
#Plot 

plot_perf_chart <- function() {
  
  
  fig <-plot_ly(perf_data(),x=~Date, y=~sum_, color=~Tipo,
                type='scatter', mode='none', 
                stackgroup='one') 
  
  
  if (input$id_perf=='Oil'){
    fig %>%
      layout(title = paste('Perfil de','Oil'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "BOPD",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='Water'){
    
    fig %>%
      layout(title = paste('Perfil de','Agua'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "BWPD",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='gas'){
    
    
    fig %>%
      layout(title = paste('Perfil de','Gas'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "KPSD",
                          showgrid = FALSE))
    
  }  
  
  
  
  
  
}
#### grafica de bi

output$perf_plot_2 <- renderPlotly({ plot_perf_chart() }) 


######################


perf_data1 <- reactive({ 
  
  BD <- bd_perfil_pozo_v
  ###################################################################################### Filtro General, Cosecha, Rondo
  if (input$activo_perfil==2){
    BD <- BD %>% filter(activo==input$id_perf_activo) 
  }else {}
  ###################################################################################### Filtro Campo
  ifelse(input$v_perf_campo_v== TRUE,BD <- BD %>% filter(campo %in% input$perf_campo_v) ,BD <- BD)
  ###################################################################################### Filtro Tipo
  ###################################################################################### Filtro General, Basico, Incremental
  if (input$tipo_perfil==2){
    BD <- BD %>% filter(Tipo == 'Basica')
  }else if (input$tipo_perfil==3){
    BD <- BD %>% filter(Tipo == 'Incremental')
  }else{BD <- BD}
  ###################################################################################### Filtro Trabajo
  ifelse(input$v_perf_trabajo_v== TRUE,BD <- BD %>% filter(Trabajo %in% input$perf_trabajo_v) ,BD <- BD)
  ###################################################################################### Filtro Pozo
  ifelse(input$v_perf_pozo_v== TRUE,BD <- BD %>% filter(pozo %in% input$perf_pozo_v) ,BD <- BD)
  ###################################################################################### Filtro Clasificacion
  ifelse(input$clasificacion_perf_v== 'General', BD <- BD, BD <- BD %>% filter(clasificacion==input$clasificacion_perf_v))
  
  BD <- BD %>%
    select(Date,input$id_perf,Categoria)%>%
    group_by(Date,Categoria)%>%
    dplyr::rename(sum_p=input$id_perf) %>%
    summarise(sum_=sum(sum_p))
})
#####################.
#Plot 

plot_perf_chart1 <- function() {
  
  
  fig <-plot_ly(perf_data1(),x=~Date, y=~sum_, color=~Categoria,
                type='scatter', mode='none', 
                stackgroup='one') 
  
  
  if (input$id_perf=='Oil'){
    fig %>%
      layout(title = paste('Perfil de','Oil'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "BOPD",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='Water'){
    
    fig %>%
      layout(title = paste('Perfil de','Agua'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "BWPD",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='gas'){
    
    
    fig %>%
      layout(title = paste('Perfil de','Gas'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "KPSD",
                          showgrid = FALSE))
    
  }  
  
  
  
  
  
}
#### grafica de bi

output$perf_plot <- renderPlotly({ plot_perf_chart1() }) 

#########################
perf_data2 <- reactive({
  
  BD <- bd_perfil_pozo_v
  ###################################################################################### Filtro General, Cosecha, Rondo
  if (input$activo_perfil==2){
    BD <- BD %>% filter(activo==input$id_perf_activo) 
  }else {}
  ###################################################################################### Filtro Campo
  ifelse(input$v_perf_campo_v== TRUE,BD <- BD %>% filter(campo %in% input$perf_campo_v) ,BD <- BD)
  ###################################################################################### Filtro Tipo
  ###################################################################################### Filtro General, Basico, Incremental
  if (input$tipo_perfil==2){
    BD <- BD %>% filter(Tipo == 'Basica')
  }else if (input$tipo_perfil==3){
    BD <- BD %>% filter(Tipo == 'Incremental')
  }else{BD <- BD}
  ###################################################################################### Filtro Trabajo
  ifelse(input$v_perf_trabajo_v== TRUE,BD <- BD %>% filter(Trabajo %in% input$perf_trabajo_v) ,BD <- BD)
  ###################################################################################### Filtro Pozo
  ifelse(input$v_perf_pozo_v== TRUE,BD <- BD %>% filter(pozo %in% input$perf_pozo_v) ,BD <- BD)
  ###################################################################################### Filtro Clasificacion
  ifelse(input$clasificacion_perf_v== 'General', BD <- BD, BD <- BD %>% filter(clasificacion==input$clasificacion_perf_v))
  
  BD <- BD %>%
    select(Date,input$id_perf,campo)%>%
    group_by(Date,campo)%>%
    dplyr::rename(sum_p=input$id_perf) %>%
    summarise(sum_=sum(sum_p))
  
  
  
  
  
  
})
#####################.
#Plot 

plot_perf_chart2 <- function() {
  
  
  fig <-plot_ly(perf_data2(),x=~Date, y=~sum_, color=~campo,
                type='scatter', mode='none', 
                stackgroup='one') 
  
  
  if (input$id_perf=='Oil'){
    fig %>%
      layout(title = paste('Perfil de','Oil'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "BOPD",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='Water'){
    
    fig %>%
      layout(title = paste('Perfil de','Agua'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "BWPD",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='gas'){
    
    
    fig %>%
      layout(title = paste('Perfil de','Gas'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "KPSD",
                          showgrid = FALSE))
    
  }  
  
  
  
  
  
}
#### grafica de bi

output$perf_plot_b <- renderPlotly({ plot_perf_chart2() }) 

###########GRAFICA HISTOGRAMA
################ histograma
perf_data3 <- reactive({ 
  
  options(dplyr.summarise.inform = FALSE)
  BD <- bd_perfil_pozo_v 
  ###################################################################################### Filtro General, Cosecha, Rondo
  if (input$activo_perfil==2){
    BD <- BD %>% filter(activo==input$id_perf_activo) 
  }else {}
  ###################################################################################### Filtro Campo
  ifelse(input$v_perf_campo_v== TRUE,BD <- BD %>% filter(campo %in% input$perf_campo_v) ,BD <- BD)
  ###################################################################################### Filtro Trabajo
  ifelse(input$v_perf_trabajo_v== TRUE,BD <- BD %>% filter(Trabajo %in% input$perf_trabajo_v) ,BD <- BD)
  ###################################################################################### Filtro Pozo
  ifelse(input$v_perf_pozo_v== TRUE,BD <- BD %>% filter(pozo %in% input$perf_pozo_v) ,BD <- BD)
  ###################################################################################### Filtro Clasificacion
  ifelse(input$clasificacion_perf_v== 'General', BD <- BD, BD <- BD %>% filter(clasificacion==input$clasificacion_perf_v))
  ###################################################################################### 
  BD <- BD %>% group_by(Tipo, campo)
  ###################################################################################### Filtro Gas, Agua, Aceite
  if (input$id_perf=='gas'){BD <- BD %>% summarise(Suma_vol=round(sum(Vol_gas),3))
  }else if (input$id_perf=='Water'){BD <- BD %>% summarise(Suma_vol=round(sum(vol_agua),3))
  }else{BD <- BD %>% summarise(Suma_vol=round(sum(Vol),3))}
  ###################################################################################### Modificacion BD
  BD <- BD %>%  
    bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(., na.rm = TRUE) else "Total")))
  ###################################################################################### Filtro General, Basico, Incremental
  if (input$tipo_perfil==2){
    BD <- BD %>% filter(Tipo == 'Basica')
  }else if (input$tipo_perfil==3){
    BD <- BD %>% filter(Tipo == 'Incremental')
  }else{BD <- BD}
  
  BD[BD$campo=='Total',]
})
#####################.
#Plot 

plot_perf_chart3 <- function() {
  
  
  fig <-plot_ly(perf_data3(),x=~Tipo, y=~Suma_vol, color=~Tipo,
                type='bar', mode='none', 
                stackgroup='one') 
  
  
  if (input$id_perf=='Oil'){
    fig %>%
      layout(title = paste('Perfil de','Oil'),
             xaxis = list(title = "TIPO",
                          showgrid = FALSE),
             yaxis = list(title = "VOL",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='Water'){
    
    fig %>%
      layout(title = paste('Perfil de','Agua'),
             xaxis = list(title = "TIPO",
                          showgrid = FALSE),
             yaxis = list(title = "VOL",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='gas'){
    
    
    fig %>%
      layout(title = paste('Perfil de','Gas'),
             xaxis = list(title = "TIPO",
                          showgrid = FALSE),
             yaxis = list(title = "VOL",
                          showgrid = FALSE))
    
  }  
  
  
  
  
  
}
#### grafica de bi

output$perf_plot_b3 <- renderPlotly({ plot_perf_chart3() }) 


####salida Tabla

table_data <- reactive({ 
  options(dplyr.summarise.inform = FALSE)
  BD <- bd_perfil_pozo_v 
  ###################################################################################### Filtro General, Cosecha, Rondo
  if (input$activo_perfil==2){
    BD <- BD %>% filter(activo==input$id_perf_activo) 
  }else {}
  ###################################################################################### Filtro Campo
  ifelse(input$v_perf_campo_v== TRUE,BD <- BD %>% filter(campo %in% input$perf_campo_v) ,BD <- BD)
  ###################################################################################### Filtro Trabajo
  ifelse(input$v_perf_trabajo_v== TRUE,BD <- BD %>% filter(Trabajo %in% input$perf_trabajo_v) ,BD <- BD)
  ###################################################################################### Filtro Pozo
  ifelse(input$v_perf_pozo_v== TRUE,BD <- BD %>% filter(pozo %in% input$perf_pozo_v) ,BD <- BD)
  ###################################################################################### Filtro Clasificacion
  ifelse(input$clasificacion_perf_v== 'General', BD <- BD, BD <- BD %>% filter(clasificacion==input$clasificacion_perf_v))
  ###################################################################################### 
  BD <- BD %>% group_by(Tipo, campo)
  ###################################################################################### Filtro Gas, Agua, Aceite
  if (input$id_perf=='gas'){BD <- BD %>% summarise(Suma_vol=round(sum(Vol_gas),3))
  }else if (input$id_perf=='Water'){BD <- BD %>% summarise(Suma_vol=round(sum(vol_agua),3))
  }else{BD <- BD %>% summarise(Suma_vol=round(sum(Vol),3))}
  ###################################################################################### Modificacion BD
  BD <- BD %>% spread(Tipo, Suma_vol) %>%  
    bind_rows(summarise_all(., funs(if(is.numeric(.)) sum(., na.rm = TRUE) else "Total")))
  ###################################################################################### Filtro General, Basico, Incremental
  if (input$tipo_perfil==2){
    BD <- BD %>% select(campo, Basica)
  }else if (input$tipo_perfil==3){
    BD <- BD %>% select(campo, Incremental)
  }else{BD <- BD}
})

####
output$table_1<- renderTable({ head( table_data(), n = 11)},  
                            striped = TRUE, bordered = TRUE,  
                            hover = TRUE, spacing = 'xs')  

#output$table = renderDT(
#  table_data(), options = list(lengthChange = FALSE)
#)

