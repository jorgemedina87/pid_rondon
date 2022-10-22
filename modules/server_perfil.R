## perfil


observe({
  
  
  if(input$v_perf_pozo_v== FALSE){
    
    t_categoria <-0
    
  }else if (input$v_perf_pozo_v ==TRUE & input$campo_perf_v==1) { 
    
    bd_e_a <-id_campo 
    
    t_categoria <-unique(bd_e_a$well)
    
    
  }else if (input$v_perf_pozo_v ==TRUE & input$campo_perf_v==2) {
    
    bd_e_a <-id_campo %>%
      dplyr::filter(CAMPO==input$id_perf_campo)
    
    
    t_categoria <-unique(bd_e_a$well)
    
  }else {
    
    
    t_categoria <-0
    
    
    
  }
  
  
  updateSelectInput(session, "perf_well_v", choices =t_categoria)
  
  
}) 


perf_data <- reactive({ 
  
  #If no data available for that period then plot message saying data is missing
  
  if (input$v_perf_pozo_v ==FALSE & input$campo_perf_v == 1 ){
    
    db <-bd_perfil_pozo_  %>%
      dplyr::mutate(Fecha=as.Date(time))%>%
      dplyr::select(well,Fecha,CAMPO,input$id_perf)%>%
      dplyr::rename(
        sum_p=input$id_perf
      ) %>%
      group_by(Fecha) %>%
      summarise(sum_=sum(sum_p)) %>%
      mutate(Trabajo="Basica")
    
    
    
  }else if (input$v_perf_pozo_v== FALSE & input$campo_perf_v == 2){  
    
    db <-bd_perfil_pozo_  %>%
      dplyr::mutate(Fecha=as.Date(time))%>%
      dplyr::select(well,Fecha,CAMPO,input$id_perf) %>%
      dplyr::rename(
        sum_p=input$id_perf
      ) %>%
      dplyr::filter(CAMPO == input$id_perf_campo) %>%
      group_by(Fecha) %>%
      summarise(sum_=sum(sum_p)) %>%
      mutate(Trabajo=input$id_perf_campo)
    
    
  }else if (input$v_perf_pozo_v ==TRUE) {
    
    
    
    db <-bd_perfil_pozo_  %>%
      dplyr::mutate(Fecha=as.Date(time))%>%
      dplyr::select(well,Fecha,CAMPO,input$id_perf) %>%
      dplyr::filter(well %in% input$perf_well_v)%>%
      dplyr::rename(sum_p=input$id_perf) %>%
      group_by(well,CAMPO,Fecha) %>%
      summarise(sum_=sum(sum_p)) %>%
      mutate(Trabajo=paste(CAMPO,well))
    
  }
  
  
})


#####################.
#Plot 
plot_perf_chart <- function() {
  
  
  fig <-plot_ly(perf_data(),x=~Fecha, y=~sum_, color=~Trabajo,
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

# Creating plot for ui side
output$perf_plot <- renderPlotly({ plot_perf_chart() }) 



perf_data_b <- reactive({ 
  
  #If no data available for that period then plot message saying data is missing
  
  if (input$v_perf_pozo_v ==FALSE & input$campo_perf_v == 1 ){
    
    db_trabajo <-bd_perfil_pozo_  %>%
      dplyr::mutate(Fecha=as.Date(time))%>%
      dplyr::select(well,Fecha,CAMPO,input$id_perf)%>%
      dplyr::rename(
        sum_p=input$id_perf
      ) %>%
      summarise(sum_=round((sum(sum_p, na.rm = TRUE)*30.4)/1000000,2)) %>%
      mutate(Trabajo="Basica")
    
    
  }else if (input$v_perf_pozo_v== FALSE & input$campo_perf_v == 2){  
    
    db <-bd_perfil_pozo_  %>%
      dplyr::mutate(Fecha=as.Date(time))%>%
      dplyr::select(well,Fecha,CAMPO,input$id_perf) %>%
      dplyr::rename(
        sum_p=input$id_perf
      ) %>%
      dplyr::filter(CAMPO == input$id_perf_campo) %>%
      summarise(sum_=round((sum(sum_p, na.rm = TRUE)*30.4)/1000000,2)) %>%
      mutate(Trabajo=input$id_perf_campo)
    
    
  }else if (input$v_perf_pozo_v ==TRUE) {
    
    
    
    db <-bd_perfil_pozo_  %>%
      dplyr::mutate(Fecha=as.Date(time))%>%
      dplyr::select(well,Fecha,CAMPO,input$id_perf) %>%
      dplyr::filter(well %in% input$perf_well_v)%>%
      dplyr::rename(sum_p=input$id_perf) %>%
      group_by(well,CAMPO) %>%
      summarise(sum_=round((sum(sum_p, na.rm = TRUE)*30.4)/1000000,2)) %>%
      mutate(Trabajo=paste(CAMPO,well))
    
  }
  
  
})


plot_perf_chart_b <- function() {
  
  
  
  fig <-plot_ly(perf_data_b(),x=~Trabajo, y=~sum_, color=~Trabajo,
                type = 'bar') 
  
  
  if (input$id_perf=='Oil'){
    fig %>%
      layout(title = paste('Perfil de','Oil'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "MBls",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='Water'){
    
    fig %>%
      layout(title = paste('Perfil de','Agua'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "MBls",
                          showgrid = FALSE))
    
  }else if (input$id_perf=='gas'){
    
    
    fig %>%
      layout(title = paste('Perfil de','Gas'),
             xaxis = list(title = "DATE",
                          showgrid = FALSE),
             yaxis = list(title = "MBls",
                          showgrid = FALSE))
    
  }  
  
  
  
}


# Creating plot for ui side
output$perf_plot_b <- renderPlotly({ plot_perf_chart_b() }) 



##END