

bd_total_port <- reactive({ 
  
  if (input$id_total_general_campo == 1){
    
    bd_total_raw <-rawdata_total  %>%
      filter(tipo_costo == input$id_tipo_costo_total,
             P_D == input$id_PD_total,
             E_Brent == input$id_brent_total) %>%
      select(D_Basic, D_wo, D_nw, campo,ends_with("_port")) %>%
      unique() 
    
    
    
  } else { 
    
    
    bd_total_raw <- rawdata_total  %>%
      filter(tipo_costo == input$id_tipo_costo_total,
             P_D == input$id_PD_total,
             E_Brent ==input$id_brent_total) %>%
      select(D_Basic, D_wo, D_nw, campo,ends_with("_port")) %>%
      filter(campo == input$id_total_campo ) %>%
      unique() 
    
    
  }
  
  
  
})


output$box_total_vpn <- renderInfoBox({ 
  
  bd_total <- bd_total_port()  %>%
    group_by(D_Basic, D_wo, D_nw) %>%
    summarise_if(is.numeric, sum , na.rm = TRUE)
  
  
  bd_eco <- bd_total %>% 
    filter(D_Basic ==input$id_basic_,
           D_wo  == input$id_wo_,
           D_nw == input$id_nw_) %>%
    ungroup() 
  
  c=round(as.numeric(bd_eco$VPN_Total_port / 1000),2)
  

  infoBox(
    title = "VPN Total",
    value = c,
    subtitle = "MUSD",
    icon = icon("dollar-sign"),
    color ="yellow"
  )
  
  
})

output$box_total_opex <- renderInfoBox({ 
  
  
  bd_total <- bd_total_port()  %>%
    group_by(D_Basic, D_wo, D_nw) %>%
    summarise_if(is.numeric, sum , na.rm = TRUE)
  
  
  bd_eco <- bd_total %>% 
    filter(D_Basic ==input$id_basic_,
           D_wo  == input$id_wo_,
           D_nw == input$id_nw_) %>%
    ungroup() 
  
  c=round(as.numeric(bd_eco$opex_ing_b_port / 1000),2)
  

  
  infoBox(
    title = "Opex",
    value = c,
    subtitle = "MUSD",
    icon = icon("dollar-sign"),
    color ="green"
  )
  
  
  
})

output$box_total_vol <- renderInfoBox({ 
  
  bd_total <- bd_total_port()  %>%
    group_by(D_Basic, D_wo, D_nw) %>%
    summarise_if(is.numeric, sum , na.rm = TRUE)
  
  
  bd_eco <- bd_total %>% 
    filter(D_Basic ==input$id_basic_,
           D_wo  == input$id_wo_,
           D_nw == input$id_nw_) %>%
    ungroup() 
  
  c=round(as.numeric(bd_eco$volumen_T_LE_port),2)
  
  
  infoBox(
    title = "Volumen Total LE",
    value = c,
    subtitle = "MBls",
    icon = icon("oil-can"),
    color ="black"
  )
  
  
})



output$plot_total_vpn <- renderPlotly({
  
  bd_total <- bd_total_port()  %>%
    group_by(D_Basic, D_wo, D_nw) %>%
    summarise_if(is.numeric, sum , na.rm = TRUE)
  
  bd_eco <- bd_total %>% 
    filter(D_Basic ==input$id_basic_,
           D_wo  == input$id_wo_,
           D_nw == input$id_nw_) %>%
    ungroup() %>%
    select(ingreso_ing_b_port, opex_ing_b_port, capex_ing_b_port, impuesto_ing_b_port,abandono_ing_b_port, VPN_Total_port) %>%
    dplyr::summarise('1-Ingreso' = ingreso_ing_b_port / 1000,
                     '2-Opex' = -1 * opex_ing_b_port / 1000,
                     '3-Capex' = -1 * capex_ing_b_port / 1000,
                     '4-Impuesto' = -1 * impuesto_ing_b_port / 1000,
                     '5-abandono' = -1 * abandono_ing_b_port / 1000, 
                     '6-VPN' = VPN_Total_port / 1000) %>%
    tidyr::gather(variable,Valor_MUSD)
  
  
  measure= c("relative", "relative","relative","relative","relative","total")
  
  
  data = data.frame(bd_eco,measure)
  
  
  data %>%
    plot_ly( name = "P50", type = "waterfall",
             measure = ~measure,
             x = ~variable, textposition = "outside", y= ~Valor_MUSD,
             text =~round(Valor_MUSD,1),
             connector = list(line = list(color= "rgb(63, 63, 63)"))) %>%
    layout(title = "Flujo de Caja Descontada",
           xaxis = list(title = ""),
           yaxis = list(title = "VPN (MUSD)"),
           autosize = TRUE,
           showlegend = TRUE)
  
  
  
})












