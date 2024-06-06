server <- function(input, output, session) {
  
  
  ## ======================================================
  ##                  About page table                 ----
  ## ====================================================== 
  # Render the data table with a search bar
  output$speciesTable <- renderDataTable({
    meta_df}, 
    
    options = list(
      searching = TRUE,
      lengthChange = FALSE,
      pageLength = 10)
  )
  
  # Render the leaflet proxy map 
  # output$map_output <- renderLeaflet({
  #   map
  # })
  # 
  # m <- leafletProxy("map", session)
  
  ## ======================================================
  ##                   Map by Species Code             ----
  ## ======================================================  
  observeEvent(input$sp_code_input, {
    
    output$map_output <- renderLeaflet({
      validate(need(input$sp_code_input, 'Select a species to begin'))
      
      # select raster
      rast <- code_rast_list[[input$sp_code_input]]
      
      if(input$sp_code_input %in% all_neg_code){
        leaflet() %>% 
          addTiles() %>%
          addRasterImage( x  = rast, colors = c("#8c2f0e","#E7844C", "#F0B28F"),
                         opacity = input$map_transparency_input, project = TRUE) %>% 
          addLegend(colors = c("#8c2f0e", "#E7844C", "#F0b28F"),
                    labels = c("High", "Moderate", "Low"),
                    values = values(rast),
                    title = "Drought Sensitivity")
      } else {
        leaflet() %>% 
          addTiles() %>%
          addRasterImage( x = rast, colors = c("#8C2F0E", "#E7844C", "#F0B28F", "#144D6F"), 
                         opacity = input$map_transparency_input, project = TRUE) %>% 
          addLegend(colors = c("#8c2f0e", "#E7844C", "#F0b28F", "#144D6F"),
                    labels = c("High", "Moderate", "Low", "Least Concern"),
                    values = values(rast),
                    title = "Drought Sensitivity")
      }
      
    }) # END sp_code render Leaflet
    
  }) # END sp_code observeEvent
  
  
  ## ======================================================
  ##                  Map by Scientific Name           ----
  ## ====================================================== 
  observeEvent(input$sci_name_input, {
    
    output$map_output <- renderLeaflet({
      
      validate(need(input$sci_name_input, 'Select a species to begin'))
      
      # clean input 
      cleaned_input <- gsub(" ", "_", input$sci_name_input)
      
      # select raster
      rast <- sci_name_rast_list[[cleaned_input]]
      
      if(input$sci_name_input %in% all_neg_sci_name){
        leaflet() %>% 
          addTiles() %>% 
          #addStarsImage()
          addRasterImage(x = rast, colors = c("#8c2f0e", "#E7844C", "#F0b28F"),
                        opacity = input$map_transparency_input, project = TRUE) %>% 
          addLegend(colors = c("#8c2f0e", "#E7844C", "#F0b28F"),
                    labels = c("High", "Moderate", "Low"),
                    values = values(rast),
                    title = "Drought Sensitivity")
      } else {
        leaflet() %>% 
          addTiles() %>% 
          addRasterImage(x = rast, colors = c("#8c2f0e", "#E7844C", "#F0b28F", "#144D6F"),
                        opacity =  input$map_transparency_input, project = TRUE) %>% 
          addLegend(colors = c("#8c2f0e", "#E7844C", "#F0b28F", "#144D6F"),
                    labels = c("High", "Moderate", "Low", "Least Concern"),
                    values = values(rast),
                    title = "Drought Sensitivity")
      }
      
    }) # END scientific_name render Leaflet
    
  }) # END scientific_name observeEvent
  
  
  
  ## ======================================================
  ##                  Map by Common Name               ----
  ## ====================================================== 
  observeEvent(input$common_name_input, {
    
    output$map_output <- renderLeaflet({
      
      validate(need(input$common_name_input, 'Select a species to begin'))
      
      # clean input 
      cleaned_input <- gsub(" ", "_", input$common_name_input)
      
      # select raster
      rast <- common_name_rast_list[[cleaned_input]]
      
      if(input$common_name_input %in% all_neg_common_name){
        leaflet() %>% 
          addTiles() %>% 
          addRasterImage(x = rast, colors = c("#8c2f0e", "#E7844C", "#F0b28F"),
                        opacity = input$map_transparency_input, project = TRUE) %>% 
          addLegend(colors = c("#8c2f0e", "#E7844C", "#F0b28F"),
                    labels = c("High", "Moderate", "Low"),
                    values = values(rast),
                    title = "Drought Sensitivity")
      } else {
        leaflet() %>% 
          addTiles() %>% 
          addRasterImage(x = rast, colors = c("#8c2f0e", "#E7844C", "#F0b28F", "#144D6F"),
                        opacity = input$map_transparency_input, project = TRUE) %>% 
          addLegend(colors = c("#8c2f0e", "#E7844C", "#F0b28F", "#144D6F"),
                    labels = c("High", "Moderate", "Low", "Least Concern"),
                    values = values(rast),
                    title = "Drought Sensitivity")
      }
      
    }) # END common_name render Leaflet
    
  }) # END common_name observeEvent
  
  
  ## ======================================================
  ##                  Dataset Download               ----
  ## ======================================================
  observeEvent(input$download_common_name_input, {
    
    output$reactive_download_table_output <- renderDataTable({
      
      validate(need(input$download_common_name_input, 'Select a species to begin'))
      
      combined_pred %>% 
        filter(common_name %in% input$download_common_name_input)
    })})
  
  observeEvent(input$download_sci_name_input, {
    
    output$reactive_download_table_output <- renderDataTable({
      
      validate(need(input$download_sci_name_input, 'Select a species to begin'))
      
      combined_pred %>% 
        filter(scientific_name %in% input$download_sci_name_input)
    })})
  
  observeEvent(input$download_sp_code_input, {
    
    output$reactive_download_table_output <- renderDataTable
    })
  
  
  ## ======================================================
  ##                button for dashboard              ----
  ## ======================================================
  observeEvent(input$btn, {
    updateTabItems(session, "tabs", "dashboard")
  })
  
  
  
  
} # END SERVER